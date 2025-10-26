# Основна конфигурация

> Навигация: [Назад: Инсталация (RHEL)](install-rhel.md) | [Индекс](../../README.md#reading-order-document-index) | Следва: [Езикови пакети](language-packs.md) | EN: [Configuration](../en/configuration.md)

Редактирайте `config.inc.php` след инсталация.

## 1. Основни
```
base_url = "https://journals.example.edu"
files_dir = /var/ojs-files
client_charset = utf-8
```

## 2. Локализация
```
locale = en_US
installed_locales = en_US;bg_BG
supported_locales = en_US;bg_BG
```

## 3. Сигурност
```
force_ssl = On
session_cookie_secure = On
session_lifetime = 7200
```

## 4. Email
```
[email]
smtp = On
smtp_server = smtp.university.edu
smtp_port = 587
smtp_auth = PLAIN
smtp_username = no-reply@university.edu
smtp_password = CHANGE_ME
smtp_encryption = tls
```

## 5. Кеш
Пример с Redis (валидирайте със версията на OJS).

## 6. Права върху файлове
Ограничете запис до `cache/`, `public/`, `plugins/` и директорията за файлове.

## 7. Cron
```bash
crontab -u www-data -e
0 * * * * php /var/www/ojs/tools/runScheduledTasks.php
```

## 8. Логове
Logrotate конфигурация според нуждите.

## 9. Визуална среда и теми

Да, има множество теми и пакети за подобряване на графичната среда на Open Journal Systems (OJS), включително за версии като тази, използвана от fket.vtu.bg.

### 🎨 Възможности за подобрение на графичната среда в OJS

#### ✅ Официални теми от PKP (Public Knowledge Project)
- **Default Bootstrap Theme** – базирана на Bootstrap 3, с допълнителни варианти като *Yeti*, *Sandstone*, *Cyborg* и др.
- **Classic Theme** – изчистена визия, подходяща за академични списания.
- **Health Sciences Theme** – модерна тема, подходяща за научни и медицински издания.
- **Immersion Theme** – визуално наситена, с акцент върху четимостта и мобилната съвместимост.
- **Manuscript и Manuscript-JATS** – оптимизирани за работа с JATS XML и научни публикации.

🔗 Всички тези теми са достъпни безплатно чрез GitHub: https://github.com/pkp и има галерии като https://ojs-services.com/ojs-themes/ojs-3-theme-gallery/

#### 🛠️ Комерсиални и персонализирани теми
- Платформи като OpenJournalSystems.com предлагат персонализирани теми, поддръжка и инсталация.
- Тези теми често включват респонсив дизайн и мобилна оптимизация.

### 📌 Как да приложиш нова тема към fket.vtu.bg

1. **Провери версията на OJS** – най-вероятно е OJS 3.x, но потвърди от админ панела.
2. **Изтегли желаната тема от GitHub** – например `classic`, `bootstrap3`, `immersion`.
3. **Качи темата в директорията `/plugins/themes/`** на сървъра.
4. **Активирай темата от админ панела** → *Settings > Website > Appearance*.
5. **Настрой цветове, шрифтове и лого** според нуждите на списанието.

### 🔍 Препоръки за визуално подобрение

- **Добави favicon и лого** – за по-добра идентичност.
- **Използвай персонализирани CSS правила** – за фини настройки.
- **Интегрирай Google Fonts** – за по-модерен изглед.
- **Проверявай мобилната съвместимост** – чрез инструменти като Chrome DevTools.

---
> Prev: [Installation (RHEL)](install-rhel.md) | Next: [Language Packs](language-packs.md) | Index: [Document Index](../../README.md#reading-order-document-index) | BG: [Конфигурация](../bg/configuration.md)

