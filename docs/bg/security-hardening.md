# Закаляване на сигурността

> Навигация: [Назад: Езикови пакети](language-packs.md) | [Индекс](../../README.md#reading-order-document-index) | Следва: [Публикуване](publishing-campus-network.md) | EN: [Security Hardening](../en/security-hardening.md)

## 1. Права
Минимални привилегии за БД и системния потребител.

## 2. Файлова система
`files_dir` извън web root. Ограничени права.

## 3. TLS
Силни шифри, HTTP/2, HSTS.

## 4. Заглавки
```
X-Frame-Options SAMEORIGIN
X-Content-Type-Options nosniff
Referrer-Policy strict-origin-when-cross-origin
```

## 5. PHP
Деактивирайте опасни функции ако не се ползват.

## 6. БД
utf8mb4, ограничен достъп по мрежата.

## 7. Автентикация
Силни пароли, евентуално LDAP/SSO.

## 8. Мониторинг
Nginx, PHP-FPM, DB, дисково пространство.

## 9. Fail2ban
Jail за уеб входове.

## 10. Резервни копия
Периодични тестове за възстановяване.

---
> Назад: [Езикови пакети](language-packs.md) | Следва: [Публикуване](publishing-campus-network.md) | Индекс: [Document Index](../../README.md#reading-order-document-index) | EN: [Security Hardening](../en/security-hardening.md)
