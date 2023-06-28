@ECHO OFF

IF DEFINED JUPYTER_CONFIG_DIR (
    ECHO Using the JupyterLab config directory: "%JUPYTER_CONFIG_DIR%"
) ELSE (
    ECHO JUPYTER_CONFIG_DIR Variable is not set. Exiting...
    EXIT /b -1
)


SETLOCAL
SET "scriptPath=%~dp0"


if NOT EXIST "%VENV_DIR%\Scripts\jupyter-lab.exe" (
  ECHO *** WARNING: jupyterlab was not installed...
  ECHO *** Installing default version of jupyterlab
  "%VENV_DIR%\Scripts\pip.exe" install jupyterlab || exit /b 1
) ELSE (
  ECHO jupyterlab OK
)

IF NOT EXIST "%JUPYTER_CONFIG_DIR%" (
  ECHO *** Generating jupyterlab configuration
	CALL "%VENV_DIR%\Scripts\jupyter-lab" --generate-config
  ROBOCOPY "%scriptPath%\conf\lab" "%JUPYTER_CONFIG_DIR%\lab" /E /NJH /NJS /NS /NP /NDL /NFL
  TYPE "%scriptPath%\conf\_additional_jupyter_lab_config.py" >> "%JUPYTER_CONFIG_DIR%\jupyter_lab_config.py"

) ELSE (
  ECHO jupyterlab config OK
)


ENDLOCAL
