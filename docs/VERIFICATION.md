# Докази перевірки

## Локальна перевірка (Windows)

Середовище: Windows 11, OpenJDK 17.0.19, Apache Maven 3.9.9.

Виконана команда `mvn --batch-mode --no-transfer-progress verify` завершилася
з `BUILD SUCCESS`. Maven повідомив: 1 тест виконано, 0 помилок, 0 збоїв,
0 пропущених. Створено `target/hello-world-1.0.0.jar`.

Виконана команда `java -jar target/hello-world-1.0.0.jar` завершилася успішно
та вивела:

```text
Hello, World!
```

Перевірка `git check-ignore target/hello-world-1.0.0.jar` підтвердила, що
зібраний артефакт виключено з Git через `.gitignore`.

## Перевірка CI

Workflow має три незалежні job-задачі (Windows, Linux, macOS), кожна запускає
Maven `verify` і після успіху публікує JAR як артефакт. Віддалений статус CI
поки недоступний: push гілок відхилено GitHub з HTTP 403 (немає права запису до
`oleksandrpikalovki2023/APCS_LAB1`). Тому віддалені workflow-запуски та артефакти
ще не створені, а pull request `feature/java-hello-world-agent` → `develop` не
відкритий. Після надання права запису гілки можна опублікувати, щоб запустити CI.
Локальне проходження на Windows не є доказом проходження на інших ОС.
