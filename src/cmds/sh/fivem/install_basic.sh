# Install basic Fivem server
sudo apt-get update

#Demande si MySQL est installé si non installer
read -p "MySQL est-il installé ? (y/n) : " mysql_install
if [[ $mysql_install == "n" ]]; then
  sudo apt-get install mariadb-server
  echo "MySQL installé."
  echo "All steps are explained in detail and it is recommended to answer “Y” (yes) to all questions."
  wait 5
  sudo mysql_secure_installation
  wait 5
  echo "MySQL sécurisé."
  echo "Add the following lines to the end of the file and save it:"
  echo "CREATE USER 'user1'@localhost IDENTIFIED BY 'password1';
        (Check the user created by running this line) SELECT User FROM mysql.user;
        GRANT ALL PRIVILEGES ON *.* TO 'user1'@localhost IDENTIFIED BY 'password1';
        FLUSH PRIVILEGES;"
  mysql -u root -p
  echo "MySQL prêt. Mais il faut encore créer le remote access DB."
  wait 5
  echo "The file that has these settings can be found in /etc/mysql/mariadb.conf.d/50-server.cnf
        We open this file using the command sudo nano 50-server.cnf, which opens a command line text file editor."
  wait 5
  # Demande si le remote access DB doit être activé
  read -p "Voulez-vous activer le remote access DB ? (y/n): " remote_access_db
  if [[ $remote_access_db == "y" ]]; then
    sudo nano /etc/mysql/mariadb.conf.d/50-server.cnf
    sudo systemctl restart mariadb
    sudo systemctl status mariadb
    sudo iptables -A INPUT -p tcp --dport 3306 -j ACCEPT
  fi
fi

# Demande du nom du projet
read -p "Nom du projet : " PROJECT_NAME

# Demande du chemin du projet (par défaut: projects/)
read -p "Chemin du projet (par défaut: projects/) : " PROJECT_PATH
if [[ -z $PROJECT_PATH ]]; then
    PROJECT_PATH="projects"
fi

# Création du projet
mkdir $PROJECT_PATH/$PROJECT_NAME

# Se déplacer dans le projet
cd $PROJECT_PATH/$PROJECT_NAME

# Téléchargement de Fivem
# Demande si le serveur Fivem doit être installé
read -p "Voulez-vous installer un serveur Fivem ? (y/n): " install_fivem
if [[ $install_fivem == "y" ]]; then
  wget https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/6683-9729577be50de537692c3a19e86365a5e0f99a54/fx.tar.xz
fi

# Extraction de Fivem
tar -xf fx.tar.xz

# Suppression de l'archive
rm fx.tar.xz

# Demande si le server.cfg doit être customs
read -p "Voulez-vous un server.cfg customs à lancer ? (y/n): " server_cfg_customs
if [[ $server_cfg_customs == "y" ]]; then
  read -p "Entrez le nom du fichier customs : " server_name
  touch $server_name.cfg
else
  touch server.cfg
fi

read -p "Voulez-vous lancer le projet ? (y/n): " start_project
if [[ $start_project == "y" ]]; then
  # Lancement du serveur
  echo "Lancement du serveur..."
./run.sh +exec server.cfg
#  bash +exec server.cfg
else
  echo "Le serveur n'a pas été lancé."
  echo "Pour lancer le serveur, exécutez la commande suivante dans votre projet :"
  echo "./run.sh +exec server.cfg"
  echo "ou"
  echo "bash +exec server.cfg"
fi
