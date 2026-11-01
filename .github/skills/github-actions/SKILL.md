---
name: github-actions
description: "Create or update GitHub Actions CI for Java projects, with Maven build, unit tests, artifact upload, and Windows/Linux/macOS matrix. Use for CI or workflow tasks."
---

# GitHub Actions

Configure `.github/workflows/ci.yml` for this Java 17 Maven project.

1. Use a matrix with `windows-latest`, `ubuntu-latest`, and `macos-latest`.
2. Check out the repository and configure Java 17 with Maven dependency caching.
3. Run Maven `verify` in batch mode, failing the job on errors.
4. Upload the packaged executable JAR only after a successful build.
5. Validate YAML structure and ensure all paths work on all three platforms.

