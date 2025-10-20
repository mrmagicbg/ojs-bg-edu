# Core Configuration

Edit `config.inc.php` after install.

## 1. Base Settings
```
base_url = "https://journals.example.edu"
files_dir = /var/ojs-files
client_charset = utf-8
connection_charset = utf-8
```

## 2. Localization
```
locale = en_US
installed_locales = en_US;bg_BG
supported_locales = en_US;bg_BG
```
Bulgarian added after language pack installation.

## 3. Security
```
force_ssl = On
session_cookie_secure = On
session_lifetime = 7200
```
Set `encryption` (if present) to a strong setting or leave default.

## 4. Email
Configure SMTP relay:
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
Test via UI or CLI (plugin if available).

## 5. Cache
Enable file or Redis (if plugin / integration supports). Example (pseudo):
```
[cache]
cache = redis
redis_host = 127.0.0.1
redis_port = 6379
```
(Validate with current OJS documentation; adjust keys.)

## 6. File Permissions
Writable by web server group only for dynamic dirs: `cache/`, `public/`, `plugins/`, `registry/` (verify), and files directory.

## 7. Cron / Scheduled Tasks
Set up scheduled tasks (if using `scheduled_tasks`):
```bash
crontab -u www-data -e
# Example (hourly)
0 * * * * php /var/www/ojs/tools/runScheduledTasks.php
```

## 8. Logging
Centralize Nginx/PHP logs. Consider logrotate adjustments:
`/etc/logrotate.d/ojs`:
```
/var/log/nginx/ojs.*log {
    weekly
    rotate 12
    compress
    missingok
    notifempty
    postrotate
        systemctl reload nginx > /dev/null 2>&1 || true
    endscript
}
```

## 9. Plugins
Review official plugin gallery. Disable unused to reduce attack surface.

Next: `language-packs.md`.
