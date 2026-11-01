---
name: build-and-test
description: "Configure or run Java Maven builds and unit tests, including packaging an executable JAR and checking the output. Use for build, test, Maven, or packaging tasks."
---

# Build and Test

Use the repository's Maven project and Java 17.

1. Inspect `pom.xml` and existing test conventions before making changes.
2. Keep the build reproducible and use JUnit 5 for unit tests.
3. Run `mvn --batch-mode verify` (or `mvnw.cmd --batch-mode verify` when the Maven wrapper is available).
4. Run the packaged JAR and verify its observable output.
5. Report test and packaging results separately; never describe skipped tests as passing.

