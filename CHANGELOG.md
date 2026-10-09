# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/) and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
### Changed
- README: added a Maintenance scripts section (`diff_locales.sh`, `sync_structure.py`), linked this changelog; changelog sections put in date order and the duplicate 0.2.0 heading merged.

## [0.3.2] - 2025-11-30
### Changed
- Documentation cleanup and last-updated timestamps added to top-level README.

## [0.3.1] - 2025-10-26
### Added
- Added "Theme and visual improvements" section to the configuration guides (English and Bulgarian). The new section documents available PKP and commercial themes, step-by-step instructions to install/enable themes for sites such as `fket.vtu.bg`, and UI recommendations (favicons, custom CSS, Google Fonts, mobile checks).

## [0.3.0] - 2025-10-24
### Added
- Explicit step-by-step instructions for creating/editing `/etc/nginx/sites-available/ojs.conf` (Ubuntu) and `/etc/nginx/conf.d/ojs.conf` (RHEL) in all install docs (EN & BG).
- Editor-based and here-doc creation methods for nginx site configuration files.
- Complete nginx server block examples with correct paths for Ubuntu (sites-available/sites-enabled) and RHEL (conf.d/).
- MariaDB security setup recommendations and password warnings (placed before the database creation commands).
- `php-redis` in the initial package installs and a Redis verification checklist; note on the `redis.service` alias.
### Changed
- Replaced placeholders "Same as Ubuntu with path adjustments" and "Сходна с Ubuntu" in RHEL install docs with full explicit nginx configuration instructions.
- Fixed malformed here-doc section in Ubuntu EN install doc (consolidated and clarified creation options).
### Fixed
- Structural parity between English and Bulgarian install documentation (configuration.md, install-rhel.md synchronized).
- PHP-FPM service naming for Ubuntu/Debian.
- `reports/locale-diffs/` no longer tracked (gitignored).

## [0.2.0] - 2025-10-20
### Changed
- Consolidated separate license files into unified bilingual `LICENSE`.
- Merged contributing and code of conduct into bilingual root documents.
- Updated target version to 3.5.0-1 and added patch row to version matrix (EN/BG).
- Added release notes summaries (EN & BG) with disclaimers.
- Normalized download links to 3.5.0-1.
- Removed redundant individual license and BG summary files.
### Added
- Initial repository scaffold: documentation structure (en, bg), licensing placeholders, installation and operations guides (drafts), localization resources for English/Bulgarian.
- Checksum verification and translation non-authoritative disclaimers.
- Cross-document navigation, Bulgarian README section, and `scripts/export-pdf.sh` (pandoc PDF export).
### Fixed
- Minor table formatting consistency across documentation.

