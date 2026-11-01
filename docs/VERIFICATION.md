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

POSIX-скрипт `bash scripts/ci.sh` додано. Його локальний запуск на цьому
Windows-хості не підтверджений, оскільки WSL-середовище не має JDK. Перевірку
цих платформ виконав GitHub Actions: Ubuntu та macOS jobs завершилися успішно.

## GitHub Actions

Workflow `.github/workflows/ci.yml` має одну job із матрицею
`ubuntu-latest`, `windows-latest` і `macos-latest`. Для push у `develop` або
`master` та pull request до цих гілок workflow виконує checkout, налаштовує
Java 17, викликає платформний build script і завантажує `build/` після успіху.

Успішний запуск для commit `35406413251fb57fa5fdd30255d34383ada1da36`:
[GitHub Actions run 41347765956](https://github.com/oleksandrpikalovki2023/APCS_LAB1/actions/runs/41347765956).
Усі три jobs завершилися успішно: Ubuntu, Windows і macOS. Запуск виконався
для pull request [#1](https://github.com/oleksandrpikalovki2023/APCS_LAB1/pull/1).

## Команда orchestrator і read-only check

Prompt-и `init` та `check` містять порядок етапів, критерії успіху й правила
збереження робочого дерева. Їх наскрізне виконання на чистому репозиторії та
read-only перевірку окремо ще не виконано; ці результати не позначаються як
успішні без фактичного запуску.
