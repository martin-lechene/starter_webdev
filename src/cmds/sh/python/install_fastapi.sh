#!/bin/bash

# install_fastapi.sh

# Installer FastAPI
pip install fastapi uvicorn

# Créer un fichier main.py pour une API web simple
echo -e "from fastapi import FastAPI\napp = FastAPI()\n\n@app.get('/')\ndef read_root():\n    return {'Hello': 'FastAPI'}" > main.py

# Afficher un message de fin
echo "API FastAPI a été créée dans le fichier 'main.py'."
