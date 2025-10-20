# ojs-bg-edu

Deployment playbook and localization resources for installing and operating Open Journal Systems (OJS) 3.5.0-1 with fully parallel English and Bulgarian documentation for academic / on‑prem environments.

This repository provides two complete documentation trees: English (`docs/en`) and Bulgarian (`docs/bg`). Each guide is translated so university administrators can perform deployment, configuration, and operations tasks in their preferred language.

## Highlights
- Ubuntu Server LTS focused walkthrough (with RHEL/Debian notes)
- Full stack: Nginx/Apache, PHP-FPM, MariaDB/PostgreSQL, Redis, TLS
- Secure configuration & hardening guidelines
- English + Bulgarian language enablement
- Campus network publishing & reverse proxy patterns
- Maintenance, upgrades, backup/restore runbooks
- Dual-language documentation (English in `docs/en`, Bulgarian in `docs/bg`)

## Reading Order (Document Index)
1. Overview / Архитектура – [English](docs/en/overview.md) (BG: [български](docs/bg/overview.md))
2. Prerequisites & Planning / Предпоставки – [English](docs/en/prerequisites.md) (BG: [български](docs/bg/prerequisites.md))
3. Version & Compatibility Matrix / Съвместимост – [English](docs/en/version-matrix.md) (BG: [български](docs/bg/version-matrix.md))
4. Installation (Ubuntu) – [English](docs/en/install-ubuntu.md) (BG: [български](docs/bg/install-ubuntu.md))
5. Installation (RHEL / AlmaLinux / Rocky) – [English](docs/en/install-rhel.md) (BG: [български](docs/bg/install-rhel.md))
6. Configuration – [English](docs/en/configuration.md) (BG: [български](docs/bg/configuration.md))
7. Language Packs – [English](docs/en/language-packs.md) (BG: [български](docs/bg/language-packs.md))
8. Security Hardening – [English](docs/en/security-hardening.md) (BG: [български](docs/bg/security-hardening.md))
9. Publishing (Campus / Internet) – [English](docs/en/publishing-campus-network.md) (BG: [български](docs/bg/publishing-campus-network.md))
10. Maintenance & Upgrades – [English](docs/en/maintenance-upgrades.md) (BG: [български](docs/bg/maintenance-upgrades.md))
11. Backup & Restore – [English](docs/en/backup-restore.md) (BG: [български](docs/bg/backup-restore.md))
12. Troubleshooting – [English](docs/en/troubleshooting.md) (BG: [български](docs/bg/troubleshooting.md))
13. Checklists – [English](docs/en/appendix-checklists.md) (BG: [български](docs/bg/appendix-checklists.md))
14. Release Notes Summary – [English](docs/en/release-notes-3.5.md) (BG: [български](docs/bg/release-notes-3.5.md))
15. Contributing – [Bilingual](CONTRIBUTING.md)
16. Code of Conduct – [Bilingual](CODE_OF_CONDUCT.md)

All command-level implementation details are intentionally kept inside the specific guide documents to keep this README high-level.

## Localization
Bulgarian (bg_BG) language enablement steps are described in the language packs guide. Both English and Bulgarian tutorials mirror each other to simplify training and maintenance.

## Licensing
- Documentation: CC BY 4.0
- Example scripts/config: GPL v3 (or later)
- OJS itself: GPL v3 (PKP). Retain original notices.

See the consolidated [LICENSE](LICENSE) for details.

## Contributing
Draft improvements via pull request. For Bulgarian translation fixes, edit the corresponding `docs/bg` file and keep English in sync where structural changes occur.

## Change Log
See `CHANGELOG.md` (Keep a Changelog format, Semantic Versioning).

## Attribution
Open Journal Systems (OJS) © Public Knowledge Project (PKP) – https://pkp.sfu.ca/

## Roadmap
- [ ] Verify actual release date for 3.5.0-1
- [ ] Add monitoring sample dashboards (Prometheus/Grafana)
- [ ] Optional automation (Ansible) (out of current scope per request)

## Disclaimer
This repository is an operations companion resource and does not bundle OJS source code.
