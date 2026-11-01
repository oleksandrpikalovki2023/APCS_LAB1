---
name: github-actions
description: "Create or update a GitHub Actions workflow with a Windows, Linux, and macOS matrix. The workflow delegates build and tests to repository scripts."
argument-hint: "Build script paths and target branches"
---

# GitHub Actions

Configure `.github/workflows/ci.yml` for this Java 17 Maven project without duplicating build logic in YAML.

## Inputs

- Existing build entry points. In this repository: `scripts/ci.sh` and `scripts/ci.bat`.
- Target push and pull-request branches.

## Procedure

1. Inspect the current workflow and build scripts.
2. Define one job with a matrix of `ubuntu-latest`, `windows-latest`, and `macos-latest`.
3. Trigger on pushes to `develop` and `master`, and pull requests targeting `develop` and `master`.
4. Use checkout and Java 17 setup actions. Do not place Maven build or test commands directly in YAML.
5. Invoke `bash scripts/ci.sh` on Linux/macOS and `scripts\\ci.bat` on Windows. The scripts own build, tests, launcher creation, and output verification.
6. Upload the generated `build/` launcher and JAR as a workflow artifact only after the script succeeds.
7. Keep permissions minimal and never place credentials, tokens, or secrets in the workflow.

## Example input

```text
Build scripts: scripts/ci.sh, scripts/ci.bat
Push branches: develop, master
Pull request base branches: develop, master
Platforms: ubuntu-latest, windows-latest, macos-latest
```

## Expected result

- A syntactically valid `.github/workflows/ci.yml` with exactly one matrix job.
- Each matrix leg checks out code, configures Java, invokes the OS-specific script, and uploads build output only after success.
- YAML contains no direct compiler, Maven, or test invocation.

## Verification

- Inspect the workflow triggers, single job, and three matrix operating systems.
- Confirm non-Windows invokes only `bash scripts/ci.sh` and Windows invokes `scripts\\ci.bat`.
- Confirm the build scripts perform compilation, tests, executable generation, and runtime output verification.
- Push and pull-request workflow runs must complete successfully on all three platforms before reporting CI success.

## Common failures

- **Script missing or not executable:** fix the tracked script and permissions; do not move build commands into YAML.
- **One platform fails:** report the platform and job logs; do not claim matrix success.
- **Artifact absent:** fail the job on missing files and fix the script's output path.
- **Invalid YAML or unsupported action configuration:** correct the workflow and rerun CI.
