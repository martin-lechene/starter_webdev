#!/bin/bash

# Script d'installation pour le projet brionmario/php-starter

# Cloner le dépôt
git clone https://github.com/brionmario/php-starter.git

# Accéder au répertoire du projet
cd php-starter

# Copier le fichier de configuration d'exemple
cp .env.example .env

# Éditer le fichier de configuration .env en fonction de vos besoins

# Construire et démarrer les conteneurs Docker
docker-compose build
docker-compose up -d

# Installer les dépendances PHP avec Composer
docker-compose run --rm composer install

# Installer les dépendances JavaScript avec npm
docker-compose run --rm npm install

# Générer les assets avec npm
docker-compose run --rm npm run dev

# Afficher un message de fin
echo "Le projet a été installé avec succès!"

# Accéder à l'application à l'adresse http://localhost:8080
