#!/bin/bash

if [[ -n $VENV_DIR ]]; then
    echo "Using Python virtual environment directory: $VENV_DIR"
else
    echo "VENV_DIR Variable is not set. Exiting..."
    exit -1
fi

if [[ -n $REQUIREMENTS_FILE ]]; then
    echo "Using requirements file: $REQUIREMENTS_FILE"
else
    echo "REQUIREMENTS_FILE Variable is not set. Exiting..."
    exit -1
fi

if [[ ! -d $VENV_DIR ]]; then
    echo "Creating virtual environment..."
    python3 -m venv "$VENV_DIR"
    if [[ $? -ne 0 ]]; then
        echo "Error: Unable to create virtual environment. Ensure Python is installed and try again."
        exit 1
    fi
    echo "Virtual environment created successfully."
    echo "Activating new virtual environment..."
    source "$VENV_DIR/bin/activate" &&  echo "Virtualenv OK" || (echo "Virtualenv FAIL" && exit 1)
    echo "Installing dependencies..."
    pip install -r "$REQUIREMENTS_FILE" && echo "Dependencies OK" || (echo "Dependencies FAIL" && exit 1)
else
    echo "Activating existing virtual environment..."
    source "$VENV_DIR/bin/activate" && echo "Virtualenv OK" || (echo "Virtualenv FAIL" && exit 1)
fi

return 0
