# Публикуване (от кампус към интернет)

> Навигация: [Назад: Сигурност](security-hardening.md) | [Индекс](../../README.md#reading-order-document-index) | Следва: [Поддръжка](maintenance-upgrades.md) | EN: [Publishing](../en/publishing-campus-network.md)

## 1. Мрежово позициониране
DMZ или reverse proxy пред приложението.

## 2. DNS
Публичен и вътрешен запис при нужда.

## 3. Firewall
80/443 отвън, SSH ограничен, вътрешна комуникация към приложението.

## 4. TLS
Let’s Encrypt или институционален CA.

## 5. Reverse Proxy пример
(Виж английската версия за подробен конфиг.)

## 6. Балансиране
Споделен `files_dir`, централизирани сесии.

## 7. Производителност
Тунинг на Nginx и PHP-FPM.

## 8. Логове
Централизиране и анализ.

## 9. WAF
ModSecurity по избор.

## 10. Go-Live чеклист
DNS, TLS, backup тест, мониторинг.

---
> Назад: [Сигурност](security-hardening.md) | Следва: [Поддръжка](maintenance-upgrades.md) | Индекс: [Document Index](../../README.md#reading-order-document-index) | EN: [Publishing](../en/publishing-campus-network.md)
