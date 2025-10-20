# ojs-bg-edu

Deployment playbook and localization resources for installing and operating Open Journal Systems (OJS) 3.5.0 with English and Bulgarian language support in academic / on‑prem environments.

## Highlights
- Ubuntu Server LTS focused walkthrough (with RHEL/Debian notes)
- Full stack: Nginx/Apache, PHP-FPM, MariaDB/PostgreSQL, Redis, TLS
- Secure configuration & hardening guidelines
- English + Bulgarian language enablement
- Campus network publishing & reverse proxy patterns
- Maintenance, upgrades, backup/restore runbooks
- Dual-language documentation (English in `docs/en`, Bulgarian in `docs/bg`)

## Document Map
Core overview: `docs/en/overview.md`
Version & compatibility: `docs/en/version-matrix.md`
Contributing: `CONTRIBUTING.md` (BG: `docs/bg/contributing.md`)
Code of Conduct: `CODE_OF_CONDUCT.md` (BG summary: `docs/bg/code-of-conduct-summary.md`)

## Quick Start (Ubuntu LTS)
```bash
# System prep
sudo apt update && sudo apt -y upgrade
sudo apt install -y nginx php-fpm mariadb-server redis-server \
  php-cli php-mysql php-xml php-gd php-curl php-mbstring php-zip php-intl php-ldap php-imagick php-json php-opcache

# DB (MariaDB) – run mysql_secure_installation then create DB/user
# Download OJS
cd /tmp && curl -LO https://pkp.sfu.ca/ojs/download/ojs-3.5.0.tar.gz
sudo mkdir -p /var/www/ojs /var/ojs-files
sudo tar -xzf ojs-3.5.0.tar.gz -C /var/www/ojs --strip-components=1

# Configure Nginx, adjust PHP, visit installer
```
Adjust if a newer 3.5.x patch version is released; always verify checksum from PKP.

## Localization
Install Bulgarian locale via the OJS Admin interface (Administration > Languages). Then update `config.inc.php` to include `bg_BG` in installed and supported locales.

## Licensing
- Documentation: CC BY 4.0
- Example scripts/config: GPL v3 (or later)
- OJS itself: GPL v3 (PKP). Retain original notices.

See `LICENSE` and `docs/LICENSE-*` for details.

## Contributing
Draft improvements via pull request. For Bulgarian translation fixes, edit the corresponding `docs/bg` file and keep English in sync where structural changes occur.

## Change Log
See `CHANGELOG.md` (Keep a Changelog format, Semantic Versioning).

## Attribution
Open Journal Systems (OJS) © Public Knowledge Project (PKP) – https://pkp.sfu.ca/

## Roadmap
- [ ] Verify actual release date for 3.5.0
- [ ] Add monitoring sample dashboards (Prometheus/Grafana)
- [ ] Optional automation (Ansible) (out of current scope per request)

## Disclaimer
This repository is an operations companion resource and does not bundle OJS source code.
