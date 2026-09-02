@echo off
setlocal
set "APP_HOME=%~dp0"
set "GRADLE_VERSION=8.7"
set "GRADLE_HOME=%USERPROFILE%\.gradle\wrapper\dists\gradle-%GRADLE_VERSION%-bin\local"
set "GRADLE_DIR=%GRADLE_HOME%\gradle-%GRADLE_VERSION%"
if not exist "%GRADLE_DIR%\bin\gradle.bat" (
  if not exist "%GRADLE_HOME%" mkdir "%GRADLE_HOME%"
  powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri 'https://services.gradle.org/distributions/gradle-%GRADLE_VERSION%-bin.zip' -OutFile '%GRADLE_HOME%\gradle-%GRADLE_VERSION%-bin.zip'"
  powershell -NoProfile -ExecutionPolicy Bypass -Command "Expand-Archive -Path '%GRADLE_HOME%\gradle-%GRADLE_VERSION%-bin.zip' -DestinationPath '%GRADLE_HOME%' -Force"
)
call "%GRADLE_DIR%\bin\gradle.bat" %*
endlocal
