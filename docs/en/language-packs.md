# Language Packs (English & Bulgarian)

## 1. Overview
English is bundled. Bulgarian (bg_BG) may require installation via the OJS administration interface or via CLI depending on version.

## 2. Install via Web UI
1. Log in as Site Administrator.
2. Go to: Administration > Site Settings > Languages (or similar path; UI labels may vary slightly).
3. Click "Install Locale" and select Bulgarian (bg_BG).
4. After installation, check both boxes to enable for UI and submissions.
5. Set primary locale (leave English primary unless institution chooses Bulgarian).

## 3. Enable for Journals
Per journal: Settings > Website > Setup (or Languages section) – enable bg_BG.

## 4. Command Line Method (If Supported)
If OJS version provides a CLI script (example path; verify actual script name):
```bash
php /var/www/ojs/tools/upgrade.php installLocale bg_BG
```
Or plugin-based:
```bash
php /var/www/ojs/tools/upgrade.php upgradeLocale bg_BG
```
Check `tools/` directory for available scripts.

## 5. Add to config.inc.php
Ensure:
```
installed_locales = en_US;bg_BG
supported_locales = en_US;bg_BG
```

## 6. Translate Email Templates
Navigate: Administration > Prepared Emails. Switch locale and review default translations. Customize as needed.

## 7. Date/Time & UTF-8
System locale (OS):
```bash
sudo locale-gen bg_BG.UTF-8
sudo update-locale
```
Verify PHP sees locale:
```bash
php -r 'print_r(localeconv());'
```

## 8. Testing
- Switch UI language via selector.
- Create a test journal and submission in Bulgarian.
- Verify PDFs & metadata display correctly.

## 9. Common Issues
| Symptom | Cause | Fix |
|---------|-------|-----|
| Locale not listed | Missing pack | Reinstall via UI or CLI |
| Garbled characters | DB collation wrong | Ensure utf8mb4 on all tables |
| Partial translation | Incomplete upstream locale | Contribute updates to PKP | 

Next: `security-hardening.md`.
