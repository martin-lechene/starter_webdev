# FiveM Server Menu
        echo "Choisissez le type d'installation FiveM :"
        echo "0. Retour"
        echo "1. Installer un serveur FiveM"
        read -p "Choisissez une commande (1-x) : " command_choice

        case $command_choice in
             0)
                # Retour
                bash src/cmds/sh/app.sh
                ;;
            1)
                # Installation de FiveM
                echo "Installation de FiveM selectionné."
                echo "Chargement de l'installation de FiveM..."
                wait 2
                bash src/cmds/sh/fivem/install_fivem.sh
                ;;
            *)
                echo "Option invalide. Choisissez une option."
                ;;
        esac