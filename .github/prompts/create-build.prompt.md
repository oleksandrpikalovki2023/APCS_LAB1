---
name: create-build
description: Configure Maven, add BasicAddition and its JUnit test, and create cross-platform CI build scripts.
agent: Java Project Builder
---

Use the `build-and-test` skill to create the Java build and unit-test workflow.

## Preconditions

- `create-project` has created the Java 17 entry point.
- Inspect `pom.xml`, source files, and tests before editing.

## Actions

1. Configure Maven compilation, JUnit 5, test execution, and an executable JAR manifest without duplicating existing configuration.
2. Add `App.add(int left, int right)` and a JUnit test named `testBasicAddition`.
3. Keep the greeting test.
4. Create `scripts/ci.sh`, `scripts/ci.bat`, and launcher templates needed to generate `build/hello` and `build/hello.bat`.
5. Scripts must run Maven verification, fail with a useful message on errors, generate outputs under `build/`, launch the packaged app, and verify exact output `Hello, World!`.
6. Add `build/` to `.gitignore` once.

## Expected files

- Updated `pom.xml`, `App.java`, and `AppTest.java`
- `scripts/ci.sh`, `scripts/ci.bat`, POSIX and Windows launcher templates
- Updated `.gitignore`

## Verification

- Windows: run `scripts\\ci.bat`.
- Linux/macOS: run `bash scripts/ci.sh`.
- Confirm `testBasicAddition` passes and the generated launcher prints `Hello, World!`.
- Confirm `build/` is ignored.

## Errors

- Stop on existing conflicting script/test files; do not overwrite user changes without permission.
- Preserve build/test diagnostics and propagate nonzero exit codes.
