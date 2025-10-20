# Езикови пакети (английски и български)

> Навигация: [Назад: Конфигурация](configuration.md) | [Индекс](../../README.md#reading-order-document-index) | Следва: [Сигурност](security-hardening.md) | EN: [Language Packs](../en/language-packs.md)

## 1. Обзор
Английският е вграден. Българският (bg_BG) може да се добави през администрацията.

## 2. Уеб интерфейс
1. Вход като администратор.
2. Administration > Site Settings > Languages.
3. Изберете Bulgarian (bg_BG) и инсталирайте.
4. Активирайте за интерфейс и подавания.

## 3. За списания
Per journal: Settings > Website > Languages – отметнете bg_BG.

## 4. CLI (ако налично)
```bash
php /var/www/ojs/tools/upgrade.php installLocale bg_BG
```

## 5. Конфигурация
```
installed_locales = en_US;bg_BG
supported_locales = en_US;bg_BG
```

## 6. Имейл шаблони
Administration > Prepared Emails – прегледайте преводите.

## 7. Системна локализация
```bash
sudo locale-gen bg_BG.UTF-8
sudo update-locale
```

## 8. Тестване
Смяна на езика, тестови подавания.

## 9. Чести проблеми
| Симптом | Причина | Решение |
|---------|---------|---------|
| Липсва локал | Не е инсталиран | Инсталирайте пакета |
| Грешни символи | Колация на БД | utf8mb4 |
| Частичен превод | Непълен upstream | Допринасяне към PKP |

---
> Назад: [Конфигурация](configuration.md) | Следва: [Сигурност](security-hardening.md) | Индекс: [Document Index](../../README.md#reading-order-document-index) | EN: [Language Packs](../en/language-packs.md)
