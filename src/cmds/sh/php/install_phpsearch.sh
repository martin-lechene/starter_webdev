#!/bin/bash

# Script d'installation d'un nouveau projet PHP pur avec SearchPHP/PHPSearch

# Définir le nom du projet
read -p "Nom du projet: " project_name

# Créer le répertoire du projet
mkdir "$project_name"
cd "$project_name"

# Initialiser un projet PHP avec Composer
composer init --require=php --yes

# Créer les répertoires de base
mkdir public src

# Créer le fichier index.php
echo "<?php echo 'Hello, $project_name!'; ?>" > public/index.php

# Initialiser un fichier composer.json avec autoload
echo '{
    "autoload": {
        "psr-4": {
            "App\\": "src/"
        }
    },
    "require": {
        "searchphp/phpsearch": "*"
    }
}' > composer.json

# Initialiser un fichier .gitignore
echo "vendor/" > .gitignore

# Initialiser un fichier README.md
echo "# $project_name" > README.md

# Initialiser un projet npm (package.json)
npm init -y

# Afficher un message de fin
echo "Le projet $project_name a été initialisé avec succès, et SearchPHP/PHPSearch a été ajouté avec Composer!"
