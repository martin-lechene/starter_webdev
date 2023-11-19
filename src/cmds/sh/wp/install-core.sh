#!/bin/bash

# Vérifier si l'utilisateur a les droits d'administrateur
if [ "$(id -u)" != "0" ]; then
    echo "Ce script doit être exécuté en tant qu'administrateur (root)." 1>&2
    exit 1
fi

## Formulaire d'installation de WordPress
echo "Bienvenue dans le script d'installation de WordPress Minimal"
echo "-------------------------------------------------------------"

# Demander le nom du projet
read -p "Nom du projet : " project_name
project_name=${project_name:-wordpress}  # Utiliser wordpress par défaut si aucune réponse n'est fournie

# Créer le répertoire du projet
project_dir="$PWD/$project_name"  # Utiliser le chemin complet pour éviter des problèmes plus tard
mkdir "$project_dir"
cd "$project_dir" || exit 1  # Assurez-vous de changer de répertoire avec succès

# Installer WordPress de base
wordpress_download_dir="$project_dir/src/"
wget https://wordpress.org/latest.tar.gz -P "$wordpress_download_dir"
tar -xzvf "$wordpress_download_dir/latest.tar.gz" -C "$wordpress_download_dir"

# Configuration de la base de données
read -p "Nom de la base de données : " db_name
db_name=${db_name:-wordpress}  # Utiliser wordpress par défaut si aucune réponse n'est fournie

read -p "Nom d'utilisateur de la base de données : " db_user
db_user=${db_user:-root}  # Utiliser root par défaut si aucune réponse n'est fournie

read -s -p "Mot de passe de la base de données : " db_password  # Utiliser -s pour masquer le mot de passe
db_password=${db_password:-root}  # Utiliser root par défaut si aucune réponse n'est fournie

read -p "Hôte de la base de données : " db_host
db_host=${db_host:-localhost}  # Utiliser localhost par défaut si aucune réponse n'est fournie

# Définir les paramètres de la base de données dans le fichier wp-config.php
wp_config_file="$wordpress_download_dir/wordpress/wp-config.php"  # Utiliser le chemin complet du fichier
sed -i "s/database_name_here/$db_name/g" "$wp_config_file"
sed -i "s/username_here/$db_user/g" "$wp_config_file"
sed -i "s/password_here/$db_password/g" "$wp_config_file"
sed -i "s/localhost/$db_host/g" "$wp_config_file"

echo "---------------------------------------------"

# Afficher le message d'installation réussie
echo "WordPress Core a été installé avec succès. Accédez à votre site pour commencer."
