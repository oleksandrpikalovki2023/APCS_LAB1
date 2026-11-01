---
name: check
description: Read-only project audit that verifies structure, Maven configuration, tests, launcher, ignore rules, and CI YAML.
agent: Java Project Builder
---

Audit the repository without modifying its files or Git index.

## Preconditions

- Run from the repository root.
- Record `git status --short --branch` before checking.

## Actions

1. Inspect required source, test, build-script, workflow, documentation, and agent files.
2. Check Maven configuration and test names.
3. Run YAML/workflow validation if a validator is already available; do not install dependencies or alter project files for validation.
4. To run build and tests without changing the working project, make a temporary copy of required project files outside the repository, excluding `.git`, `target/`, and `build/`; execute the platform CI script in that copy.
5. Confirm the temporary build produces an executable launcher and `testBasicAddition` passes.
6. Re-run `git status --short --branch` in the original repository and confirm it is unchanged.
7. Report each check as PASS, FAIL, or NOT RUN with concrete evidence. Do not turn unavailable checks into success.

## Expected files

- No project files changed, staged, or deleted by this command.
- Temporary validation data is outside the repository and removed after the check.

## Verification

- Compare before/after Git status.
- Confirm `build/` and `target/` remain ignored in the original repository.

## Errors

- If a temporary copy cannot be created or cleaned up safely, stop and report the blocker.
- If the build, test, or YAML check fails, include the exact error and do not edit the project in this command.
