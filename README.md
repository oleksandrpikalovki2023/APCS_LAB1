# Java Hello World з AI-агентом

Кросплатформенний застосунок Java 17 з Maven, JUnit 5 і GitHub Actions для
Windows, Linux та macOS. Репозиторій також містить workspace-агента GitHub
Copilot для Visual Studio Code, skills і prompt-команди для створення та
перевірки проєкту.

## Дані лабораторної роботи

- Студент: Пікалов О.Ю.
- Група: КІ-404
- Варіант 5: Java, Maven, JUnit
- Тема: AI-агент для створення, складання та CI/CD-перевірки кросплатформного
  застосунку Hello World.

## Вимоги

- JDK 17 або новіший
- Apache Maven 3.9 або новіший
- Visual Studio Code з GitHub Copilot Chat для роботи з агентом

## Запуск повного сценарію агента

1. Відкрийте кореневу папку репозиторію у VS Code.
2. Увімкніть GitHub Copilot Chat і виберіть агента **Java Project Builder**.
3. У новому репозиторії запустіть prompt `/init` і передайте назву проєкту,
   наприклад `hello-world`.
4. Агент послідовно виконає `git-init`, `create-project`, `create-build`,
   `create-actions` і завершить read-only перевіркою `check`.

Окремі команди доступні через `/`: `git-init`, `create-project`, `create-build`,
`create-actions`, `check` та `init`. Вони реалізовані файлами у
`.github/prompts/`. Три навички у `.github/skills/`: `project-scaffold`,
`build-and-test` та `github-actions`.

Докладні команди і передумови описано в [`docs/usage.md`](docs/usage.md).
Архітектура агента, передавання даних між етапами та обробка помилок описані
у [`docs/architecture.md`](docs/architecture.md).

## Локальна збірка, тестування та запуск

Сценарії збірки перевіряють Java та Maven, запускають Maven `clean verify`,
створюють виконуваний JAR та кросплатформенний launcher у `build/`, а потім
перевіряють його вивід `Hello, World!`.

Linux/macOS:

```shell
bash scripts/ci.sh
./build/hello
```

Windows PowerShell або Command Prompt:

```powershell
scripts\ci.bat
.\build\hello.bat
```

Після успішної збірки виконуваний JAR доступний як `build/hello.jar`.
Maven-звіт тестів створюється у `target/surefire-reports/`. Тест
`testBasicAddition` перевіряє `App.add(2, 3) == 5`.

## GitHub Actions

Workflow [`.github/workflows/ci.yml`](.github/workflows/ci.yml) запускає одну
матричну job-задачу на `ubuntu-latest`, `windows-latest` і `macos-latest`.
Події push для `develop`/`master` та pull request до `develop`/`master`
викликають лише платформний build script для компіляції, тестування та
перевірки застосунку. Після успіху workflow завантажує файли з `build/` як
артефакт job.

## Git-гілки та докази

- `develop` — базові інструкції агента та skills.
- `feature/java-hello-world-agent` — реалізація проєкту, commands, scripts,
  workflow і документації.
- [Pull request #1](https://github.com/oleksandrpikalovki2023/APCS_LAB1/pull/1)
  з feature до develop.

Фактичні результати перевірок описано у
[`docs/VERIFICATION.md`](docs/VERIFICATION.md), журнал роботи — у
[`docs/AI-INTERACTION-LOG.md`](docs/AI-INTERACTION-LOG.md).
