# Докази перевірки

## Локальна перевірка Windows

Середовище: Windows 11, OpenJDK 17.0.19, Apache Maven 3.9.9.

Виконано `scripts\ci.bat`. Maven завершив `clean verify` з `BUILD SUCCESS`:
2 тести, 0 помилок, 0 збоїв, 0 пропущених. Скрипт створив
`build\hello.jar` і `build\hello.bat`, запустив launcher та перевірив вивід:

```text
Hello, World!
[OK] Build, tests, and launcher verification passed.
```

Окремий запуск `.\build\hello.bat` також вивів `Hello, World!`.
`git check-ignore build\hello.jar target\hello-world-1.0.0.jar` підтвердив,
що `build/` і `target/` виключені з Git.

## Linux/macOS

POSIX-скрипт `bash scripts/ci.sh` додано; його потрібно виконати на Linux/macOS.
Локальне WSL-середовище на цьому Windows-хості не має JDK, тому локальний
POSIX-запуск тут не підтверджений. Результат слід зафіксувати за новим
GitHub Actions запуском після публікації змін.

## GitHub Actions

Workflow `.github/workflows/ci.yml` має одну job із матрицею
`ubuntu-latest`, `windows-latest` і `macos-latest`. Для push у `develop` або
`master` та pull request до цих гілок workflow виконує checkout, налаштовує
Java 17, викликає платформний build script і завантажує `build/` після успіху.

Попередній успішний запуск
[41338998745](https://github.com/oleksandrpikalovki2023/APCS_LAB1/actions/runs/41338998745)
перевіряв попередній стан проєкту, до додавання скриптів, launcher-а й
`testBasicAddition`; він не є доказом нового workflow. Новий CI результат
для оновленої гілки додається після завершення workflow.

## Команда orchestrator і read-only check

Prompt-и `init` та `check` містять порядок етапів, критерії успіху й правила
збереження робочого дерева. Їх наскрізне виконання на чистому репозиторії та
read-only перевірку окремо ще не виконано; ці результати не позначаються як
успішні без фактичного запуску.
