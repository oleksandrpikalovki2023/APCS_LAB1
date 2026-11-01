---
name: create-project
description: Create the minimal Java Hello World project, README, standard folders, and .gitignore by following project-scaffold.
agent: Java Project Builder
argument-hint: "Project name (default: hello-world)"
---

Use the `project-scaffold` skill to create the requested project.

## Preconditions

- Repository root is open and `git-init` has been run.
- Use Java 17 for this lab. Ask if the project name is not provided; use `hello-world` only when the user accepts that default.
- Inspect existing paths and preserve unrelated files.

## Actions

1. Follow the `project-scaffold` procedure with language Java 17 and the provided project name.
2. Create a minimal `App` entry point under `src/main/java/ua/edu/apcs/helloworld/`.
3. Ensure Maven project metadata and a README describe exact build and launch commands.
4. Ensure `.gitignore` excludes generated output and local-only files.

## Expected files

- `src/main/java/ua/edu/apcs/helloworld/App.java`
- `pom.xml`
- `README.md`
- `.gitignore`

## Verification

- Confirm the source file and runnable entry point exist.
- Follow the README's build/run command and check for `Hello, World!`.
- Report commands, output, and any pre-existing files left untouched.

## Errors

- Stop on a conflicting pre-existing source or build file and ask before replacing it.
- If Java is unavailable, report the prerequisite and do not claim successful verification.
