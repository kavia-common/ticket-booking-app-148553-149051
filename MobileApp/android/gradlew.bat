@ECHO OFF
REM PUBLIC_INTERFACE
REM Minimal gradlew shim for Windows environments.
SETLOCAL
SET DIR=%~dp0
SET WRAPPER_JAR=%DIR%gradle\wrapper\gradle-wrapper.jar
IF NOT EXIST "%WRAPPER_JAR%" (
  ECHO ERROR: Gradle wrapper JAR not found at %WRAPPER_JAR%
  EXIT /B 1
)
java -jar "%WRAPPER_JAR%" %*
ENDLOCAL
