#!/bin/bash

# Vérifier si l'utilisateur a les droits d'administrateur
if [ "$(id -u)" != "0" ]; then
    echo "Ce script doit être exécuté en tant qu'administrateur (root)." 1>&2
    exit 1
fi

## Formulaire d'installation de WordPress
echo "Bienvenue dans le script d'installation de WordPress"
echo "------------------------------------------------------"

# Demander le nom du projet
read -p "Nom du projet : " project_name
project_name=${project_name:-wordpress}  # Utiliser wordpress par défaut si aucune réponse n'est fournie

# Demander si vous souhaitez installer un thème
read -p "Installer un thème ? [y/N] : " install_theme
install_theme=${install_theme:-N}  # Ne pas installer par défaut

# Demander si vous souhaitez installer des plugins
read -p "Installer des plugins ? [y/N] : " install_plugins
install_plugins=${install_plugins:-N}  # Ne pas installer par défaut

# Créer le répertoire du projet
project_dir="$PWD/$project_name"  # Utiliser le chemin complet pour éviter des problèmes plus tard
mkdir "$project_dir"
cd "$project_dir" || exit 1  # Assurez-vous de changer de répertoire avec succès

# Installer WordPress de base
bash src/cmds/wp/install-core.sh

# Installer le thème si demandé
if [ "$install_theme" == "y" ]; then
    bash src/cmds/wp/install-theme.sh
fi

# Installer les plugins si demandé
if [ "$install_plugins" == "y" ]; then
    bash src/cmds/wp/install-plugins.sh
fi

echo "---------------------------------------------"

## Configuration de la base de données et du site WordPress
# Demander le nom de la base de données
read -p "Nom de la base de données : " db_name
db_name=${db_name:-wordpress}  # Utiliser wordpress par défaut si aucune réponse n'est fournie

# Demander le nom d'utilisateur de la base de données
read -p "Nom d'utilisateur de la base de données : " db_user
db_user=${db_user:-root}  # Utiliser root par défaut si aucune réponse n'est fournie

# Demander le mot de passe de la base de données
read -s -p "Mot de passe de la base de données : " db_password  # Utiliser -s pour masquer le mot de passe
db_password=${db_password:-root}  # Utiliser root par défaut si aucune réponse n'est fournie

# Demander l'hôte de la base de données
read -p "Hôte de la base de données : " db_host
db_host=${db_host:-localhost}  # Utiliser localhost par défaut si aucune réponse n'est fournie

# Demander l'URL du site WordPress
read -p "URL du site WordPress : " wp_url
wp_url=${wp_url:-http://localhost}  # Utiliser localhost par défaut si aucune réponse n'est fournie

# Définir les paramètres de la base de données dans le fichier wp-config.php
wp_config_file="$project_dir/src/cmds/wp/wp-config.php"  # Utiliser le chemin complet du fichier
sed -i "s/database_name_here/$db_name/g" "$wp_config_file"
sed -i "s/username_here/$db_user/g" "$wp_config_file"
sed -i "s/password_here/$db_password/g" "$wp_config_file"
sed -i "s/localhost/$db_host/g" "$wp_config_file"

# Définir l'URL du site WordPress dans le fichier wp-config.php
echo "define('WP_HOME', '$wp_url');" >> "$wp_config_file"
echo "define('WP_SITEURL', '$wp_url');" >> "$wp_config_file"

# Afficher le message d'installation réussie
echo "WordPress a été installé avec succès. Accédez à $wp_url pour commencer."

## Téléchargement et configuration de WordPress
# Définir les variables
DB_USER=$db_user
DB_PASSWORD=$db_password
DB_NAME=$db_name
DB_HOST=$db_host
WP_URL=$wp_url

# Télécharger et extraire WordPress
wordpress_download_dir="$project_dir/src/cmds/wp/"
wget https://wordpress.org/latest.tar.gz -P "$wordpress_download_dir"
tar -xzvf "$wordpress_download_dir/latest.tar.gz" -C "$wordpress_download_dir"

# Créer la base de données MySQL
mysql -u"$DB_USER" -p"$DB_PASSWORD" -e "CREATE DATABASE $DB_NAME;"
mysql -u"$DB_USER" -p"$DB_PASSWORD" -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'$DB_HOST' IDENTIFIED BY '$DB_PASSWORD';"
mysql -u"$DB_USER" -p"$DB_PASSWORD" -e "FLUSH PRIVILEGES;"

# Copier le fichier de configuration WordPress
cp "$wordpress_download_dir/wp-config-sample.php" "$wordpress_download_dir/wp-config.php"

# Configurer les paramètres de la base de données dans le fichier wp-config.php
sed -i "s/database_name_here/$DB_NAME/g" "$wordpress_download_dir/wp-config.php"
sed -i "s/username_here/$DB_USER/g" "$wordpress_download_dir/wp-config.php"
sed -i "s/password_here/$DB_PASSWORD/g" "$wordpress_download_dir/wp-config.php"
sed -i "s/localhost/$DB_HOST/g" "$wordpress_download_dir/wp-config.php"

# Définir les permissions appropriées
chown -R www-data:www-data "$wordpress_download_dir"
chmod -R 755 "$wordpress_download_dir"

# Afficher le message d'installation réussie
echo "WordPress a été installé avec succès. Accédez à $WP_URL pour commencer."
