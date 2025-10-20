# Open Journal Systems (OJS) Deployment Playbook – Overview

Status: Draft (v0.1.0)
Target OJS Version: 3.5.0-1

This playbook provides a comprehensive, operations-oriented procedure to deploy and operate PKP's Open Journal Systems (OJS) with English and Bulgarian language support in a university (on‑prem or hybrid) environment.

## Document Map
- prerequisites.md
- install-ubuntu.md
- install-rhel.md
- configuration.md
- language-packs.md
- security-hardening.md
- publishing-campus-network.md
- maintenance-upgrades.md
- backup-restore.md
- troubleshooting.md
- appendix-checklists.md

## Supported Distributions
Primary: Ubuntu Server LTS (focus)
Secondary (notes only): Debian, RHEL / AlmaLinux / Rocky, openSUSE Leap

## Roles & Audience
- System Administrator (Linux, network, security duties)
- Application Administrator (journal setup, plugin management)
- Database Administrator (optional split role)
- Local IT Security / Compliance Officer

## High-Level Phases
1. Plan & prepare (capacity, DNS, certificates, backups)
2. Provision OS & baseline hardening
3. Install stack (Web server, PHP, DB, mail, caching, optional search)
4. Deploy OJS codebase & set file permissions
5. Run web installer (or CLI install if available)
6. Install and enable language packs (English + Bulgarian)
7. Post-install configuration (journals, email, security settings)
8. Publish service to campus / public internet
9. Operationalize (monitoring, logging, backup, patch cadence)

## Key Architectural Choices
| Component | Recommended | Alternatives |
|-----------|-------------|--------------|
| Web Tier | Nginx + PHP-FPM | Apache (mod_php or php-fpm) |
| Database | MariaDB 10.11+ | MySQL 8.x, PostgreSQL 14+ |
| Cache | Redis (sessions, object cache) | APCu (local), Memcached |
| Search (optional) | ElasticSearch plugin | native MySQL fulltext |
| TLS | Let’s Encrypt (certbot) | University CA, reverse proxy offload |

## Data Classification & Security
- Journal content may include unpublished manuscripts – treat as confidential.
- Ensure backups encrypted at rest and transported securely offsite.

## Not in Scope (but referenced)
- OJS customization/theme development.
- Advanced editorial workflow training.

## Next Step
Continue with `prerequisites.md`.
