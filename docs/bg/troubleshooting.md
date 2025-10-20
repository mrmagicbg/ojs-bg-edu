# Отстраняване на проблеми

> Навигация: [Назад: Резервни копия](backup-restore.md) | [Индекс](../../README.md#reading-order-document-index) | Следва: [Контролни списъци](appendix-checklists.md) | EN: [Troubleshooting](../en/troubleshooting.md)

## 1. Чести проблеми
| Проблем | Симптом | Решение |
|---------|---------|---------|
| Права | 500 грешки | Проверете ownership |
| Колация | Символи | utf8mb4 |
| Липсва разширение | Fatal error | Инсталирайте PHP модул |

## 2. Логове
Nginx, PHP-FPM, вътрешни логове.

## 3. Повече детайли
Slow log, включване на временни debug настройки.

## 4. БД диагностика
`SHOW PROCESSLIST;`

## 5. Кеш изчистване
`rm -rf /var/www/ojs/cache/*`

---
> Назад: [Резервни копия](backup-restore.md) | Следва: [Контролни списъци](appendix-checklists.md) | Индекс: [Document Index](../../README.md#reading-order-document-index) | EN: [Troubleshooting](../en/troubleshooting.md)
