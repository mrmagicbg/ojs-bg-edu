# Backup & Restore

## 1. Components to Protect
- Database (`ojs` schema)
- Files directory (`/var/ojs-files`)
- Public files (`public/`)
- Config: `config.inc.php`
- Custom plugins/themes

## 2. Backup Script Example
`/usr/local/sbin/backup_ojs.sh` (conceptual):
```bash
#!/usr/bin/env bash
set -euo pipefail
TS=$(date +%F-%H%M)
BACKUP_ROOT=/var/backups/ojs
mkdir -p "$BACKUP_ROOT"

# Database
mysqldump --single-transaction --quick --routines ojs > "$BACKUP_ROOT/db-$TS.sql"

# Files
sudo tar -czf "$BACKUP_ROOT/files-$TS.tgz" /var/ojs-files
sudo tar -czf "$BACKUP_ROOT/public-$TS.tgz" -C /var/www/ojs public

# Config & meta
cp /var/www/ojs/config.inc.php "$BACKUP_ROOT/config-$TS.inc.php"

# Prune (keep 30 daily)
find "$BACKUP_ROOT" -type f -mtime +30 -delete
```

Cron:
```bash
sudo chmod 750 /usr/local/sbin/backup_ojs.sh
sudo crontab -e
0 2 * * * /usr/local/sbin/backup_ojs.sh >> /var/log/backup_ojs.log 2>&1
```

## 3. Offsite Sync
Use rclone or rsync over SSH to secondary location (encrypted if policy requires).

## 4. Restore Procedure (Disaster)
1. Provision clean host.
2. Install stack (follow install guide).
3. Create empty database.
4. Import latest SQL dump:
```bash
mysql ojs < db-YYYY-MM-DD-HHMM.sql
```
5. Restore files:
```bash
tar -xzf files-YYYY-MM-DD-HHMM.tgz -C /
tar -xzf public-YYYY-MM-DD-HHMM.tgz -C /var/www/ojs
```
6. Place `config.inc.php`.
7. Adjust ownership & permissions.
8. Test application.

## 5. Verification
Monthly: simulate restore to staging; verify login, sample article.

Next: `troubleshooting.md`.
