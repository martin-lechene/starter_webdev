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
    touch "_return.sh"
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
    touch "_return.bat"
    touch "install_basic.bat"
    cd ../..
elif [[ $project_type == "customs" ]]; then
    # Créer les fichiers _menu.sh, _return.sh et install_basic.sh
    cd "customs"
    # Créer le dossier du projet
    mkdir "$project_name"
    # Se placer dans le dossier du projet
    cd "$project_name"
    touch "_menu.sh"
    touch "_return.sh"
    touch "install_basic.sh"
    cd ../..
else
    echo "Le type de projet n'est pas valide."
    exit
fi



# Éditer le contenu du fichier _menu.sh
cat <<EOL >_menu.sh
#!/bin/bash

# [$project_name]
echo "Choisissez une commande :"
echo "1. Basic / Hello World"
read -p "Choisissez une commande () : ${project_name}_command_choice"

case \$${project_name}_command_choice in
    1)
        # Installer $project_name basic
        bash src/cmds/$project_name/install_basic.sh
        ;;
    2)
        # Return
        bash src/cmds/$project_name/_return.sh
        ;;
    *)
        echo "Option invalide. Choisissez une option."
        ;;
esac
EOL

echo "Le script a été créé avec succès dans le dossier $project_name."
echo "Vous pouvez maintenant l'éditer pour ajouter des commandes."
echo "Pour lancer le script spécifiquement, exécutez la commande suivante :"
echo "bash src/cmds/$project_name/_menu.sh"
echo "------------------------------------------------------"
echo "Have nice dev !"

