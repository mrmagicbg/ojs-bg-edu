# ojs-bg-edu

Deployment playbook and localization resources for installing and operating the latest Open Journal Systems (OJS) with English and Bulgarian language support in academic / on‑prem environments.

## Highlights
- Ubuntu Server LTS focused walkthrough (with RHEL/Debian notes)
- Full stack: Nginx/Apache, PHP-FPM, MariaDB/PostgreSQL, Redis, TLS
- Secure configuration & hardening guidelines
- English + Bulgarian language enablement
- Campus network publishing & reverse proxy patterns
- Maintenance, upgrades, backup/restore runbooks
- Dual-language documentation (English in `docs/en`, Bulgarian in `docs/bg`)

## Document Map
See `docs/en/overview.md` (English) and its Bulgarian counterpart once translated.

## Quick Start (Ubuntu LTS)
```bash
# System prep
sudo apt update && sudo apt -y upgrade
sudo apt install -y nginx php-fpm mariadb-server redis-server \
  php-cli php-mysql php-xml php-gd php-curl php-mbstring php-zip php-intl php-ldap php-imagick php-json php-opcache

# DB (MariaDB) – run mysql_secure_installation then create DB/user
# Download OJS
cd /tmp && curl -LO https://pkp.sfu.ca/ojs/download/ojs-X.Y.Z.tar.gz
sudo mkdir -p /var/www/ojs /var/ojs-files
sudo tar -xzf ojs-X.Y.Z.tar.gz -C /var/www/ojs --strip-components=1

# Configure Nginx, adjust PHP, visit installer
```
Replace `X.Y.Z` with latest stable version from PKP.

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
- [ ] Fill in exact latest OJS version
- [ ] Add Bulgarian translations
- [ ] Add optional Ansible playbook
- [ ] Add monitoring sample dashboards (Prometheus/Grafana)

## Disclaimer
This repository is an operations companion resource and does not bundle OJS source code.
