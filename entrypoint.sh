#!/bin/bash

# Set environment variable
# export SCRIPT_NAME="mex.py"

# Start Nginx in the background
nginx &

# Run the Python script
#python "$SCRIPT_NAME"

# Run Gunicorn
exec gunicorn --bind 0.0.0.0:5601 --timeout 300 mex:app