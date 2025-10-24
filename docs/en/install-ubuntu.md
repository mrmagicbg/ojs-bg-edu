# Installation – Ubuntu Server (LTS)

> Navigation: [Prev: Prerequisites](prerequisites.md) | [Index](../../README.md#reading-order-document-index) | Next: [Installation (RHEL / AlmaLinux / Rocky)](install-rhel.md) | BG: [Инсталация Ubuntu](../bg/install-ubuntu.md)

Tested Target: Ubuntu 24.04 LTS (adjust if using 22.04)
Using OJS version 3.5.0 (verify latest at https://pkp.sfu.ca/ojs/ojs_download/ before deployment).

## 1. Update System & Enable Repos
```bash
sudo apt update && sudo apt -y upgrade
sudo apt install -y software-properties-common curl gnupg lsb-release ca-certificates unzip zip tar
```

## 2. Install Web & PHP Stack (Nginx + PHP-FPM)
```bash
sudo apt install -y nginx php-fpm php-cli php-mysql php-xml php-gd php-curl php-mbstring php-zip php-intl php-ldap php-imagick php-xmlrpc php-soap php-json php-opcache php-bcmath php-gmp
```
(Adjust modules to match OJS release notes; some may be optional.)

Harden PHP (edit `/etc/php/*/fpm/php.ini`):
```
expose_php = Off
memory_limit = 512M
post_max_size = 64M
upload_max_filesize = 64M
max_execution_time = 120
max_input_vars = 3000
opcache.enable=1
opcache.memory_consumption=128
```
Reload (replace `8.3` with your PHP version):
```bash
sudo systemctl reload php8.3-fpm
```

## 3. Install Database (MariaDB)
```bash
sudo apt install -y mariadb-server mariadb-client
sudo systemctl enable --now mariadb
sudo mysql_secure_installation
```
Create database & user:
```sql
CREATE DATABASE ojs CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'ojs'@'localhost' IDENTIFIED BY 'CHANGE_ME_STRONG_PASSWORD';
GRANT ALL PRIVILEGES ON ojs.* TO 'ojs'@'localhost';
FLUSH PRIVILEGES;
```
Access SQL shell:
```bash
sudo mysql -u root -p
```

## 4. (Optional) PostgreSQL
```bash
sudo apt install -y postgresql postgresql-contrib
sudo -u postgres createuser -P ojs
sudo -u postgres createdb -O ojs ojs -E UTF8
```

## 5. Redis (Sessions / Cache)
```bash
sudo apt install -y redis-server
sudo sed -i 's/^supervised no/supervised systemd/' /etc/redis/redis.conf
sudo systemctl enable --now redis
```
PHP extension (if not already): `sudo apt install -y php-redis`

## 6. Create OJS System User & Directories
```bash
sudo adduser --system --group --home /var/www/ojs ojs
sudo mkdir -p /var/www/ojs/public
sudo mkdir -p /var/ojs-files
sudo chown -R ojs:ojs /var/www/ojs /var/ojs-files
sudo chmod 750 /var/ojs-files
```
`/var/ojs-files` must be outside web root.

## 7. Download OJS Release
```bash
cd /tmp
curl -LO https://pkp.sfu.ca/ojs/download/ojs-3.5.0-1.tar.gz
sudo tar -xzf ojs-3.5.0-1.tar.gz -C /var/www/ojs --strip-components=1
sudo chown -R ojs:ojs /var/www/ojs
```

## 8. Configure Nginx
`/etc/nginx/sites-available/ojs.conf`:
```
server {
    listen 80;
    server_name journals.example.edu;
    root /var/www/ojs;
    index index.php;

    client_max_body_size 64M;

    location ~ ^/files/ { deny all; }

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php8.3-fpm.sock; # adjust version (8.1, 8.2, 8.3)
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }

    location ~* \.(js|css|png|jpg|jpeg|gif|ico|svg)$ {
        expires 7d;
        add_header Cache-Control "public";
    }

    access_log /var/log/nginx/ojs.access.log;
    error_log /var/log/nginx/ojs.error.log warn;
}
```
Enable site:
```bash
sudo ln -s /etc/nginx/sites-available/ojs.conf /etc/nginx/sites-enabled/
sudo nginx -t && sudo systemctl reload nginx
```

## 9. Permissions
Writable: `config.inc.php` (temporarily during install), `cache/`, `public/`, `plugins/` where updates occur.
```bash
sudo chown -R ojs:ojs /var/www/ojs
find /var/www/ojs -type f -exec chmod 640 {} \;
find /var/www/ojs -type d -exec chmod 750 {} \;
```
Adjust for web server group (e.g., `www-data`):
```bash
sudo usermod -a -G ojs www-data
sudo chmod g+rx /var/www/ojs
```

## 10. Run Web Installer
Browse: `http://journals.example.edu/`
Provide:
- Database type + credentials
- Files directory: `/var/ojs-files`
- Locale: English (primary) (Bulgarian added later)
- Administrator account

## 11. Post-Install Hardening
```bash
sudo chmod 640 /var/www/ojs/config.inc.php
```
Move `docs/` if public exposure undesired:
```bash
sudo mv /var/www/ojs/docs /var/www/ojs_priv_docs
```

## 12. Enable HTTPS (Let’s Encrypt)
```bash
sudo apt install -y certbot python3-certbot-nginx
sudo certbot --nginx -d journals.example.edu --redirect --hsts --staple-ocsp --email admin@example.edu --agree-tos --no-eff-email
```
Auto-renew check: `sudo systemctl list-timers | grep certbot`

---
> Prev: [Prerequisites](prerequisites.md) | Next: [Installation (RHEL / AlmaLinux / Rocky)](install-rhel.md) | Alt Path: [Configuration](configuration.md) | Index: [Document Index](../../README.md#reading-order-document-index) | BG: [Инсталация Ubuntu](../bg/install-ubuntu.md)
