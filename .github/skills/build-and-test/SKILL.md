---
name: build-and-test
description: "Create and verify the build system, a basic addition function, and its unit test. Use when configuring compilation, test execution, packaging, or build scripts."
argument-hint: "Language and project name"
---

# Build and Test

Set up the requested language's build and test workflow. In this repository use Java 17, Maven, and JUnit 5.

## Inputs

- Required: language and project name.
- Existing source layout and build configuration, when available.

## Procedure

1. Inspect the existing source and build files. Preserve user changes and avoid duplicate plugin, dependency, and test configuration.
2. Configure a reproducible build and a test framework appropriate to the selected language.
3. Add a small, public basic-addition function. In this Java project, add `App.add(int left, int right)`.
4. Add a unit test named `testBasicAddition` that verifies a known sum. Keep the existing greeting test.
5. Add cross-platform build entry points `scripts/ci.sh` and `scripts/ci.bat`. Each script must:
   - fail with a clear message if Java or Maven is unavailable;
   - run the build and complete unit-test suite, propagating a nonzero failure code;
   - create the ignored `build/` output directory;
   - copy the packaged executable to `build/hello.jar`;
   - install a runnable launcher as `build/hello` on POSIX systems and `build/hello.bat` on Windows;
   - run the launcher, check that it prints the expected greeting, and fail otherwise.
6. Keep the scripts safe to rerun: generated outputs may be replaced, but never clean or delete unrelated files or directories.

## Example input

```text
Language: Java 17
Project name: HelloWorld
Test framework: JUnit 5
```

## Expected result

- Maven can compile, test, and package the executable application.
- `App.add(2, 3)` returns `5`, and `testBasicAddition` passes.
- `bash scripts/ci.sh` works on Linux/macOS; `scripts\ci.bat` works on Windows.
- Build output and a runnable platform launcher are produced under `build/`.

## Verification

- Run the platform-appropriate CI script from the repository root.
- Confirm the test report contains `testBasicAddition` with no failures.
- Confirm the script exits nonzero when compilation or a test fails.
- Run the generated launcher and check exact output `Hello, World!`.
- Confirm `build/` is ignored by Git.

## Common failures

- **Java or Maven unavailable:** print the missing prerequisite and exit nonzero.
- **Build or test failure:** preserve Maven's diagnostic output, propagate failure, and do not produce success-shaped output.
- **Launcher output is unexpected:** report expected and actual output and exit nonzero.
- **Generated file conflicts with a directory or unrelated content:** stop and report the conflict; do not delete user data.
