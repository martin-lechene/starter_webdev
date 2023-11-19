#!/bin/bash

# install_base.sh

# Définir le nom du projet
read -p "Nom du projet: " project_name

# Créer le répertoire du projet
mkdir "$project_name"
cd "$project_name"

# Créer un environnement virtuel
python -m venv venv

# Activer l'environnement virtuel
source venv/bin/activate

# Initialiser un projet Python
echo "print('Hello, $project_name!')" > main.py

# Afficher un message de fin
echo "Le projet $project_name a été initialisé avec succès!"

# Désactiver l'environnement virtuel
deactivate
