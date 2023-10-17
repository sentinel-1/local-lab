#!/bin/bash


export WORKING_DIR="/working"
export VENV_DIR=`pwd`/.venv
export REQUIREMENTS_FILE=`pwd`/requirements-dev.txt


exec `pwd`/local-lab/start.sh

