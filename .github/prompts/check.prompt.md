---
name: check
description: Read-only audit of the agent manifest, skills, commands, project, repeatability, tests, Git hygiene, and CI workflow.
agent: Java Project Builder
---

Audit the repository without modifying its files or Git index.

## Preconditions

- Run from the repository root.
- Record `git status --short --branch` before checking.

## Actions

1. Inspect the agent manifest and verify its frontmatter includes a name and a useful description.
2. Verify the three required `SKILL.md` files exist and describe inputs, procedure, expected result, verification, and common failures.
3. Verify `git-init`, `create-project`, `create-build`, `create-actions`, `check`, and `init` prompts exist. For every component command, verify prerequisites, actions, expected files, checks, and errors. Verify `init` invokes the five component procedures in the required order and stops on failure.
4. Review create/update instructions for idempotency and preservation of existing files. In an isolated temporary workspace, run the creation procedures twice and compare the resulting file/configuration set; report repeatability as NOT RUN if the agent cannot safely execute this test.
5. Inspect the required source, test, Maven configuration, scripts, launchers/templates, README, `docs/usage.md`, `docs/architecture.md`, interaction log, verification evidence, and workflow. Verify the README identifies the student, group, variant, project, and agent invocation.
6. Check the Maven configuration and confirm `testBasicAddition` is present.
7. Validate the workflow structure: one matrix job, all three required OS labels, push and pull-request triggers for `develop` and `master`, Java setup, OS-specific script invocations, and artifact upload only after script success. Use an already available YAML validator if one exists; do not install tools or change project files.
8. Check `git ls-files` for tracked `build/` or `target/` output and suspicious secret/cache/log files. Confirm the ignore rules cover generated output and local secrets. If an existing secret scanner is available, run it without printing secret values; otherwise report that content scanning was NOT RUN.
9. Record `git status --short --branch`. In a temporary copy outside the repository (excluding `.git`, `target/`, and `build/`), run the platform CI script; verify tests, launcher creation, and exact greeting output.
10. Re-run `git status --short --branch` in the original repository and confirm it is unchanged.
11. Report every check as PASS, FAIL, or NOT RUN with concrete evidence. Do not turn unavailable checks into success.

## Expected files

- No project files changed, staged, or deleted by this command.
- Temporary workspaces and validation data are outside the repository and removed after the check.

## Verification

- Compare before/after Git status.
- Confirm `build/` and `target/` remain ignored in the original repository.
- Never print credential values while checking for secrets.

## Errors

- If a temporary copy cannot be created or cleaned up safely, stop and report the blocker.
- If the build, test, or YAML check fails, include the exact error and do not edit the project in this command.
