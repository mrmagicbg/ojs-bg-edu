# OJS 3.5 Release Notes (Summary)

Source: Adapted summary referencing PKP 3.5 Release Notebook (https://docs.pkp.sfu.ca/dev/release-notebooks/en/3.5-release-notebook). Always consult the official notebook for authoritative detail. This summary is provided under the same GPL v3 terms as OJS with attribution to PKP.

## Highlights
- Modernized UI refinements and accessibility improvements.
- Workflow enhancements: refined submission handling, improved editorial dashboards.
- Plugin ecosystem updates with compatibility adjustments for PHP 8.2.
- Performance optimizations in caching and query handling.
- Security hardening patches and dependency updates.

## Technical / Platform
| Area | Change (Summary) |
|------|------------------|
| PHP Support | Official testing with PHP 8.2; older unsupported versions deprecated. |
| DB Layer | Continued emphasis on utf8mb4; minor schema migrations applied. |
| Caching | Better optional Redis/APCu integration patterns (requires plugin/version validation). |

## Editorial & Workflow
- Streamlined submission metadata editing forms.
- Clearer locale handling in multilingual submissions.

## Accessibility
- Improved ARIA labels and heading hierarchy.
- Color contrast adjustments in default theme.

## Localization
- Updated base translation strings; Bulgarian pack may need incremental community contributions for newly introduced keys.

## Upgrade Notes
1. Backup database and files directory.
2. Replace code with 3.5.0-1 package.
3. Run upgrade script (see maintenance guide).
4. Clear caches and review logs.

## Post-Upgrade Checklist
- Verify plugins compatibility (disable outdated ones).
- Rebuild search index if required by plugin changes.
- Confirm email templates & locale customizations.

## Contributing Translations
Submit updated locale strings upstream to PKP to ensure Bulgarian improvements propagate.

## Attribution
Open Journal Systems (OJS) © Public Knowledge Project (PKP). Summary prepared for deployment playbook (this repository).
