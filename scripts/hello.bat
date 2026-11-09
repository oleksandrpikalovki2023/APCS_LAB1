@echo off
setlocal
java -jar "%~dp0hello.jar" %*
exit /b %ERRORLEVEL%
