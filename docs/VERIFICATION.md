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

Успішний [запуск Java CI](https://github.com/oleksandrpikalovki2023/APCS_LAB1/actions/runs/41337670204)
для коміту `3bfcc16afaf71b2a153e90d122e3bd17a706f27c` завершив усі три задачі:

| Платформа | Maven verify | JAR артефакт | Результат |
|---|---|---|---|
| `windows-latest` | Успішно | Завантажено | Успішно |
| `ubuntu-latest` | Успішно | Завантажено | Успішно |
| `macos-latest` | Успішно | Завантажено | Успішно |

Гілки `develop` і `feature/java-hello-world-agent` опубліковані на GitHub.
Pull request між ними ще не відкритий; [сторінка створення PR](https://github.com/oleksandrpikalovki2023/APCS_LAB1/compare/develop...feature/java-hello-world-agent).
