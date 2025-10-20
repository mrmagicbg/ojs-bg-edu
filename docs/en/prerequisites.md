# Prerequisites & Planning

## 1. Information to Collect
| Item | Example | Notes |
|------|---------|-------|
| FQDN | journals.university.edu | Public DNS + internal split-horizon if needed |
| Environment | Production / Staging | Separate DB and storage recommended |
| Expected journals | 3 initially | Impacts sizing |
| Peak concurrent users | 150 | Estimate for PHP-FPM workers |
| Storage (year 1) | 50 GB | Includes PDFs, images, supplemental data |
| Backup retention | 30 daily, 12 monthly, 7 yearly | Align with policy |
| Email relay | smtp.university.edu:587 | Auth or IP allowlist |
| HTTPS cert source | Let’s Encrypt | Or institutional CA |

## 2. Capacity Planning
| Resource | Baseline (small) | Medium | Notes |
|----------|------------------|--------|-------|
| vCPU | 2 | 4–8 | PHP concurrency |
| RAM | 4 GB | 8–16 GB | DB shared buffer & PHP workers |
| Disk | 80 GB | 200+ GB | Separate volume for `files_dir` |

## 3. Network & Firewall
Inbound (public or campus DMZ):
- 80/tcp (HTTP) – redirect to 443
- 443/tcp (HTTPS)
Internal / Admin:
- 22/tcp (SSH) – restrict by source
- 3306/tcp (MariaDB) – if remote DB, restrict by source
- 6379/tcp (Redis) – bind localhost or private

## 4. DNS
Create A/AAAA records. Optionally create `ojs.` or `journals.` subdomain. Implement DNSSEC if institution supports.

## 5. Time & Locale
Set system timezone (e.g., `Europe/Sofia`). Enable NTP via systemd-timesyncd or chrony.

## 6. Backup Strategy
Daily: database dump + file storage tar (excluding cache/temp)
Weekly: full + integrity verification (test restore)
Monthly: offsite copy
Automation via cron + scripts (`backup-restore.md`).

## 7. Security Baseline
- Enforce SSH key auth (disable password login)
- Fail2ban for SSH and web auth
- Minimal packages (avoid compilers on prod)
- Regular unattended security upgrades (Ubuntu: `unattended-upgrades`)

## 8. Compliance & Logging
Centralize logs (rsyslog forward or Loki/ELK). Retention: 90 days searchable, 1 year archive.

## 9. Decision Log Template
```
Date | Decision | Rationale | Owner
-----|----------|-----------|------
2025-10-20 | Choose MariaDB | Familiarity + package stability | Sysadmin
```

Proceed to `install-ubuntu.md`.
