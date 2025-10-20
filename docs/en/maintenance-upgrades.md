# Maintenance & Upgrades

## 1. Routine Tasks
| Frequency | Task |
|----------|------|
| Daily | Check logs, disk usage, backup success |
| Weekly | Apply OS security patches, review failed logins |
| Monthly | Test restore, update OJS minor version (if available) |
| Quarterly | Capacity review, index optimization |
| Yearly | Major version upgrade planning |

## 2. OJS Upgrade Procedure
1. Backup DB & files.
2. Put site in maintenance (if supported) or announce window.
3. Download new tarball.
4. Extract to staging directory.
5. Copy `config.inc.php`, `public/`, custom themes, `plugins/` (selectively) to new tree.
6. Run upgrade script:
```bash
php tools/upgrade.php upgrade
```
7. Verify logs, clear caches.
8. Switch symlink or replace directory atomically.
9. Remove old directory after validation.

## 3. Database Maintenance
MariaDB:
```sql
OPTIMIZE TABLE submissions;
```
(Only if needed; analyze performance first.)

## 4. Log Rotation & Pruning
Ensure logrotate functioning; tune retention to compliance policy.

## 5. Monitoring Metrics
Set alert thresholds: high 5xx rate, DB slow queries > threshold, disk > 80%.

## 6. Patch Management
Track upstream RSS / mailing list for OJS security releases.

## 7. Emergency Rollback
- Retain last 2 full version directories.
- Keep latest DB dump and files tar.
- Document exact upgrade steps and timing.

Next: `backup-restore.md`.
