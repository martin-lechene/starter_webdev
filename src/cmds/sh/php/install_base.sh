#!/bin/bash

# Liste pré-définie des 20 packages importants pour un projet PHP POO
packages=("phpunit/phpunit" "vlucas/phpdotenv" "symfony/console" "symfony/var-dumper" 
          "symfony/http-foundation" "symfony/http-kernel" "monolog/monolog" "doctrine/orm" 
          "doctrine/dbal" "filp/whoops" "guzzlehttp/guzzle" "nesbot/carbon" 
          "nikic/fast-route" "league/container" "league/route" "twig/twig" 
          "illuminate/database" "illuminate/events" "symfony/validator" "symfony/form")

# Fonction pour installer un package avec Composer
install_package() {
    read -p "Voulez-vous installer $1 ? (y/n): " choice
    if [ "$choice" == "y" ]; then
        composer require "$1"
        echo "Le package $1 a été installé avec succès!"
    else
        echo "L'installation du package $1 a été annulée."
    fi
}

# Afficher la liste des packages et installer un à un
for package in "${packages[@]}"; do
    install_package "$package"
done

# Message de fin
echo "Installation des packages PHP POO terminée!"
