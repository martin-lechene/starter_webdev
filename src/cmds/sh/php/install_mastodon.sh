#!/bin/bash

# Script d'installation de base pour Mastodon (exemple simplifié)

# Cloner le dépôt Mastodon
git clone https://github.com/tootsuite/mastodon.git

# Accéder au répertoire Mastodon
cd mastodon

# Copier le fichier de configuration d'exemple
cp .env.production.sample .env.production

# Éditer le fichier de configuration .env.production en fonction de vos besoins

# Construire et démarrer les conteneurs Docker
docker-compose build
docker-compose run --rm web bundle exec rake db:migrate
docker-compose run --rm web bundle exec rake assets:precompile
docker-compose up -d

# Afficher un message de fin
echo "Mastodon a été installé avec succès!"

# Accéder à l'instance Mastodon à l'adresse http://localhost:3000
