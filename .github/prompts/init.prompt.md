---
name: init
description: Orchestrate the complete Java project workflow by following git-init, create-project, create-build, create-actions, and check in order.
agent: Java Project Builder
argument-hint: "Project name (default: hello-world)"
---

Create or verify the complete Java project by executing these component command procedures in order:

1. Read and execute `.github/prompts/git-init.prompt.md`.
2. Read and execute `.github/prompts/create-project.prompt.md`, passing Java 17 and the project name.
3. Read and execute `.github/prompts/create-build.prompt.md`.
4. Read and execute `.github/prompts/create-actions.prompt.md`.
5. Read and execute `.github/prompts/check.prompt.md` as a read-only audit.

Do the actual work described in each procedure; do not merely tell the user to run the component prompts. Preserve existing user files and make every operation idempotent. Stop at the first failed prerequisite, command, test, or verification; report which step failed and its diagnostic. Do not report later steps as successful when they were skipped.

## Completion criteria

- Java Hello World source, README, `.gitignore`, Maven configuration, `testBasicAddition`, and platform scripts exist.
- `bash scripts/ci.sh` or `scripts\\ci.bat` builds and tests the project, creates a runnable launcher under `build/`, and confirms the greeting output.
- GitHub Actions uses one three-platform matrix and delegates build/test work to the scripts.
- `build/` and `target/` are ignored.
- `docs/usage.md` contains exact agent and local commands.
- Final report lists files created, actual checks run, pass/fail status, and any remote CI evidence. Never fabricate a CI run or success.

## Preconditions

- The user has opened the intended repository root in VS Code and selected the Java Project Builder agent.
- A project name is provided; if omitted, ask before proceeding.
- Java 17 and Maven are available for the local build/test step.

## Expected files

- Git metadata and `.gitignore`
- Java source, test, Maven configuration, build scripts, and launcher templates
- Copilot agent, skills, prompt commands, and workflow
- `README.md` and `docs/usage.md`

## Verification

- Each component prompt's checks pass before the orchestrator proceeds.
- The final read-only `check` reports each check result and leaves Git status unchanged.
- The local launcher prints `Hello, World!`; `testBasicAddition` passes; Git ignores `build/`.

## Errors

- On the first failed prerequisite, file conflict, nonzero command, or test, stop and report the exact step and diagnostic.
- Do not delete user files, suppress error output, stage/commit changes, or claim a skipped check passed.
