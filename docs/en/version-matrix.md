# Version & Compatibility Matrix (OJS 3.5.x)

| OJS Version | Release Date* | Min PHP | Recommended PHP | Database (Tested) | Notes |
|-------------|---------------|---------|-----------------|-------------------|-------|
| 3.5.0 | 2025-??-?? | 8.0 | 8.2 | MariaDB 10.6–10.11, MySQL 8.0, PostgreSQL 14–16 | Use utf8mb4; verify plugin compatibility |

*Replace with actual release date when confirmed.

## PHP Extensions Required
mbstring, xml, gd, curl, zip, intl, json, mysqli or pdo_mysql (or pgsql), openssl, fileinfo, exif (optional), imagick (recommended).

## Recommended Stack for Production
- OS: Ubuntu 24.04 LTS or RHEL 9.x
- Web: Nginx 1.24+ with PHP-FPM
- Cache: Redis (sessions + object cache if supported)
- TLS: Let’s Encrypt automated renewal

## Upgrade Path
3.4.x -> 3.5.0: follow standard upgrade procedure (backup, deploy new code, run upgrade script).

## Checksums
Always verify tarball SHA256 published by PKP before extraction.

## Future Updates
Document 3.5.x patch releases in table below:
| Patch | Date | Changes (summary) |
|-------|------|-------------------|
| 3.5.1 | TBD  | (Add when released) |
