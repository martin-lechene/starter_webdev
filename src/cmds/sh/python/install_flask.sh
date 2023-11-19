#!/bin/bash

# install_flask.sh

# Installer Flask
pip install Flask

# Créer un fichier app.py pour une application web simple
echo -e "from flask import Flask\napp = Flask(__name__)\n\n@app.route('/')\ndef hello_world():\n    return 'Hello, Flask!'\n\nif __name__ == '__main__':\n    app.run(debug=True)" > app.py

# Afficher un message de fin
echo "Application Flask a été créée dans le fichier 'app.py'."
