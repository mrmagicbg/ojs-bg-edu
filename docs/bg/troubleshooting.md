# Отстраняване на проблеми

> Навигация: [Назад: Резервни копия](backup-restore.md) | [Индекс](../../README.md#reading-order-document-index) | Следва: [Контролни списъци](appendix-checklists.md) | EN: [Troubleshooting](../en/troubleshooting.md)

## 1. Чести проблеми
| Проблем | Симптом | Решение |
|---------|---------|---------|
| Права | 500 грешки | Проверете ownership |
| Колация | Символи | utf8mb4 |
| Липсва разширение | Fatal error | Инсталирайте PHP модул |

## 2. Логове
- Nginx: `/var/log/nginx/ojs.error.log`
- PHP-FPM: `/var/log/php8.3-fpm.log` (Ubuntu/Debian) или `journalctl -u php8.3-fpm`
  - На RHEL: `/var/log/php-fpm/` или `journalctl -u php-fpm`
- OJS логове: `cache/` или `files/usageStats/`

## 3. Повече детайли
Slow log в конфигурацията на pool (`/etc/php/8.3/fpm/pool.d/www.conf` Ubuntu или `/etc/php-fpm.d/www.conf` RHEL):
```
request_slowlog_timeout = 5s
slowlog = /var/log/php8.3-fpm/slow.log
```
Презареждане: `sudo systemctl reload php8.3-fpm` (или `php-fpm` на RHEL)

## 4. БД диагностика
`SHOW PROCESSLIST;`

## 5. Кеш изчистване
`rm -rf /var/www/ojs/cache/*`

---
> Назад: [Резервни копия](backup-restore.md) | Следва: [Контролни списъци](appendix-checklists.md) | Индекс: [Document Index](../../README.md#reading-order-document-index) | EN: [Troubleshooting](../en/troubleshooting.md)
