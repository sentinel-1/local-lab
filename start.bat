@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION


REM Create (if needed) and activate Python virtual environment
CALL "%~dp0scripts\_virtualenv.bat"
IF %ERRORLEVEL% NEQ 0 (
  ECHO There was an error: %ERRORLEVEL%.
  EXIT /b %ERRORLEVEL%
)


SET JUPYTER_CONFIG_DIR=%CD%\.jupyter
REM DEBUG: RD /s /q "%JUPYTER_CONFIG_DIR%"

REM Ensure that the JUPYTER_CONFIG_DIR is populated with initial configuration
CALL "%~dp0scripts\_local_jupyter_conf.bat"
IF %ERRORLEVEL% NEQ 0 (
  ECHO There was an error: %ERRORLEVEL%.
  EXIT /b %ERRORLEVEL%
)

ECHO.
ECHO *** STARTING Jupyter Lab...

REM Start Jupyter Lab
REM NOTE: make sure JUPYTER_CONFIG_DIR environment variable is set BEFORE running jupyter-lab
jupyter-lab --notebook-dir "%CD%" --LabApp.default_url /lab?file-browser-path=%WORKING_DIR%


ENDLOCAL

EXIT /b 0
