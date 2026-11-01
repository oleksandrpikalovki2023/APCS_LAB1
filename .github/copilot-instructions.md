# Project Instructions

- Keep the sample application cross-platform and dependency-light.
- Use Java 17 and Maven for builds and tests.
- Keep application code under `src/main/java` and tests under `src/test/java`.
- Build scripts `scripts/ci.sh` and `scripts/ci.bat` own compilation, unit tests, launcher creation, and runtime verification.
- Generate the executable JAR and launchers under `build/`; keep `build/` and Maven's `target/` out of Git.
- Before reporting success, run the platform build script and confirm `testBasicAddition` passes.
- Keep generated output, caches, local run logs, credentials, and tokens out of Git.
- GitHub Actions must delegate build and test operations to the platform scripts, using one Windows/Linux/macOS matrix job.
- Update README, `docs/usage.md`, and verification evidence when commands or observable behavior change.
