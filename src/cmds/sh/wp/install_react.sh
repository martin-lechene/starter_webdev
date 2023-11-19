# // Install by github https://github.com/postlight/headless-wp-starter

# Demande du nom du projet
read -p "Nom du projet : " PROJECT_NAME

# Demande du chemin du projet
read -p "Chemin du projet : " PROJECT_PATH

# Création du projet
mkdir $PROJECT_PATH

# Se déplacer dans le projet
cd $PROJECT_PATH

# Téléchargement https://github.com/postlight/headless-wp-starter
git clone https://github.com/postlight/headless-wp-starter.git .

# Suppression du dossier .git
rm -rf .git