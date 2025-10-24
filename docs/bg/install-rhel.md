# Инсталация – RHEL / AlmaLinux / Rocky

> Навигация: [Назад: Инсталация (Ubuntu)](install-ubuntu.md) | [Индекс](../../README.md#reading-order-document-index) | Следва: [Конфигурация](configuration.md) | Алтернативно: [Инсталация (Ubuntu)](install-ubuntu.md) | EN: [RHEL Installation](../en/install-rhel.md)

Версия: 9.x

## 1. Репозитории и обновления
```bash
sudo dnf -y update
sudo dnf install -y epel-release dnf-plugins-core
```

## 2. Пакети (Nginx + PHP-FPM)
```bash
sudo dnf module reset php -y
sudo dnf module enable php:8.2 -y
sudo dnf install -y nginx php php-fpm php-mysqlnd php-xml php-gd php-curl php-mbstring php-zip php-intl php-ldap php-imagick php-json php-opcache php-bcmath php-gmp php-redis policycoreutils-python-utils firewalld
```
Стартиране на услугите (Забележка: В RHEL услугата обикновено е `php-fpm` без номер на версията):
```bash
sudo systemctl enable --now nginx php-fpm firewalld
```

## 3. SELinux
Оставете Enforcing. Настройте контексти за записваеми директории.

## 4. MariaDB
```bash
sudo dnf install -y mariadb-server
sudo systemctl enable --now mariadb
```

Защита на инсталацията:
```bash
sudo mysql_secure_installation
```
**Препоръчани отговори:**
- `Switch to unix_socket authentication [Y/n]`: **n**
- `Change the root password? [Y/n]`: **n** (ако вече е зададена, иначе **Y**)
- `Remove anonymous users? [Y/n]`: **Y**
- `Disallow root login remotely? [Y/n]`: **Y**
- `Remove test database and access to it? [Y/n]`: **Y**
- `Reload privilege tables now? [Y/n]`: **Y**

> **⚠️ КРИТИЧНО ВАЖНО ЗА СИГУРНОСТТА:**
> **ЗАМЕНЕТЕ `STRONG_PASSWORD_CHANGE_ME` СЪС СИЛНА, УНИКАЛНА ПАРОЛА!**
> Използвайте поне 20+ символа с главни, малки букви, цифри и специални символи.
> Генерирайте с: `openssl rand -base64 32`
> **Съхранете паролата сигурно** - ще Ви трябва в `config.inc.php` по-късно.

Създаване на база данни и потребител:
```bash
sudo mysql -u root -p
```
```sql
CREATE DATABASE ojs CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'ojs'@'localhost' IDENTIFIED BY 'STRONG_PASSWORD_CHANGE_ME';
GRANT ALL PRIVILEGES ON ojs.* TO 'ojs'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```

**За промяна на паролата на OJS потребителя по-късно:**
```sql
-- Влезте като root
sudo mysql -u root -p

-- Променете паролата
ALTER USER 'ojs'@'localhost' IDENTIFIED BY 'НОВА_СИЛНА_ПАРОЛА';
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

## 6. Потребител и директории
```bash
sudo useradd --system --create-home --shell /sbin/nologin ojs
sudo mkdir -p /var/www/ojs /var/ojs-files
sudo chown -R ojs:ojs /var/www/ojs /var/ojs-files
chmod 750 /var/ojs-files
```

## 7. Изтегляне на OJS
```
cd /tmp
curl -LO https://pkp.sfu.ca/ojs/download/ojs-3.5.0-1.tar.gz
sudo tar -xzf ojs-3.5.0-1.tar.gz -C /var/www/ojs --strip-components=1
sudo chown -R ojs:ojs /var/www/ojs
```

## 8. Nginx конфигурация

Създайте конфигурационния файл на сайта `/etc/nginx/conf.d/ojs.conf` (RHEL използва `conf.d/` вместо `sites-available/`):

**Вариант 1 — Използвайте текстов редактор:**
```bash
sudo nano /etc/nginx/conf.d/ojs.conf
# или
sudo vim /etc/nginx/conf.d/ojs.conf
```

**Вариант 2 — Създайте с here-doc:**
```bash
sudo tee /etc/nginx/conf.d/ojs.conf > /dev/null <<'EOF'
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
        include fastcgi_params;
        fastcgi_pass unix:/run/php-fpm/www.sock;  # RHEL стандартен socket път
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    }

    location ~* \.(js|css|png|jpg|jpeg|gif|ico|svg)$ {
        expires 7d;
        add_header Cache-Control "public";
    }

    access_log /var/log/nginx/ojs.access.log;
    error_log /var/log/nginx/ojs.error.log warn;
}
EOF
```

**Тествайте и презаредете Nginx:**
```bash
sudo nginx -t && sudo systemctl reload nginx
```

## 9. SELinux контексти
```bash
sudo semanage fcontext -a -t httpd_sys_rw_content_t "/var/www/ojs/(cache|public|plugins)(/.*)?"
sudo semanage fcontext -a -t httpd_sys_rw_content_t "/var/ojs-files(/.*)?"
sudo restorecon -Rv /var/www/ojs /var/ojs-files
```

## 10. Firewall
```bash
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --reload
```

## 11. HTTPS
```bash
sudo dnf install -y certbot python3-certbot-nginx
sudo certbot --nginx -d journals.example.edu --redirect --hsts --staple-ocsp --email admin@example.edu --agree-tos --no-eff-email
```

---
> Prev: [Installation (Ubuntu)](install-ubuntu.md) | Next: [Configuration](configuration.md) | Index: [Document Index](../../README.md#reading-order-document-index) | BG: [Инсталация RHEL](../bg/install-rhel.md)

