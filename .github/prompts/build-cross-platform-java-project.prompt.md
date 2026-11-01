---
name: Build Cross-Platform Java Project
description: Orchestrate the complete Java Hello World scenario: project, tests, executable JAR, CI for three operating systems, documentation, and verification.
agent: Java Project Builder
---

Run the complete scenario using the `project-scaffolding`, `build-and-test`, and `github-actions` skills:

1. Inspect the workspace and preserve existing work.
2. Create the Java 17 Hello World project.
3. Configure Maven, JUnit 5 unit tests, and the executable JAR.
4. Add GitHub Actions CI for Windows, Linux, and macOS.
5. Document agent usage, local build/test/run instructions, and verification evidence.
6. Run the tests and build, then execute the packaged JAR and verify its output.
7. Summarize changed files and actual validation results. Never claim a remote CI run succeeded unless it was observed.

