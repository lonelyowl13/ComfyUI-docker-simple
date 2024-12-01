#!/bin/bash

VENVDIR="/venv"

if [ ! -f "$VENVDIR/bin/activate" ]; then
    virtualenv "$VENVDIR" --system-site-packages
    echo "Virtual environment created at $VENVDIR"
else
    echo "Virtual environment already exists at $VENVDIR. No action taken."
fi
