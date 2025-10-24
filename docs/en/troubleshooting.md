# Troubleshooting

> Navigation: [Prev: Backup & Restore](backup-restore.md) | [Index](../../README.md#reading-order-document-index) | Next: [Checklists](appendix-checklists.md) | BG: [Отстраняване на проблеми](../bg/troubleshooting.md)

## 1. Common Issues
| Issue | Symptom | Resolution |
|-------|---------|------------|
| Permissions | 500 errors / cannot upload | Verify ownership/group of writable dirs |
| Database collation | Garbled characters | Ensure utf8mb4_* on DB/tables |
| PHP missing extension | Fatal error call to undefined function | Install required PHP module & reload FPM |
| Large uploads fail | Upload stalls | Increase `client_max_body_size`, `upload_max_filesize` |
| Session loss | Users logged out | Configure Redis/APCu, check cookie domain |
| Locale missing | Not selectable | Install via Admin panel |
| Upgrade stuck | Maintenance banner persists | Clear cache, run upgrade script manually |

## 2. Logs Locations
- Nginx: `/var/log/nginx/ojs.error.log`
- PHP-FPM: `/var/log/php8.3-fpm.log` (Ubuntu/Debian with version) or `journalctl -u php8.3-fpm`
  - On RHEL: `/var/log/php-fpm/` or `journalctl -u php-fpm`
- OJS application logs: `cache/` or `files/usageStats/` (depending on feature)

## 3. Increase Verbosity
Enable display_errors temporarily (dev only). Use PHP-FPM slow log in pool config (`/etc/php/8.3/fpm/pool.d/www.conf` on Ubuntu or `/etc/php-fpm.d/www.conf` on RHEL):
```
request_slowlog_timeout = 5s
slowlog = /var/log/php8.3-fpm/slow.log
```
Reload: `sudo systemctl reload php8.3-fpm` (or `php-fpm` on RHEL)

## 4. Database Diagnostics
```sql
SHOW PROCESSLIST;
SHOW GLOBAL STATUS LIKE 'Threads_running';
```
Add indexes if slow queries identified (consult schema docs).

## 5. Cache Clear
Remove compiled templates (path may vary):
```bash
rm -rf /var/www/ojs/cache/*
```

## 6. Health Check Script (Example)
```bash
#!/usr/bin/env bash
URL="https://journals.example.edu/login"
status=$(curl -k -o /dev/null -s -w "%{http_code}" "$URL")
[[ "$status" == "200" ]] || echo "Health check failed: $status" >&2
```

---
> Prev: [Backup & Restore](backup-restore.md) | Next: [Checklists](appendix-checklists.md) | Index: [Document Index](../../README.md#reading-order-document-index) | BG: [Отстраняване на проблеми](../bg/troubleshooting.md)
