#!/bin/bash

# Check if JUPYTER_CONFIG_DIR is set
if [[ -z $JUPYTER_CONFIG_DIR ]]; then
    echo "JUPYTER_CONFIG_DIR Variable is not set. Exiting..."
    exit 1
else
    echo "Using the JupyterLab config directory: $JUPYTER_CONFIG_DIR"
fi

scriptPath="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Check if jupyter-lab is installed
if [[ ! -x $VENV_DIR/bin/jupyter-lab ]]; then
    echo "*** WARNING: jupyterlab was not installed..."
    echo "*** Installing default version of jupyterlab"
    "$VENV_DIR/bin/pip" install jupyterlab || exit 1
else
    echo "jupyterlab OK"
fi

# Check if JupyterLab configuration exists
if [[ ! -d $JUPYTER_CONFIG_DIR ]]; then
    echo "*** Generating jupyterlab configuration"
    "$VENV_DIR/bin/jupyter-lab" --generate-config
    mkdir -p "$JUPYTER_CONFIG_DIR/lab"
    cp -r "$scriptPath/conf/lab"/* "$JUPYTER_CONFIG_DIR/lab"
    cat "$scriptPath/conf/_additional_jupyter_lab_config.py" >> "$JUPYTER_CONFIG_DIR/jupyter_lab_config.py"
else
    echo "jupyterlab config OK"
fi

return 0
