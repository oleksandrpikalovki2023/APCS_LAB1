---
name: create-actions
description: Configure GitHub Actions for Windows, Linux, and macOS by invoking the repository build scripts.
agent: Java Project Builder
---

Use the `github-actions` skill to create or update `.github/workflows/ci.yml`.

## Preconditions

- `scripts/ci.sh` and `scripts/ci.bat` exist and work locally.
- Read the existing workflow first.

## Actions

1. Define exactly one job with a matrix of Ubuntu, Windows, and macOS.
2. Run on pushes to `develop` and `master`, and pull requests targeting `develop` and `master`.
3. Configure checkout and Java 17.
4. Invoke only `bash scripts/ci.sh` on Linux/macOS and `scripts\\ci.bat` on Windows for build/test/runtime verification. Do not put Maven or test commands directly in YAML.
5. Upload `build/` artifacts after the script succeeds.
6. Do not add secrets or tokens.
7. Create or update `docs/usage.md` with the exact prompt invocation and the Windows/Linux/macOS script and launcher commands.

## Expected files

- `.github/workflows/ci.yml`
- `docs/usage.md`

## Verification

- Confirm triggers, one matrix job, all three OS values, and OS-specific script invocation.
- Confirm the script step fails the job on a nonzero exit code.
- Push the change or open a pull request and report actual workflow status and link.

## Errors

- If a referenced script is missing or fails locally, fix that script first; do not duplicate its build logic in YAML.
- If GitHub access or workflow execution is unavailable, report it explicitly.
