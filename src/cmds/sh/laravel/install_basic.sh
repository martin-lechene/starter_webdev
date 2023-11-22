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

# Destination du projet
project_destination=$(get_input "Entrez la destination du projet (par défaut: /home/root/projects/)")
project_destination=${project_destination:-/home/root/projects/}

# Configuration du .env
echo "Configuration du fichier .env :"
db_host=$(get_input "Entrez l'hôte de la base de données")
db_database=$(get_input "Entrez le nom de la base de données")
db_username=$(get_input "Entrez le nom d'utilisateur de la base de données")
db_password=$(get_input "Entrez le mot de passe de la base de données")

# Créer le fichier .env
echo "DB_HOST=$db_host" > "$project_destination/$project_name/.env"
echo "DB_DATABASE=$db_database" >> "$project_destination/$project_name/.env"
echo "DB_USERNAME=$db_username" >> "$project_destination/$project_name/.env"
echo "DB_PASSWORD=$db_password" >> "$project_destination/$project_name/.env"

# Système d'authentification Laravel
read -p "Voulez-vous ajouter le système d'authentification Laravel ? (y/n): " add_auth
if [[ $add_auth == "y" ]]; then
    cd "$project_destination/$project_name"
    composer require laravel/ui
    php artisan ui bootstrap --auth
fi

# Liste des packages Laravel
packages=("spatie/laravel-permission" "barryvdh/laravel-debugbar")
selected_packages=()
echo "Packages disponibles :"
for package in "${packages[@]}"; do
    read -p "Installer $package ? (y/n): " install
    if [[ $install == "y" ]]; then
        selected_packages+=("$package")
    fi
done

# Installation de Jetstream ou équivalent
read -p "Voulez-vous ajouter Jetstream ou un équivalent populaire ? (y/n): " add_jetstream
if [[ $add_jetstream == "y" ]]; then
    cd "$project_destination/$project_name"
    composer require laravel/jetstream
    php artisan jetstream:install livewire
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

# Afficher la liste des packages sélectionnés
if [ ${#selected_packages[@]} -gt 0 ]; then
    echo "Packages sélectionnés :"
    for package in "${selected_packages[@]}"; do
        echo "- $package"
    done
else
    echo "Aucun package sélectionné."
fi

# Lancer la commande artisan serve ou ouvrir PHPStorm
options=("Lancer php artisan serve" "Ouvrir avec PHPStorm.exe" "Quitter")
choice=$(show_list "${options[@]}")

case $choice in
    "Lancer php artisan serve")
        cd "$project_destination/$project_name"
        php artisan serve
        ;;
    "Ouvrir avec PHPStorm.exe")
        # Remplacez 'phpstorm.exe' par le chemin réel de l'exécutable PHPStorm
        /path/to/phpstorm.exe "$project_destination/$project_name"
        ;;
    "Quitter")
        echo "Installation annulée."
        exit 0
        ;;
    *)
        echo "Option invalide. Quitter."
        exit 1
        ;;
esac
