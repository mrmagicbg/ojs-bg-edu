# Contributing Guide

Thanks for your interest in improving this OJS deployment & localization playbook.

## Scope
This repo contains documentation and small helper snippets (no bundled OJS core code). Keep contributions aligned with operations, deployment, security, and Bulgarian localization improvements.

## Ways to Contribute
- Fix typos / clarify instructions
- Add verified steps for additional distributions
- Improve Bulgarian translations
- Add troubleshooting entries with reproducible symptoms
- Provide security hardening enhancements

## Pull Requests
1. Fork and create a feature branch (`feat/`, `fix/`, `docs/` prefix).
2. Update or add English doc first, then mirror Bulgarian translation.
3. Run a spell/consistency check (optional tooling welcome).
4. Update `CHANGELOG.md` under Unreleased (if added) or create a new section if version bump.
5. Submit PR referencing any related issues.

## Style
- Use Markdown headings consistently (## for major sections).
- Use fenced bash blocks for commands.
- Use placeholders clearly (ALL_CAPS or angle brackets).
- Avoid embedding large binary assets.

## Licensing
By contributing you agree your documentation changes are CC BY 4.0 and code snippets are GPL-3.0-or-later.

## Reporting Issues
Open a GitHub issue with:
- Environment (OS, OJS version, DB)
- Steps to reproduce
- Expected vs. actual result
- Relevant log excerpts (sanitized)

## Security
Do not disclose new security vulnerabilities publicly. Instead, briefly describe the concern and request a secure contact channel.

## Translation Notes
When updating English content structure, create a placeholder in Bulgarian with a TODO tag if immediate translation is not ready.

Thank you for helping academic publishing infrastructure! 🙌
