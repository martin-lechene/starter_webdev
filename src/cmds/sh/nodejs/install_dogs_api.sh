# Demander le nom du projet
 read -p "Entrez le nom de votre projet : " project_name

# Demander le chemin de destination du projet (par défaut: projects/)
  read -p "Entrez le chemin de destination du projet (par défaut: projects/): " project_destination
  if [[ -z $project_destination ]]; then
      project_destination="projects"
  fi

  # Créer le dossier du projet par version de Laravel
  mkdir $project_destination/$project_name
  # Accéder au dossier du projet
  cd $project_destination/$project_name

  #git
  git clone https://github.com/martin-lechene/dog-api-node.git .
  rm -rf .git
  git init
  git add .
  git commit -m "Initial commit"

  # Installer les dépendances
  npm install

  # Créer le fichier .env
  touch .env
  echo "SERVER_PORT=3000" >> .env
  echo "DB_HOST=localhost" >> .env
  echo "DB_USER=root" >> .env
  echo "DB_PASSWORD=" >> .env
  echo "DB_NAME=$project_name" >> .env
  echo "DB_PORT=3306" >> .env


