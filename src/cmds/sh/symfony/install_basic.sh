#!/bin/bash

# install_basic.sh

# Demander des informations de configuration à l'utilisateur
read -p "Entrez le nom de votre projet Symfony: " symfony_project_name
read -p "Entrez le chemin d'installation (appuyez sur Entrée pour utiliser le répertoire actuel): " symfony_install_path
read -p "Entrez la version Symfony à installer (appuyez sur Entrée pour utiliser la dernière version): " symfony_version

# Utiliser la dernière version si aucune n'est spécifiée
symfony_version=${symfony_version:-"symfony/skeleton"}

# Aller dans le répertoire d'installation
cd $symfony_install_path

# Installer Symfony
composer create-project $symfony_version $symfony_project_name

# Afficher un message de fin
echo "Symfony a été installé avec succès dans le répertoire $symfony_install_path/$symfony_project_name."
