 # HTML
        echo "Choisissez une commande :"
        echo "1. Installer HTML de base"
        echo "2. Autre commande HTML"
        read -p "Choisissez une commande (1-2) : " html_command_choice

        case $html_command_choice in
            1)
                # Installer HTML de base
                bash src/cmds/html/install-basic.sh
                ;;
            2)
                # Autre commande HTML
                bash src/cmds/html/autre-commande.sh
                ;;
            *)
                echo "Option invalide. Choisissez une option de 1 à 2."
                ;;
        esac