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

  # Téléchargement
  # Demande le choix du template à lancer pour le bot classique :
  echo "Choisissez un template :"
  echo "1. DiscordJS"
  echo "2. Flashbot (Nico-du-34)"
  read -p "Choisissez un template : " discord_template_choice

  if [[ $discord_template_choice == 1 ]]; then
    # Téléchargement du template DiscordJS
    git clone https://github.com/discordjs/discord.js.git .
    npm install
    
elif [[ $discord_template_choice == 1 ]]; then
    # Téléchargement du template Flashbot
    git clone https://github.com/Nico-du-34/flashbot.git .
    npm install
  else
    echo "Option invalide. Choisissez une option de 1 à 2."
  fi
    

