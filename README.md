# Java Hello World з AI-агентом

Кросплатформенний приклад на Java 17. Проєкт збирається у виконуваний JAR,
має юніт-тест на JUnit 5 і запускає CI на Windows, Linux та macOS.

## Вимоги

- JDK 17 або новіший
- Apache Maven 3.9 або новіший
- Visual Studio Code з GitHub Copilot Chat для використання агента

## Запуск AI-агента

1. Відкрийте кореневу папку репозиторію у VS Code.
2. Переконайтеся, що GitHub Copilot Chat увімкнений.
3. У меню вибору агента оберіть **Java Project Builder** з `.github/agents`.
4. Для відтворення повного сценарію запустіть prompt `/build-cross-platform-java-project`.
5. Окремі prompts доступні через `/`: створення проєкту, налаштування збірки і
   тестів, налаштування GitHub Actions, складання, запуск тестів та перевірка JAR.

Агент використовує три skills у `.github/skills`: `project-scaffolding`,
`build-and-test` і `github-actions`. Їхні інструкції, а також команди-prompts,
знаходяться в репозиторії, тому доступні після відкриття проєкту у VS Code.

## Збірка, тести та запуск

У терміналі з кореневої папки проєкту виконайте:

```shell
mvn --batch-mode verify
java -jar target/hello-world-1.0.0.jar
```

Перша команда компілює код, запускає юніт-тести та створює JAR. Друга запускає
зібраний застосунок; очікуваний результат:

```text
Hello, World!
```

У Windows ті самі команди виконуються в PowerShell або Command Prompt. Якщо
Maven не встановлено, встановіть JDK 17 та Apache Maven перед запуском.

## GitHub Actions

Workflow [`.github/workflows/ci.yml`](.github/workflows/ci.yml) запускає Maven
`verify` на `windows-latest`, `ubuntu-latest` і `macos-latest` для кожного push
у `develop` або `feature/**` та для pull request у `develop`. Після успішної
перевірки виконуваний JAR завантажується як артефакт workflow.

## Git-гілки

- `develop` містить інструкції та налаштування AI-агента.
- `feature/java-hello-world-agent` додає до агента застосунок, тести, CI та
  документацію.
- Цільовий pull request: `feature/java-hello-world-agent` → `develop`.

## Журнал і перевірка

Перебіг роботи та фактичні результати перевірок описані у
[`docs/AI-INTERACTION-LOG.md`](docs/AI-INTERACTION-LOG.md) і
[`docs/VERIFICATION.md`](docs/VERIFICATION.md).

