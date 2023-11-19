#!/bin/bash

# _install-symfony-saas.sh

# Demander des informations de configuration à l'utilisateur
read -p "Entrez le nom de votre projet Symfony: " symfony_project_name
read -p "Entrez le chemin d'installation (appuyez sur Entrée pour utiliser le répertoire actuel): " symfony_install_path

# Aller dans le répertoire d'installation
cd $symfony_install_path

# Installer Symfony avec Flex
composer create-project symfony/skeleton $symfony_project_name

# Aller dans le répertoire du projet Symfony
cd $symfony_project_name

# Installer les dépendances nécessaires pour un starter kit SaaS avec Symfony Flex
composer require symfony/webpack-encore-bundle symfony/twig-bundle symfony/maker-bundle symfony/security-bundle symfony/orm-pack doctrine/doctrine-bundle doctrine/doctrine-migrations-bundle lexik/jwt-authentication-bundle
composer require friendsofsymfony/user-bundle vich/uploader-bundle knplabs/knp-paginator-bundle

# Installer les dépendances pour Sass et Encore
composer require symfony/asset symfony/orm-pack encore

# Installer les dépendances pour la gestion de la base de données
composer require symfony/doctrine-bridge symfony/validator symfony/serializer symfony/security-csrf doctrine/doctrine-migrations-bundle

# Installer les dépendances pour la gestion des abonnements (avec Stripe en exemple)
composer require stripe/stripe-php

# Installer les dépendances pour la gestion des fichiers
composer require vich/uploader-bundle

# Installer les dépendances pour la gestion des pages
composer require symfony/asset symfony/twig-bundle symfony/expression-language symfony/serializer symfony/form

# Installer les dépendances pour la gestion des produits
composer require symfony/twig-bundle symfony/expression-language symfony/serializer symfony/form

# Installer les dépendances pour la gestion du profil
composer require symfony/twig-bundle symfony/expression-language symfony/serializer symfony/form

# Installer les dépendances pour la gestion de la double authentification
composer require symfony/twig-bundle symfony/expression-language symfony/serializer symfony/form

# Mettre à jour les dépendances
composer update

# Installer les dépendances JavaScript et CSS avec Yarn
yarn install

# Afficher un message de fin
echo "Symfony avec toutes les dépendances pour un starter kit SaaS a été installé avec succès dans le répertoire $symfony_install_path/$symfony_project_name."
