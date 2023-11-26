#!/bin/bash

# Fonction pour saisir une valeur avec une invite
get_input() {
    read -p "$1: " input
    echo "$input"
}

# Fonction pour afficher une liste numérotée
show_list() {
    echo "Choisissez une option :"
    select option in "${@:2}"; do
        if [[ -n $option ]]; then
            break
        else
            echo "Option invalide. Réessayez."
        fi
    done
    echo "$option"
}

# Nom du projet
project_name=$(get_input "Entrez le nom de votre projet")

# Destination du projet (par défaut: projects/)
project_destination=$(get_input "Entrez le chemin de destination du projet (par défaut: projects/)")
if [[ -z $project_destination ]]; then
    project_destination="projects"
fi

# Créer le dossier du projet par version de Laravel
bash src/cmds/sh/laravel/create_project.sh

# Créer le projet Laravel (condition si cmd : avec --auth, avec jetsream, orchid, et 20 autres propositions, etc.)
read -p "Voulez-vous ajouter le système d'authentification Laravel ? (y/n): " add_lara_auth
if [[ $add_lara_auth == "y" ]]; then
  composer require laravel/ui
  php artisan ui bootstrap --auth
fi

# Copier le fichier .env.example en .env
cp ".env.example" ".env"
echo "Fichier .env.example copié en .env. Modifier les informations de connexion à la base de données pour continuer."
echo "N'oublier pas le APP_NAME,... Appuyez sur une touche pour continuer."
read -n 1 -s
nano .env

n

# Générer la clé token d'application
bash src/cmds/sh/laravel/key_generate.sh

# Liste des packages Laravel
packages=("spatie/laravel-permission" "barryvdh/laravel-debugbar", "laravel/jetstream", "laravel/telescope", "laraflash/flash", "orchid/platform")
# Sélectionner un ou plusieurs packages
if [[ ${#packages[@]} -gt 0 ]]; then
    echo "Packages disponibles :"
    for package in "${packages[@]}"; do
        echo "- $package"
        if [[ $package == "spatie/laravel-permission" ]]; then
            echo "Package de gestion des permissions"
            read -p "Voulez-vous installer le package spatie/laravel-permission ? (y/n): " install_permission
            if [[ $install_permission == "y" ]]; then
                composer require spatie/laravel-permission
                php artisan vendor:publish --provider="Spatie\Permission\PermissionServiceProvider" --tag="migrations"
                php artisan migrate
                echo "Ajoutez @role('admin') dans votre layout"
            fi
        fi
        if [[ $package == "barryvdh/laravel-debugbar" ]]; then
            echo "Package de débogage"
            read -p "Voulez-vous installer le package barryvdh/laravel-debugbar ? (y/n): " install_debugbar
            if [[ $install_debugbar == "y" ]]; then
                composer require barryvdh/laravel-debugbar --dev
                php artisan vendor:publish --provider="Barryvdh\Debugbar\ServiceProvider"
                echo "Ajoutez @include('debugbar::scripts') dans votre layout"
            fi
        fi
        if [[ $package == "laravel/jetstream" ]]; then
            echo "Package de gestion des équipes"
            read -p "Voulez-vous installer le package laravel/jetstream ? (y/n): " install_jetstream
            if [[ $install_jetstream == "y" ]]; then
                composer require laravel/jetstream
                php artisan jetstream:install livewire
                echo "Ajoutez @livewireScripts dans votre layout"
            fi
        fi
        if [[ $package == "laravel/telescope" ]]; then
            echo "Package de débogage"
            read -p "Voulez-vous installer le package laravel/telescope ? (y/n): " install_telescope
            if [[ $install_telescope == "y" ]]; then
                composer require laravel/telescope
                php artisan telescope:install
                php artisan migrate
                echo "Ajoutez Telescope::night() dans votre layout"
            fi
        fi
        if [[ $package == "laraflash/flash" ]]; then
            echo "Package de gestion des messages flash"
            read -p "Voulez-vous installer le package laraflash/flash ? (y/n): " install_flash
            if [[ $install_flash == "y" ]]; then
                composer require laraflash/flash
                php artisan vendor:publish --provider="Laraflash\Flash\LaraflashServiceProvider"
                echo "Ajoutez @include('flash::message') dans votre layout"
            fi
        fi
        if [[ $package == "orchid/platform" ]]; then
            echo "Package de gestion des messages flash"
            read -p "Voulez-vous installer le package orchid/platform ? (y/n): " install_orchid
            if [[ $install_orchid == "y" ]]; then
                composer require orchid/platform
                php artisan orchid:install
                php artisan orchid:link
                php artisan orchid:admin admin
                echo "Accédez à votre projet à l'URL /dashboard"
            fi
        fi
    done
else
    echo "Aucun package disponible."
fi

# npm install && npm run dev
npm install
npm run build

## php artisan migrate (demande d'acceptation avant)
#read -p "Voulez-vous exécuter les migrations ? (y/n): " migrate
#if [[ $migrate == "y" ]]; then
#    php artisan migrate
#fi
#
## php artisan db:seed (demande d'acceptation avant)
#read -p "Voulez-vous exécuter les seeders ? (y/n): " seed
#if [[ $seed == "y" ]]; then
#    php artisan db:seed
#fiye


# Créer le lien symbolique vers le dossier storage
bash src/cmds/sh/laravel/link_storage.sh
# Créer le virtual host
bash src/cmds/sh/actions/create_virtual_hosts.sh
# Lancer le serveur
bash src/cmds/sh/laravel/start.sh

