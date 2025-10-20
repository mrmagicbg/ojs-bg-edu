# Security Hardening

> Navigation: [Prev: Language Packs](language-packs.md) | [Index](../../README.md#reading-order-document-index) | Next: [Publishing (Campus / Internet)](publishing-campus-network.md) | BG: [Сигурност](../bg/security-hardening.md)

## 1. Principle of Least Privilege
- DB user limited to OJS schema.
- Separate system user `ojs` with no shell.

## 2. File System
- Keep `files_dir` outside web root.
- Restrict write permissions to required dirs only.
- Remove `docs/` or restrict via web server.

## 3. TLS
- Enforce strong ciphers (Mozilla intermediate). Example Nginx snippet:
```
ssl_protocols TLSv1.2 TLSv1.3;
ssl_ciphers 'TLS_AES_256_GCM_SHA384:TLS_CHACHA20_POLY1305_SHA256:TLS_AES_128_GCM_SHA256';
ssl_prefer_server_ciphers off;
```

## 4. HTTP Headers
Add to Nginx server block:
```
add_header X-Frame-Options SAMEORIGIN;
add_header X-Content-Type-Options nosniff;
add_header Referrer-Policy strict-origin-when-cross-origin;
add_header X-XSS-Protection "1; mode=block";
add_header Content-Security-Policy "default-src 'self' 'unsafe-inline' 'unsafe-eval' data: https:;";
```
Adjust CSP once assets audited (reduce 'unsafe-inline').

## 5. PHP
Disable dangerous functions if not needed:
```
disable_functions = exec,passthru,shell_exec,system,proc_open,popen
```
Monitor for plugin requirements before disabling.

## 6. Database
- Enforce utf8mb4.
- Regular dumps with `--single-transaction`.
- Restrict network access (bind 127.0.0.1 if local).

## 7. Authentication
- Enforce strong admin password policy.
- Consider SSO (Shibboleth / LDAP) integration for campus (plugin dependent).

## 8. Monitoring & Alerts
Metrics to collect:
- Nginx: req/sec, 4xx/5xx
- PHP-FPM: slow logs
- DB: slow queries
- Disk usage of `/var/ojs-files`

## 9. Fail2ban
Create filter for repeated login failures (sample regex depends on OJS log format). Example jail config snippet:
```
[ojs-auth]
enabled = true
port    = http,https
filter  = ojs-auth
logpath = /var/log/nginx/ojs.access.log
maxretry = 5
findtime = 600
bantime  = 3600
```

## 10. Backups Integrity
Monthly restore test in isolated environment.

## 11. Upgrades
Track OJS security advisories (subscribe to PKP mailing list / RSS). Apply minor updates promptly.

---
> Prev: [Language Packs](language-packs.md) | Next: [Publishing (Campus / Internet)](publishing-campus-network.md) | Index: [Document Index](../../README.md#reading-order-document-index) | BG: [Сигурност](../bg/security-hardening.md)
