#!/bin/bash

# _install-symfony-flex.sh

# Demander des informations de configuration à l'utilisateur
read -p "Entrez le nom de votre projet Symfony: " symfony_project_name
read -p "Entrez le chemin d'installation (appuyez sur Entrée pour utiliser le répertoire actuel): " symfony_install_path

# Aller dans le répertoire d'installation
cd $symfony_install_path

# Installer Symfony avec Flex
composer create-project symfony/skeleton $symfony_project_name

# Aller dans le répertoire du projet Symfony
cd $symfony_project_name

# Utiliser Flex pour installer les dépendances nécessaires
composer require symfony/webpack-encore-bundle symfony/twig-bundle symfony/maker-bundle

# Mettre à jour les dépendances
composer update

# Installer les dépendances JavaScript et CSS avec Yarn
yarn install

# Afficher un message de fin
echo "Symfony avec Flex et les dépendances nécessaires a été installé avec succès dans le répertoire $symfony_install_path/$symfony_project_name."
