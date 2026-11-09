@echo off
setlocal
cd /d "%~dp0.."

where java >nul 2>nul
if errorlevel 1 (
    echo ERROR: Java 17 or newer is required but was not found on PATH.
    exit /b 1
)

where mvn >nul 2>nul
if errorlevel 1 (
    echo ERROR: Apache Maven is required but was not found on PATH.
    exit /b 1
)

echo [INFO] Building the project and running unit tests...
call mvn --batch-mode --no-transfer-progress clean verify
if errorlevel 1 exit /b 1

if not exist build mkdir build
copy /Y "target\hello-world-1.0.0.jar" "build\hello.jar" >nul
if errorlevel 1 (
    echo ERROR: Could not copy the executable JAR to build.
    exit /b 1
)
copy /Y "scripts\hello.bat" "build\hello.bat" >nul
if errorlevel 1 (
    echo ERROR: Could not create the Windows launcher.
    exit /b 1
)

echo [INFO] Verifying the generated launcher...
call "build\hello.bat" > "build\hello-output.txt"
if errorlevel 1 (
    echo ERROR: The generated launcher failed.
    del /q "build\hello-output.txt" >nul 2>nul
    exit /b 1
)
set /p ACTUAL_OUTPUT=<"build\hello-output.txt"
del /q "build\hello-output.txt" >nul 2>nul
if not "%ACTUAL_OUTPUT%"=="Hello, World!" (
    echo ERROR: Expected Hello, World! but got "%ACTUAL_OUTPUT%".
    exit /b 1
)

echo %ACTUAL_OUTPUT%
echo [OK] Build, tests, and launcher verification passed.
exit /b 0
