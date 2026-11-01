# Журнал взаємодії з AI

Дата: 2026-11-01

## Запит

Реалізувати лабораторний проєкт на Java з AI-агентом, skills, commands та
orchestrator, Hello World, модульними тестами, кросплатформенним складанням,
GitHub Actions і супровідною документацією. Пізніше вимоги було уточнено:
потрібні окремі `git-init`, `create-project`, `create-build`,
`create-actions`, read-only `check`, orchestrator `init`, скрипти складання,
`testBasicAddition`, виконуваний launcher у `build/` та CI, що викликає
скрипти.

Користувач обрав Java.

## Виконані дії

1. У гілці `develop` створено базові інструкції Copilot, профіль агента, skills
   і початкові prompt-команди.
2. У гілці `feature/java-hello-world-agent` створено Java 17/Maven Hello World,
   початковий JUnit-тест, CI та документацію; опубліковано PR #1 до `develop`.
3. Після уточнення вимог доповнено skills прикладами входу, очікуваними
   результатами, перевірками й сценаріями помилок; додано prompt-команди
   `git-init`, `create-project`, `create-build`, `create-actions`, `check` та
   `init`.
4. Додано `App.add`, тест `testBasicAddition`, `scripts/ci.sh`,
   `scripts/ci.bat`, шаблони launcher-ів, ігнорування `build/`, а також
   GitHub Actions, який делегує збірку скриптам.
5. Додано `docs/usage.md` з точними командами агента й локальної перевірки.
6. Скрипт `scripts/ci.bat` перевірено локально на Windows: обидва тести
   проходять, виконуваний JAR запускається і друкує `Hello, World!`.
7. Раніше успішний CI для трьох ОС стосувався попередньої версії до появи
   platform scripts. Результати CI після нових змін треба зафіксувати після
   push оновленої feature-гілки та нового PR-запуску.

## Межі підтвердження

Повний prompt `init` і read-only prompt `check` описані, але їх окреме
наскрізне виконання на чистому репозиторії не заявляється. POSIX build script
має бути підтверджений на Linux/macOS новим GitHub Actions run; на цьому
Windows-хості WSL не має встановленої Java. Журнал фіксує фактично виконані
операції, а не вигадані результати.
