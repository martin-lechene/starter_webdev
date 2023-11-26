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

# Générer la clé token d'application
bash src/cmds/sh/laravel/key_generate.sh

# Liste des packages Laravel (selectionner plusieur package à la fois)
bash src/cmds/sh/laravel/package_list.sh

# Installer les packages Laravel
npm install
# Compiler les assets
npm run build

# Faire les migrations
bash src/cmds/sh/laravel/migrations.sh
# Faire les seeders
bash src/cmds/sh/laravel/seeders.sh

# Créer le lien symbolique vers le dossier storage
bash src/cmds/sh/laravel/link_storage.sh
# Créer le virtual host
bash src/cmds/sh/actions/create_virtual_hosts.sh
# Lancer le serveur
bash src/cmds/sh/laravel/start.sh

