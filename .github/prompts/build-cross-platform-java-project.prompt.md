---
name: Build Cross-Platform Java Project
description: Orchestrate the complete Java Hello World scenario: project, tests, executable JAR, CI for three operating systems, documentation, and verification.
agent: Java Project Builder
---

Run the complete scenario using the `project-scaffold`, `build-and-test`, and `github-actions` skills:

1. Inspect the workspace and preserve existing work.
2. Follow `git-init`, `create-project`, `create-build`, and `create-actions` in that order.
3. Create the Java 17 Hello World project and `App.add` function with a `testBasicAddition` JUnit test.
4. Ensure `scripts/ci.sh` and `scripts/ci.bat` run Maven build/tests, generate `build/hello.jar` and the platform launcher, and verify `Hello, World!`.
5. Configure one Windows/Linux/macOS matrix job that delegates build and test commands to those scripts.
6. Document agent use and exact local checks in `docs/usage.md`.
7. Run the platform script, then follow `check` as a read-only audit. It must leave the working tree unchanged.
8. Summarize created files and observed results. Never claim a remote CI run succeeded unless an actual workflow run has succeeded.
