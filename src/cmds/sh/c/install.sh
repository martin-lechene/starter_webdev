#!/bin/bash

# Script d'installation et de configuration d'un projet C/C++

echo "Bienvenue dans le script d'installation de projet C/C++"
echo "------------------------------------------------------"

# Demander le nom du projet
read -p "Nom du projet : " project_name

# Demander si vous voulez utiliser C ou C++
read -p "Utiliser C ou C++ ? [C/C++] : " language
language=${language:-C}  # Utiliser C par défaut si aucune réponse n'est fournie

# Demander si vous souhaitez installer des outils de compilation (gcc/g++)
read -p "Installer les outils de compilation (gcc/g++) ? [y/N] : " install_compiler
install_compiler=${install_compiler:-N}  # Ne pas installer par défaut

# Demander si vous souhaitez installer un gestionnaire de version pour C/C++ (ex: CMake)
read -p "Installer un gestionnaire de version (ex: CMake) ? [y/N] : " install_build_system
install_build_system=${install_build_system:-N}  # Ne pas installer par défaut

# Demander si vous souhaitez créer un fichier de configuration (ex: CMakeLists.txt)
read -p "Créer un fichier de configuration (ex: CMakeLists.txt) ? [y/N] : " create_config_file
create_config_file=${create_config_file:-N}  # Ne pas créer par défaut

# Créer le répertoire du projet
mkdir $project_name
cd $project_name

# Initialiser le projet avec un fichier source
echo -e "#include <stdio.h>\n\nint main() {\n    printf(\"Hello, $language World!\\n\");\n    return 0;\n}" > main.c

# Installer les outils de compilation si demandé
if [ "$install_compiler" == "y" ]; then
    sudo apt-get install build-essential
fi

# Installer le gestionnaire de version si demandé
if [ "$install_build_system" == "y" ]; then
    sudo apt-get install cmake  # Changez cela en fonction de votre gestionnaire de version préféré
fi

# Créer le fichier de configuration si demandé
if [ "$create_config_file" == "y" ]; then
    echo "Projet de configuration généré." > CMakeLists.txt  # Modifiez cela en fonction de votre fichier de configuration préféré
fi

echo "---------------------------------------------"
echo "Installation et configuration terminées avec succès pour le projet $project_name en $language."
echo "Vous pouvez maintenant commencer à travailler dans le répertoire $project_name."
