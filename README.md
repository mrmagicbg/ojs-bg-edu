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

Quick post-install check: verify Redis is running with `redis-cli ping` (should return `PONG`) — see Checklists (docs/en/appendix-checklists.md).

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

---

# (BG) Наръчник – ojs-bg-edu

Ръководство за внедряване и локализация на Open Journal Systems (OJS) 3.5.0-1 с пълна паралелна документация на английски и български за академична / локална инфраструктура.

Документацията е организирана в два дървовидни каталога: английски (`docs/en`) и български (`docs/bg`). Всеки раздел е огледално преведен, така че университетски администратори и екипи по поддръжка да могат да изпълняват задачите на предпочитания език.

## Акценти
- Фокус върху Ubuntu Server LTS (с бележки за RHEL/Debian)
- Пълен стек: Nginx/Apache, PHP-FPM, MariaDB/PostgreSQL, Redis, TLS
- Насоки за сигурна конфигурация и укрепване
- Поддръжка на английски и български локал
- Публикуване в кампус и публичен интернет + reverse proxy модели
- Поддръжка, обновления, резервни копия и аварийно възстановяване
- Двуезична структура (английски в `docs/en`, български в `docs/bg`)

Бърза проверка след инсталация: проверете дали Redis работи с `redis-cli ping` (трябва да върне `PONG`) — вижте Контролни списъци (`docs/bg/appendix-checklists.md`).

## Индекс на документите
1. Преглед / Overview – [бг](docs/bg/overview.md) (EN: [English](docs/en/overview.md))
2. Изисквания и планиране / Prerequisites – [бг](docs/bg/prerequisites.md) (EN: [English](docs/en/prerequisites.md))
3. Съвместимост / Version Matrix – [бг](docs/bg/version-matrix.md) (EN: [English](docs/en/version-matrix.md))
4. Инсталация (Ubuntu) – [бг](docs/bg/install-ubuntu.md) (EN: [English](docs/en/install-ubuntu.md))
5. Инсталация (RHEL / AlmaLinux / Rocky) – [бг](docs/bg/install-rhel.md) (EN: [English](docs/en/install-rhel.md))
6. Конфигурация – [бг](docs/bg/configuration.md) (EN: [English](docs/en/configuration.md))
7. Езикови пакети – [бг](docs/bg/language-packs.md) (EN: [English](docs/en/language-packs.md))
8. Укрепване на сигурността – [бг](docs/bg/security-hardening.md) (EN: [English](docs/en/security-hardening.md))
9. Публикуване – [бг](docs/bg/publishing-campus-network.md) (EN: [English](docs/en/publishing-campus-network.md))
10. Поддръжка и обновления – [бг](docs/bg/maintenance-upgrades.md) (EN: [English](docs/en/maintenance-upgrades.md))
11. Резервни копия и възстановяване – [бг](docs/bg/backup-restore.md) (EN: [English](docs/en/backup-restore.md))
12. Отстраняване на проблеми – [бг](docs/bg/troubleshooting.md) (EN: [English](docs/en/troubleshooting.md))
13. Контролни списъци – [бг](docs/bg/appendix-checklists.md) (EN: [English](docs/en/appendix-checklists.md))
14. Бележки по пускане 3.5 – [бг](docs/bg/release-notes-3.5.md) (EN: [English](docs/en/release-notes-3.5.md))
15. Принос (Contributing) – [двуезично](CONTRIBUTING.md)
16. Кодекс на поведение – [двуезично](CODE_OF_CONDUCT.md)

## Локализация
Стъпките за добавяне на българската локал (bg_BG) са описани в документа „Езикови пакети“. Двата езикови клона се поддържат синхронно.

## Лицензиране
- Документация: CC BY 4.0
- Примери / конфигурации: GPL v3 (или по-нова)
- Самият OJS: GPL v3 (PKP). Запазете оригиналните известия.

Вижте [LICENSE](LICENSE) за подробности.

## Принос
Изпращайте промени чрез Pull Request. При структурни промени в английската версия добавяйте съответната българска актуализация в същия PR.

## Дневник на промените
Виж `CHANGELOG.md` (формат Keep a Changelog / SemVer).

## Отказ от отговорност
Този репозиторий е оперативен наръчник и не съдържа сорс кода на OJS.

---

## PDF Export / Експорт в PDF

EN: Use the helper script to build single combined PDFs (English and Bulgarian) via pandoc.

BG: Използвайте помощния скрипт за генериране на обединени PDF версии (английска и българска) чрез pandoc.

Requirements / Изисквания:
- pandoc (>= 3.x recommended)
- LaTeX engine (xelatex) with DejaVu fonts (usually in texlive packages) for Unicode Cyrillic.

Command:
```bash
./scripts/export-pdf.sh
```

Result: `export/pdf/ojs-playbook-en.pdf` and `export/pdf/ojs-playbook-bg.pdf`.

Exclude root bilingual files (README, LICENSE, CONTRIBUTING, CODE_OF_CONDUCT):
```bash
./scripts/export-pdf.sh --no-root
```

---

**Last updated:** 2025-11-30
