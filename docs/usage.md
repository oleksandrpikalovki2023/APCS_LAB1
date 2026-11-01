# Використання AI-агента та локальна перевірка

## Передумови

- Visual Studio Code із GitHub Copilot Chat.
- JDK 17 або новіший.
- Apache Maven 3.9 або новіший у `PATH`.
- Репозиторій відкрито як кореневу папку у VS Code.

## Запуск агента

1. Відкрийте GitHub Copilot Chat.
2. Виберіть агента **Java Project Builder**.
3. Для виконання всього сценарію у новому репозиторії введіть:

   ```text
   /init hello-world
   ```

4. Orchestrator виконує процедури prompt-команд у такому порядку:
   `git-init` → `create-project` → `create-build` → `create-actions` → `check`.
5. Підтверджуйте команди, запропоновані Copilot, переглядайте зміни і не
   приймайте неочікуване перезаписування файлів.

Prompt-файли команд розміщені у `.github/prompts/`. Skills визначені у
`.github/skills/project-scaffold/`, `.github/skills/build-and-test/` та
`.github/skills/github-actions/`.

## Локальна перевірка Windows

З PowerShell у корені проєкту:

```powershell
scripts\ci.bat
.\build\hello.bat
git check-ignore build\hello.jar target\hello-world-1.0.0.jar
git status --short
```

`scripts\ci.bat` виконує Maven `clean verify`, копіює JAR до `build\hello.jar`,
створює `build\hello.bat` та перевіряє очікуваний вивід програми.

## Локальна перевірка Linux/macOS

```shell
bash scripts/ci.sh
./build/hello
git check-ignore build/hello.jar target/hello-world-1.0.0.jar
git status --short
```

## Очікувані результати

- `testBasicAddition` проходить; тести розташовані у
  `target/surefire-reports/`.
- `build/hello.jar` є виконуваним JAR.
- На Windows запускається `build/hello.bat`; на Linux/macOS — `build/hello`.
- Launcher друкує рівно `Hello, World!`.
- `build/` і `target/` ігноруються Git і не додаються до комітів.

Якщо Java або Maven відсутній у `PATH`, скрипт завершується з поясненням.
Після встановлення Maven перезапустіть термінал і перевірте `mvn -version`.

