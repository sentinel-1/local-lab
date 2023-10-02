#!/bin/bash


scriptPath="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Activate Python virtual environment
source "${scriptPath}/scripts/_virtualenv.sh"
exit_code=$?
if [ $exit_code -ne 0 ]; then
    echo "There was an error: $exit_code"
    exit $exit_code
fi
export JUPYTER_CONFIG_DIR="$(pwd)/.jupyter"

# Ensure that the JUPYTER_CONFIG_DIR is populated with initial configuration
source "${scriptPath}/scripts/_local_jupyter_conf.sh"
exit_code=$?
if [ $exit_code -ne 0 ]; then
    echo "There was an error: $exit_code"
    exit $exit_code
fi

echo
echo "*** STARTING Jupyter Lab..."

# Start Jupyter Lab
# NOTE: make sure JUPYTER_CONFIG_DIR environment variable is set BEFORE running jupyter-lab
jupyter-lab --notebook-dir "$(pwd)" --LabApp.default_url /lab?file-browser-path=$WORKING_DIR

exit 0

