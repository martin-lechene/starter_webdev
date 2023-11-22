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

# Aller dans le dossier de destination du projet & créer le projet Laravel
echo "Création du projet Laravel $project_name dans $project_destination"
composer create-project --prefer-dist laravel/laravel "$project_destination"/"$project_name"
cd "$project_destination/$project_name"

# Créer le projet Laravel (condition si cmd : avec --auth, avec jetsream, orchid, et 20 autres propositions, etc.)
#composer create-project --prefer-dist laravel/laravel "$project_name"
read -p "Voulez-vous ajouter le système d'authentification Laravel ? (y/n): " add_lara_auth
if [[ $add_lara_auth == "y" ]]; then
  composer require laravel/ui
  php artisan ui bootstrap --auth
fi

# Cpier le fichier .env.example en .env
cp ".env.example" ".env"
echo "Fichier .env.example copié en .env. Modifier les informations de connexion à la base de données pour continuer."
echo "N'oublier pas le APP_NAME,... Appuyez sur une touche pour continuer."
read -n 1 -s
nano .env

# Ajouter le nom du projet dans le fichier .env (APP_URL)
read -p "Entrez l'URL du projet (ex: monprojet.local): " project_url
sed -i "s/APP_URL=http:\/\/localhost/APP_URL=http:\/\/$project_url/g" "$project_destination/$project_name/.env"

# php artisan key:generate (demande d'acceptation avant)
read -p "Voulez-vous générer une clé token d'application ? (y/n): " key_generate
if [[ $key_generate == "y" ]]; then
    php artisan key:generate
fi

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

# php artisan storage:link (demande d'acceptation avant)
read -p "Voulez-vous créer le lien symbolique vers le dossier storage ? (y/n): " storage_link
if [[ $storage_link == "y" ]]; then
    php artisan storage:link
fi

# Création de virtual hosts
read -p "Voulez-vous créer un virtual host (http/https avec certbot) ? (y/n): " create_vhost
if [[ $create_vhost == "y" ]]; then
    read -p "Entrez le nom du domaine (ex: monprojet.local): " domain_name
    sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/$domain_name.conf
    sudo sed -i "s/ServerName localhost/ServerName $domain_name/g" /etc/apache2/sites-available/$domain_name.conf
    sudo a2ensite $domain_name.conf
    sudo systemctl restart apache2

    # Certbot pour HTTPS
    read -p "Voulez-vous configurer HTTPS avec certbot ? (y/n): " add_certbot
    if [[ $add_certbot == "y" ]]; then
        sudo certbot --apache -d $domain_name
    fi
fi

# php artisan serve (demande d'acceptation avant)
read -p "Voulez-vous lancer le serveur de développement de se projet ? (y/n): " serve
if [[ $serve == "y" ]]; then
    php artisan serve
fi
