# Основна конфигурация

> Навигация: [Назад: Инсталация (RHEL)](install-rhel.md) | [Индекс](../../README.md#reading-order-document-index) | Следва: [Езикови пакети](language-packs.md) | EN: [Configuration](../en/configuration.md)

Редактирайте `config.inc.php` след инсталация.

## 1. Основни
```
base_url = "https://journals.example.edu"
files_dir = /var/ojs-files
client_charset = utf-8
```

## 2. Локализация
```
locale = en_US
installed_locales = en_US;bg_BG
supported_locales = en_US;bg_BG
```

## 3. Сигурност
```
force_ssl = On
session_cookie_secure = On
session_lifetime = 7200
```

## 4. Email
```
[email]
smtp = On
smtp_server = smtp.university.edu
smtp_port = 587
smtp_auth = PLAIN
smtp_username = no-reply@university.edu
smtp_password = CHANGE_ME
smtp_encryption = tls
```

## 5. Кеш
Пример с Redis (валидирайте със версията на OJS).

## 6. Права върху файлове
Ограничете запис до `cache/`, `public/`, `plugins/` и директорията за файлове.

## 7. Cron
```bash
crontab -u www-data -e
0 * * * * php /var/www/ojs/tools/runScheduledTasks.php
```

## 8. Логове
Logrotate конфигурация според нуждите.

---
> Prev: [Installation (RHEL)](install-rhel.md) | Next: [Language Packs](language-packs.md) | Index: [Document Index](../../README.md#reading-order-document-index) | BG: [Конфигурация](../bg/configuration.md)

