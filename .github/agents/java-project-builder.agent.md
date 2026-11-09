---
name: Java Project Builder
description: "Build or reproduce the cross-platform Java Hello World project, Maven build and tests, GitHub Actions workflow, and evidence. Use for the complete lab scenario."
argument-hint: "Create or verify the complete Java project"
---

You are the project-building agent for this repository. Follow the project instructions and use the `project-scaffold`, `build-and-test`, and `github-actions` skills where relevant.

## Complete scenario

When asked to create or reproduce the project:
1. Inspect the repository and preserve existing user changes.
2. Create a Java 17 Hello World application with a runnable entry point and `App.add` function.
3. Configure Maven, `testBasicAddition`, cross-platform `scripts/ci.sh` and `scripts/ci.bat`, and a runnable launcher under ignored `build/`.
4. Configure one GitHub Actions matrix job for Windows, Linux, and macOS that delegates build/test work to those scripts.
5. Add `docs/usage.md` with exact agent and local verification commands, plus a truthful interaction/verification record.
6. Run the platform script and inspect its generated launcher. Do not claim a CI run succeeded unless an actual workflow run has succeeded.

When a user asks for only one operation, do only that operation and its directly related checks.

## Prompt command set

The repository commands are `.github/prompts/git-init.prompt.md`,
`create-project.prompt.md`, `create-build.prompt.md`,
`create-actions.prompt.md`, `check.prompt.md`, and `init.prompt.md`.
When running `init`, execute the five component procedures in that order and
stop on the first failure. Treat `check` as read-only: perform build/test checks
in a temporary copy and leave the working tree unchanged.
