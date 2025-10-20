# Инсталация – Ubuntu Server (LTS)

> Навигация: [Назад: Изисквания](prerequisites.md) | [Индекс](../../README.md#reading-order-document-index) | Следва: [Инсталация (RHEL / AlmaLinux / Rocky)](install-rhel.md) | EN: [Ubuntu Installation](../en/install-ubuntu.md)

Тестова версия: Ubuntu 24.04 LTS
Използва се OJS версия 3.5.0 (проверете за по-нова пач версия преди внедряване).

## 1. Обновяване на системата
```bash
sudo apt update && sudo apt -y upgrade
sudo apt install -y software-properties-common curl gnupg lsb-release ca-certificates unzip zip tar
```

## 2. Уеб и PHP (Nginx + PHP-FPM)
```bash
sudo apt install -y nginx php-fpm php-cli php-mysql php-xml php-gd php-curl php-mbstring php-zip php-intl php-ldap php-imagick php-xmlrpc php-soap php-json php-opcache php-bcmath php-gmp
```
Корекции в `/etc/php/*/fpm/php.ini` (пример):
```
expose_php = Off
memory_limit = 512M
post_max_size = 64M
upload_max_filesize = 64M
max_execution_time = 120
```

## 3. База данни (MariaDB)
```bash
sudo apt install -y mariadb-server mariadb-client
sudo systemctl enable --now mariadb
sudo mysql_secure_installation
```
SQL:
```sql
CREATE DATABASE ojs CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'ojs'@'localhost' IDENTIFIED BY 'STRONG_PASSWORD_CHANGE_ME';
GRANT ALL PRIVILEGES ON ojs.* TO 'ojs'@'localhost';
FLUSH PRIVILEGES;
```

## 4. Redis
```bash
sudo apt install -y redis-server php-redis
```

## 5. Потребител и директории
```bash
sudo adduser --system --group --home /var/www/ojs ojs
sudo mkdir -p /var/www/ojs/public /var/ojs-files
sudo chown -R ojs:ojs /var/www/ojs /var/ojs-files
chmod 750 /var/ojs-files
```

## 6. Изтегляне на OJS
```bash
cd /tmp
curl -LO https://pkp.sfu.ca/ojs/download/ojs-3.5.0-1.tar.gz
sudo tar -xzf ojs-3.5.0-1.tar.gz -C /var/www/ojs --strip-components=1
sudo chown -R ojs:ojs /var/www/ojs
```

## 7. Nginx конфигурация
`/etc/nginx/sites-available/ojs.conf` (аналогично на английската версия).

## 8. Права
Ограничете до необходимите директории за запис.

## 9. Уеб инсталатор
Отворете `http://journals.example.edu/` и попълнете формата.

## 10. HTTPS
```bash
sudo apt install -y certbot python3-certbot-nginx
sudo certbot --nginx -d journals.example.edu --redirect --hsts --staple-ocsp --email admin@example.edu --agree-tos --no-eff-email
```

---
> Назад: [Изисквания](prerequisites.md) | Следва: [Инсталация (RHEL / AlmaLinux / Rocky)](install-rhel.md) | Алтернативно: [Конфигурация](configuration.md) | Индекс: [Document Index](../../README.md#reading-order-document-index) | EN: [Ubuntu Installation](../en/install-ubuntu.md)
