@ECHO OFF

IF "%~1"=="" (
    ECHO No argument supplied. Exiting...
    EXIT /b -1
)

SETLOCAL
SET "BASE_NAME=%~1"
SET "scriptPath=%~dp0"

PUSHD "%scriptPath%\..\working"

IF NOT EXIST "%BASE_NAME%.ipynb" (
    ECHO File does not exist: %BASE_NAME%.ipynb. Exiting...
    EXIT /b -1
)

REM The command to convert the Jupyter Notebook (.ipynb) into Python script (.py)
SET "CONVERT_NOTEBOOK_CMD=jupyter-nbconvert --to script --output=%BASE_NAME% %BASE_NAME%.ipynb"

REM Check if the .py file exists
IF NOT EXIST "%BASE_NAME%.py" (
    ECHO The Python file does not exist, converting the notebook...
    CALL %CONVERT_NOTEBOOK_CMD% && ECHO Converting OK || ECHO Converting FAIL && EXIT /b -2
)

REM Get the last modification times of the .py and .ipynb files
FOR %%A IN ("%BASE_NAME%.py") DO SET "PY_TIME=%%~tA"
FOR %%A IN ("%BASE_NAME%.ipynb") DO SET "IPYNB_TIME=%%~tA"

REM Compare the last modification times
IF "%PY_TIME%" LSS "%IPYNB_TIME%" (
    ECHO The notebook is newer than the Python file, converting the notebook...
    CALL %CONVERT_NOTEBOOK_CMD% && ECHO Converting OK || ECHO Converting FAIL && EXIT /b -2
) ELSE (
    ECHO The Python file OK.
)

POPD

ENDLOCAL
