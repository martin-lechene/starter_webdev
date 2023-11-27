# Créer les fichiers _menu.sh, _return.sh et install_basic.sh
read -p "Entrez le nom du projet : " project_name
echo "------------------------------------------------------"
# Créer les fichiers _menu.sh/.bat, _return.sh et install_basic.sh/.bat
echo "Création des fichiers _menu.sh, _return.sh et install_basic.sh"
echo "------------------------------------------------------"
echo "Choisissez le type de projet :"
echo "1. sh"
echo "2. bat"
echo "3. customs"
read -p "Entrez le nom du projet : " project_type

cd "src/cmds"
if [[ $project_type == "sh" ]]; then
    # Créer les fichiers _menu.sh, _return.sh et install_basic.sh
    cd "sh"
    # Créer le dossier du projet
    mkdir "$project_name"
    # Se placer dans le dossier du projet
    cd "$project_name"
    touch "_menu.sh"
    touch "install_basic.sh"
    cd ../..
elif [[ $project_type == "bat" ]]; then
    # Créer les fichiers _menu.bat, _return.bat et install_basic.bat
    cd "bat"
    # Créer le dossier du projet
    mkdir "$project_name"
    # Se placer dans le dossier du projet
    cd "$project_name"
    touch "_menu.bat"
    touch "install_basic.bat"
    cd ../..
elif [[ $project_type == "customs" ]]; then
    # Créer les fichiers _menu.sh, _return.sh et install_basic.sh
    read -p "Entrez le nom du dossier customs (sh, bat, ..) : " customs_name
    cd "customs"
    # Créer le dossier du projet
    mkdir "$project_name"
    # Se placer dans le dossier du projet
    cd "$project_name"
    touch "_menu.$customs_name"
    touch "install_basic.$customs_name"
    cd ../..
else
    echo "Le type de projet n'est pas valide."
    exit
fi

echo "Le script a été créé avec succès dans le dossier $project_name."
echo "Vous pouvez maintenant l'éditer pour ajouter des commandes."
echo "Pour lancer le script spécifiquement, exécutez la commande suivante :"
echo "bash src/cmds/$project_name/_menu.sh"
echo "------------------------------------------------------"
echo "Have nice dev !"

