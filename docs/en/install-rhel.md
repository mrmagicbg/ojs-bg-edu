# Installation – RHEL / AlmaLinux / Rocky

> Navigation: [Prev: Installation (Ubuntu)](install-ubuntu.md) | [Index](../../README.md#reading-order-document-index) | Next: [Configuration](configuration.md) | BG: [Инсталация RHEL](../bg/install-rhel.md)

Assumed Version: 9.x

## 1. Repos & Updates
```bash
sudo dnf -y update
sudo dnf install -y epel-release
sudo dnf install -y dnf-plugins-core
```

## 2. Install Packages (Nginx + PHP-FPM)
```bash
sudo dnf module reset php -y
sudo dnf module enable php:8.2 -y
sudo dnf install -y nginx php php-fpm php-mysqlnd php-xml php-gd php-curl php-mbstring php-zip php-intl php-ldap php-imagick php-json php-opcache php-bcmath php-gmp policycoreutils-python-utils firewalld
```
Start services:
```bash
sudo systemctl enable --now nginx php-fpm firewalld
```

## 3. SELinux Contexts
Keep SELinux enforcing. Later adjust contexts for writable dirs.

## 4. Database (MariaDB)
```bash
sudo dnf install -y mariadb-server
sudo systemctl enable --now mariadb
sudo mysql_secure_installation
```
SQL (same as Ubuntu guide).

## 5. Redis
```bash
sudo dnf install -y redis php-redis
sudo systemctl enable --now redis
```

## 6. User & Directories
```bash
sudo useradd --system --create-home --shell /sbin/nologin ojs
sudo mkdir -p /var/www/ojs /var/ojs-files
sudo chown -R ojs:ojs /var/www/ojs /var/ojs-files
chmod 750 /var/ojs-files
```

## 7. Download OJS
(Replace version)
```bash
cd /tmp
curl -LO https://pkp.sfu.ca/ojs/download/ojs-3.5.0-1.tar.gz
sudo tar -xzf ojs-3.5.0-1.tar.gz -C /var/www/ojs --strip-components=1
sudo chown -R ojs:ojs /var/www/ojs
```

## 8. Nginx Config
Same as Ubuntu with path adjustments.

## 9. SELinux Adjustments
```bash
sudo semanage fcontext -a -t httpd_sys_rw_content_t "/var/www/ojs/(cache|public|plugins)(/.*)?"
sudo semanage fcontext -a -t httpd_sys_rw_content_t "/var/ojs-files(/.*)?"
sudo restorecon -Rv /var/www/ojs /var/ojs-files
```
If using Apache (alternative), manage `httpd_t` contexts similarly.

## 10. Firewall
```bash
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --reload
```

## 11. HTTPS (Certbot)
```bash
sudo dnf install -y certbot python3-certbot-nginx
sudo certbot --nginx -d journals.example.edu --redirect --hsts --staple-ocsp --email admin@example.edu --agree-tos --no-eff-email
```

---
> Prev: [Installation (Ubuntu)](install-ubuntu.md) | Next: [Configuration](configuration.md) | Index: [Document Index](../../README.md#reading-order-document-index) | BG: [Инсталация RHEL](../bg/install-rhel.md)
