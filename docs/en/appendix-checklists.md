# Appendix – Checklists

> Navigation: [Prev: Troubleshooting](troubleshooting.md) | [Index](../../README.md#reading-order-document-index) | BG: [Контролни списъци](../bg/appendix-checklists.md)

## A. Provisioning
- [ ] FQDN reserved
- [ ] Sizing approved
- [ ] Network ports approved
- [ ] Backup target available

## B. OS Baseline
- [ ] Packages updated
- [ ] Time sync configured
- [ ] SSH hardened
- [ ] Fail2ban active

## C. Stack Install
- [ ] Web server configured
- [ ] PHP modules installed
- [ ] DB created
- [ ] Redis running (verify with `redis-cli ping` → should return `PONG`)
- [ ] OJS code deployed

## D. Install & Config
- [ ] Web installer completed
- [ ] `files_dir` outside web root
- [ ] Primary locale set
- [ ] Bulgarian locale installed
- [ ] Email tested

## E. Security
- [ ] TLS enabled
- [ ] Headers enforced
- [ ] File perms restricted
- [ ] Unused plugins removed

## F. Go-Live
- [ ] Monitoring dashboards
- [ ] Backup tested
- [ ] Load test baseline
- [ ] Change ticket closed

## G. Operations
- [ ] Upgrade runbook stored
- [ ] On-call contact list
- [ ] Recovery time objective documented

End of English documentation set.
