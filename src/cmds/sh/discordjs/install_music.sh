# Demande du nom du projet
 read -p "Nom du projet : " PROJECT_NAME

  # Demande du chemin du projet (par défaut : /var/www/$PROJECT_NAME ou dossier courant projects/$PROJECT_NAME)
  read -p "Chemin du projet (par défaut : dossier courant projects/$PROJECT_NAME) : " PROJECT_PATH
  if [[ $PROJECT_PATH == "" ]]; then
            PROJECT_PATH="projects/$PROJECT_NAME"
  fi

  # Création du projet
  mkdir $PROJECT_PATH

  # Se déplacer dans le projet
  cd $PROJECT_PATH

# Your code here