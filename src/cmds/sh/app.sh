#!/bin/bash

# Afficher le message de sélection de la technologie
echo "Sélectionnez une technologie :"
echo "1. WordPress"
echo "2. PHP Native / WebApp"
echo "3. Laravel"
echo "4. Discord Bot"
echo "5. Symfony"
echo "6. Docker"
echo "7. HTML"
echo "8. NodeJS"
echo "9. Python"    
echo "10. Java"
echo "11. C / C++ / C#"
echo "12. Crédits"
echo "13. Quitter"

# Lire l'entrée de l'utilisateur pour choisir la technologie
read -p "Choisissez une technologie (1-13) : " tech_choice

# Sélectionner la commande spécifique en fonction de la technologie choisie
case $tech_choice in
    1)
        bash src/cmds/sh/wp/_menu.sh
        ;;
    2) 
        bash src/cmds/sh/php/_menu.sh
        ;;
    3)
        bash src/cmds/sh/laravel/_menu.sh
        ;;
    4)
       bash src/cmds/sh/discordjs/_menu.sh
        ;;
    5)
        bash src/cmds/sh/symfony/_menu.sh
        ;;
    6)
        bash src/cmds/sh/docker/_menu.sh
        ;;
    7)
        bash src/cmds/sh/html/_menu.sh
        ;;
    8)
        bash src/cmds/sh/nodejs/_menu.sh
        ;;
    9)
        bash src/cmds/sh/python/_menu.sh
        ;;
    10)
        bash src/cmds/sh/java/_menu.sh
        ;;
    11)
        bash src/cmds/sh/c/_menu.sh
        ;;
    12)
        bash src/cmds/sh/credits.sh
        ;;
    13)
        # Quitter
        echo "Au revoir !"
        exit
        ;;
       # Ajoutez des cas pour d'autres technologies
    *)
        echo "Option invalide. Choisissez une option de 1 à 13."
        ;;
esac
