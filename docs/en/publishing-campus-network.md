# Publishing the Portal (Campus to Public Internet)

> Navigation: [Prev: Security Hardening](security-hardening.md) | [Index](../../README.md#reading-order-document-index) | Next: [Maintenance & Upgrades](maintenance-upgrades.md) | BG: [Публикуване](../bg/publishing-campus-network.md)

## 1. Network Placement
Preferred: DMZ or reverse proxy in front of application host.

Options:
| Model | Description | Pros | Cons |
|-------|-------------|------|------|
| Direct DMZ Host | OJS VM exposed with firewall | Simplicity | Larger attack surface |
| Reverse Proxy | Nginx/HAProxy terminates TLS, forwards to internal OJS | Centralized TLS, WAF | Extra hop |
| Load Balanced | Multiple OJS app nodes behind LB | Scalability | Complexity |

## 2. DNS & Split Horizon
Public DNS: journals.university.edu -> public IP
Internal DNS: same FQDN -> internal reverse proxy IP (optional)

## 3. Firewall Rules
Allow inbound 80/443 from Internet to proxy. Allow 443 (or custom) from proxy to OJS internal IP. Restrict SSH to admin subnet.

## 4. TLS Certificates
- Let’s Encrypt on proxy or on app host.
- If using institutional CA, distribute trust chain to clients where necessary.

## 5. Reverse Proxy Sample (External Nginx)
```
server {
  listen 443 ssl http2;
  server_name journals.university.edu;
  ssl_certificate /etc/letsencrypt/live/journals.university.edu/fullchain.pem;
  ssl_certificate_key /etc/letsencrypt/live/journals.university.edu/privkey.pem;

  location / {
     proxy_pass https://ojs-internal.university.lan;
     proxy_set_header Host $host;
     proxy_set_header X-Forwarded-For $remote_addr;
     proxy_set_header X-Forwarded-Proto https;
  }
}
```
Ensure `base_url` matches external URL.

## 6. Load Balancing Considerations
- Shared `files_dir` via NFS or object storage.
- Session storage centralized (Redis).
- Consistent `secret` / config across nodes.

## 7. Performance Tuning
Nginx:
```
worker_processes auto;
worker_connections 4096;
```
PHP-FPM pool adjustments:
- Ubuntu/Debian: `/etc/php/8.3/fpm/pool.d/www.conf`
- RHEL: `/etc/php-fpm.d/www.conf`

```
pm = dynamic
pm.max_children = 20
pm.start_servers = 5
pm.min_spare_servers = 5
pm.max_spare_servers = 10
```
Adjust based on RAM (rough rule: (RAM_for_PHP / avg_child_mem)).
After changes: `sudo systemctl reload php8.3-fpm` (Ubuntu) or `sudo systemctl reload php-fpm` (RHEL)

## 8. Logging & Analytics
Enable access logs; feed into central system. Respect privacy regulations.

## 9. WAF / DDoS
Optional: ModSecurity (CRS) or cloud-based protective layer if policy allows.

## 10. Go-Live Checklist
- [ ] DNS propagated
- [ ] Valid TLS
- [ ] Admin credentials stored securely
- [ ] Backups verified
- [ ] Monitoring dashboards active
- [ ] Load test (baseline throughput)

---
> Prev: [Security Hardening](security-hardening.md) | Next: [Maintenance & Upgrades](maintenance-upgrades.md) | Index: [Document Index](../../README.md#reading-order-document-index) | BG: [Публикуване](../bg/publishing-campus-network.md)
