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
sudo dnf install -y nginx php php-fpm php-mysqlnd php-xml php-gd php-curl php-mbstring php-zip php-intl php-ldap php-imagick php-json php-opcache php-bcmath php-gmp php-redis policycoreutils-python-utils firewalld
```
Start services (Note: On RHEL, the service is typically `php-fpm` without version number):
```bash
sudo systemctl enable --now nginx php-fpm firewalld
```

## 3. SELinux Contexts
Keep SELinux enforcing. Later adjust contexts for writable dirs.

## 4. Database (MariaDB)
```bash
sudo dnf install -y mariadb-server
sudo systemctl enable --now mariadb
```

Secure the installation:
```bash
sudo mysql_secure_installation
```
**Recommended answers:**
- `Switch to unix_socket authentication [Y/n]`: **n** (already protected)
- `Change the root password? [Y/n]`: **n** (if already set, otherwise **Y**)
- `Remove anonymous users? [Y/n]`: **Y**
- `Disallow root login remotely? [Y/n]`: **Y**
- `Remove test database and access to it? [Y/n]`: **Y**
- `Reload privilege tables now? [Y/n]`: **Y**

> **⚠️ CRITICAL SECURITY WARNING:**
> **REPLACE `CHANGE_ME_STRONG_PASSWORD` WITH A STRONG, UNIQUE PASSWORD!**
> Use at least 20+ characters with uppercase, lowercase, numbers, and symbols.
> Generate one with: `openssl rand -base64 32`
> **Store this password securely** - you'll need it in `config.inc.php` later.

Create database & user:
```bash
sudo mysql -u root -p
```
```sql
CREATE DATABASE ojs CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'ojs'@'localhost' IDENTIFIED BY 'CHANGE_ME_STRONG_PASSWORD';
GRANT ALL PRIVILEGES ON ojs.* TO 'ojs'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```

**To change the OJS database user password later:**
```sql
-- Access MySQL as root
sudo mysql -u root -p

-- Change password
ALTER USER 'ojs'@'localhost' IDENTIFIED BY 'NEW_STRONG_PASSWORD';
FLUSH PRIVILEGES;
EXIT;
```

## 5. Redis
```bash
sudo dnf install -y redis php-redis
# Start and enable Redis. On RHEL the service is commonly `redis` but on
# Debian/Ubuntu the package provides `redis-server.service` — you may see
# an alias-related warning when enabling by alias name.
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
