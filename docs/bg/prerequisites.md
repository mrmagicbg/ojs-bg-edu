# Предпоставки и планиране

> Навигация: [Назад: Обзор](overview.md) | [Индекс](../../README.md#reading-order-document-index) | Следва: [Инсталация (Ubuntu)](install-ubuntu.md) | EN: [Prerequisites](../en/prerequisites.md)

## 1. Информация за събиране
| Елемент | Пример | Бележки |
|--------|--------|---------|
| FQDN | journals.university.edu | Публичен DNS + вътрешен ако е нужно |
| Среда | Production / Staging | Отделни БД и storage |
| Очаквани списания | 3 | Влияе оразмеряването |
| Пикови потребители | 150 | PHP-FPM работници |
| Съхранение (1-ва година) | 50 GB | PDF, изображения, данни |
| Ретенция на backup | 30 дневни, 12 месечни | Политика |
| SMTP | smtp.university.edu:587 | Auth или IP |
| HTTPS сертификат | Let’s Encrypt | Или институционален CA |

## 2. Оразмеряване
| Ресурс | Базово | Средно | Бележки |
|--------|--------|-------|---------|
| vCPU | 2 | 4–8 | Конкурентност |
| RAM | 4 GB | 8–16 GB | PHP + DB |
| Disk | 80 GB | 200+ GB | Отделен volume за `files_dir` |

## 3. Мрежа и Firewall
Входящи: 80, 443. SSH 22 ограничен. DB 3306 ако е външен.

## 4. DNS
A/AAAA записи. DNSSEC ако е наличен.

## 5. Време и Локал
Часова зона `Europe/Sofia`. NTP синхронизация.

## 6. Backup стратегия
Ежедневно: dump + tar на файлове. Седмично: пълен тест. Месечно: offsite.

## 7. Сигурност
SSH ключове; забрана на пароли. Fail2ban. Автоматични security updates.

## 8. Логове и Съответствие
Централизирани логове; задържане 90 дни активно.

## 9. Шаблон за решения
```
Дата | Решение | Причина | Отговорник
```

---
> Назад: [Обзор](overview.md) | Следва: [Инсталация (Ubuntu)](install-ubuntu.md) | Индекс: [Document Index](../../README.md#reading-order-document-index) | EN: [Prerequisites](../en/prerequisites.md)
