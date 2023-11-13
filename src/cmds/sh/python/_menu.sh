# Python
        echo "Choisissez une commande :"
        echo "1. Installer Python"
        echo "2. Autre commande Python"
        read -p "Choisissez une commande (1-2) : " python_command_choice

        case $python_command_choice in
            1)
                # Installer Python
                bash src/cmds/python/install-python.sh
                ;;
            2)
                # Autre commande Python
                bash src/cmds/python/autre-commande.sh
                ;;
            *)
                echo "Option invalide. Choisissez une option de 1 à 2."
                ;;
        esac