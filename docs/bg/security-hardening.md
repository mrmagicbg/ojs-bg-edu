# Закаляване на Сигурността

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

Следва: `publishing-campus-network.md`.
