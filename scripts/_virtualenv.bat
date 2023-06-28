@ECHO OFF

IF DEFINED VENV_DIR (
    ECHO Using Python virtual environment directory: "%VENV_DIR%"
) ELSE (
    ECHO VENV_DIR Variable is not set. Exiting...
    EXIT /b -1
)

IF DEFINED REQUIREMENTS_FILE (
    ECHO Using requirements filet: "%REQUIREMENTS_FILE%"
) ELSE (
    ECHO REQUIREMENTS_FILE Variable is not set. Exiting...
    EXIT /b -1
)


IF NOT EXIST "%VENV_DIR%" (
    ECHO Creating virtual environment...
    python -m venv "%VENV_DIR%"
    IF %ERRORLEVEL% NEQ 0 (
        ECHO Error: Unable to create virtual environment. Ensure Python is installed and try again.
        EXIT /b 1
    )
    ECHO Virtual environment created successfully.
    ECHO Activating new virtual environment...
    CALL "%VENV_DIR%\Scripts\activate.bat" && ECHO Virtualenv OK || ECHO Virtualenv FAIL && EXIT /b 1
    ECHO Installing dependencies...
    CALL pip install -r "%REQUIREMENTS_FILE%" && ECHO Dependencies OK || ECHO Dependencies FAIL && EXIT /b 1

) ELSE (
    ECHO Activating existing virtual environment...
    CALL "%VENV_DIR%\Scripts\activate.bat" && ECHO Virtualenv OK || ECHO Virtualenv FAIL && EXIT /b 1
)

