# Core Configuration

> Navigation: [Prev: Installation (RHEL)](install-rhel.md) | [Index](../../README.md#reading-order-document-index) | Next: [Language Packs](language-packs.md) | BG: [Конфигурация](../bg/configuration.md)

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

## 10. Theme and visual improvements

Yes — there are many themes and packages to improve the visual environment of Open Journal Systems (OJS), including for versions like the one used by `fket.vtu.bg`.

### 🎨 Options to improve the OJS visual environment

#### ✅ Official PKP themes (Public Knowledge Project)
- **Default Bootstrap Theme** – based on Bootstrap 3, with variants such as *Yeti*, *Sandstone*, *Cyborg*, etc.
- **Classic Theme** – a clean layout suitable for academic journals.
- **Health Sciences Theme** – a modern theme tailored for scientific and medical publications.
- **Immersion Theme** – visually rich, emphasizing readability and mobile compatibility.
- **Manuscript and Manuscript-JATS** – optimized for JATS XML and scholarly article workflows.

🔗 These themes are freely available on GitHub: https://github.com/pkp and via theme galleries such as https://ojs-services.com/ojs-themes/ojs-3-theme-gallery/

#### 🛠️ Commercial and custom themes
- Marketplaces and vendors (for example, OpenJournalSystems.com) offer custom themes, installation, and support.
- Commercial themes usually include responsive design and mobile optimization.

### 📌 How to apply a new theme to fket.vtu.bg

1. **Check the OJS version** — most likely OJS 3.x; confirm in the admin panel.
2. **Download the desired theme from GitHub** — e.g. `classic`, `bootstrap3`, `immersion`.
3. **Upload the theme to `/plugins/themes/`** on the server.
4. **Enable the theme in the admin UI** → Settings > Website > Appearance.
5. **Configure colors, fonts and the logo** to match the journal's identity.

### 🔍 Visual improvement recommendations

- **Add a favicon and site logo** to strengthen identity.
- **Use custom CSS rules** for fine-grained adjustments.
- **Integrate Google Fonts** for a modern look.
- **Check mobile compatibility** using tools like Chrome DevTools.

---
> Prev: [Installation (RHEL)](install-rhel.md) | Next: [Language Packs](language-packs.md) | Index: [Document Index](../../README.md#reading-order-document-index) | BG: [Конфигурация](../bg/configuration.md)
