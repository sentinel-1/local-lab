@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION


SET WORKING_DIR="/working"
SET VENV_DIR=%CD%\.venv
SET REQUIREMENTS_FILE=%CD%\requirements-dev.txt


REM Start the Local Jupyter Lab
CALL %CD%\local-lab/start.bat

ENDLOCAL

EXIT /b 0
