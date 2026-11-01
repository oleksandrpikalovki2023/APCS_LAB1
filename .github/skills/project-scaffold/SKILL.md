---
name: project-scaffold
description: "Create a minimal Hello World project, README, directory structure, and initial .gitignore. Use when scaffolding a new project from a language and project name."
argument-hint: "Language and project name, for example: Java, HelloWorld"
---

# Project Scaffold

Create a small, runnable project using the requested language and project name.

## Inputs

- Required: implementation language.
- Required: project name. Use it consistently for the project directory and build metadata.
- If an input is missing, ask for it before creating files.

## Procedure

1. Inspect the repository, current branch, existing files, and `.gitignore`.
2. Do not overwrite or delete user files. Reuse compatible files; explain conflicts and stop rather than replacing incompatible user work.
3. Create the minimal source layout and a Hello World entry point for the requested language.
4. Create or update `README.md` with prerequisites, exact build/run commands, and expected output.
5. Create or update `.gitignore` with language/build output, local caches, logs, environment files, and secrets. Preserve existing rules and avoid duplicate entries.
6. Make repeated runs idempotent: update only the files needed and never append duplicate configuration.

## Example input

```text
Language: Java 17
Project name: HelloWorld
```

## Expected result

- The language's source file exists under the conventional source directory.
- The project has a documented command that runs the Hello World application.
- `README.md` and `.gitignore` exist and describe the selected project.
- For this repository's Java/Maven scenario, the entry point is
  `src/main/java/ua/edu/apcs/helloworld/App.java`, the project metadata is in
  `pom.xml`, and the packaged application runs with
  `java -jar target/hello-world-1.0.0.jar`.

## Verification

- Confirm the source entry point exists.
- Run the documented command in the project directory.
- Confirm the output is `Hello, World!`.
- Review `git status --short` and confirm no generated output or secret files are staged.

## Common failures

- **Language or project name missing:** ask the user; do not guess.
- **A target file already contains unrelated work:** preserve it and ask before replacing it.
- **Runtime or compiler is unavailable:** report the missing prerequisite and the exact installation requirement.
- **Run command fails:** report the command and error; do not report the scaffold as verified.
