# Архітектура AI-агента

## Призначення

Workspace-агент **Java Project Builder** для GitHub Copilot Chat у Visual
Studio Code автоматизує створення та перевірку мінімального Java 17 Hello
World-проєкту. Він координує prompt-команди, використовує спеціалізовані
skills, зберігає наявні файли та звітує лише про фактично виконані перевірки.

## Компоненти агента

| Компонент | Файл | Відповідальність |
|---|---|---|
| Інструкції workspace | `.github/copilot-instructions.md` | Загальні обмеження проєкту, Java/Maven і CI |
| Маніфест агента | `.github/agents/java-project-builder.agent.md` | Роль агента, повний сценарій і межі виконання |
| `project-scaffold` | `.github/skills/project-scaffold/SKILL.md` | Початкова структура, Hello World, README і `.gitignore` |
| `build-and-test` | `.github/skills/build-and-test/SKILL.md` | Maven, JUnit, build scripts і launcher-и |
| `github-actions` | `.github/skills/github-actions/SKILL.md` | Матричний CI workflow, який запускає build scripts |
| Prompt-команди | `.github/prompts/*.prompt.md` | Окремі операції та orchestrator повного сценарію |

## Команди та передавання даних

| Етап | Команда | Вхідні дані | Результат для наступного етапу |
|---|---|---|---|
| 1 | `git-init` | Корінь репозиторію та його Git-стан | Перевірений Git root і `.gitignore` |
| 2 | `create-project` | Java 17, назва проєкту, стан файлів | `App.java`, `pom.xml`, README і вихідна структура |
| 3 | `create-build` | Початкове джерело та Maven-конфігурація | `App.add`, `testBasicAddition`, build scripts і launcher templates |
| 4 | `create-actions` | Перевірені `scripts/ci.sh` та `scripts/ci.bat`, цільові гілки | `.github/workflows/ci.yml` і команди використання |
| 5 | `check` | Репозиторій, конфігурація, попередній Git-стан | Read-only звіт PASS/FAIL/NOT RUN з доказами |
| Оркестрація | `init` | Java 17 і назва проєкту | Послідовне виконання етапів 1–5; зупинка на першій помилці |

Команди доступні як prompt-файли в `.github/prompts/`. `init` передає контекст
проєкту між компонентними процедурами, але не приховує їхніх помилок:
наступний етап запускається лише після успіху попереднього. `check` не має
змінювати робоче дерево; build/test-перевірки виконує в тимчасовій копії.

## Потік складання та CI

`scripts/ci.bat` у Windows або `scripts/ci.sh` у Linux/macOS запускає Maven
`clean verify`, копіює виконуваний JAR до `build/`, створює платформний
launcher і перевіряє, що програма друкує `Hello, World!`. Workflow
`.github/workflows/ci.yml` має одну job із матрицею Windows, Ubuntu та macOS і
делегує складання та тести цим скриптам. Після успішного виконання скрипту
workflow завантажує `build/` як артефакт.

## Обробка помилок і безпечне повторне виконання

- Кожна команда перевіряє передумови, читає наявні файли й зберігає сторонні
  зміни; конфліктуючий файл не перезаписується автоматично.
- Створювальні команди оновлюють лише потрібні файли та мають бути безпечними
  для повторного запуску без дублювання конфігурації.
- Відсутня Java/Maven, помилка компіляції, тесту, launcher-а чи перевірки CI
  повертає помилку з діагностикою; повідомлення про успіх не виводиться.
- `init` зупиняється на першому невдалому кроці та вказує команду й причину.
- `check` є read-only, повідомляє PASS/FAIL/NOT RUN і не приховує недоступні
  перевірки.
- `.gitignore` виключає `build/`, `target/`, локальні секрети й журнали.
  Workflow має мінімальні права й не зберігає токени чи паролі.
- Агент не видаляє користувацькі файли, не переписує Git-історію та не
  змінює branch protection.
