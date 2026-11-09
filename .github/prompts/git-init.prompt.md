---
name: git-init
description: Inspect Git repository state, safely create or update .gitignore, and report Git status.
agent: Java Project Builder
---

Inspect the repository root and Git state before changing anything.

## Preconditions

- The current directory is the intended project root.
- Preserve all tracked, untracked, and user-authored files.

## Actions

1. Run `git rev-parse --show-toplevel` and `git status --short --branch`.
2. If the current project root is not yet a Git repository, initialize Git in this directory. Do not initialize a parent or nested directory, and do not change a configured remote or branch.
3. Create or update `.gitignore` idempotently. Preserve existing rules and add missing entries for `target/`, `build/`, `.env`, `*.log`, IDE files, and OS files.
4. Do not stage, commit, reset, clean, or delete files.
5. Show the final Git status and summarize any pre-existing changes.

## Expected files

- `.gitignore`, created if absent or minimally updated if present.

## Verification

- Confirm each required ignore pattern appears exactly once.
- Run `git check-ignore build/hello.jar target/hello-world-1.0.0.jar`.
- Run `git status --short --branch` and report all changes without staging them.

## Errors

- If Git is unavailable, report the missing command.
- If the root or repository state is ambiguous, stop and ask instead of initializing the wrong directory.
- If `git init` fails, report its exact diagnostic and do not continue to project generation.
- If `.gitignore` cannot be safely updated, preserve its content and report the conflict.
