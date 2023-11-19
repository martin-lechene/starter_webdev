#!/bin/bash

# install_django.sh

# Installer Django pour créer une web app
pip install django

# Initialiser un projet Django
django-admin startproject webapp

# Afficher un message de fin
echo "Web app Django a été créée dans le répertoire 'webapp'."
