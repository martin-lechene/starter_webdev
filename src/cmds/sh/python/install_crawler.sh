#!/bin/bash

# install_crawler.sh

# Créer un crawler basique
echo -e "import requests\n\nresponse = requests.get('https://example.com')\nprint(response.text)" > crawler.py

# Afficher un message de fin
echo "Crawler basique a été créé dans le fichier 'crawler.py'."
