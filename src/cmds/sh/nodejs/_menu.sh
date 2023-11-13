  # NodeJS
        echo "Choisissez une commande :"
        echo "1. Installer NodeJS"
        echo "2. Autre commande NodeJS"
        read -p "Choisissez une commande (1-2) : " nodejs_command_choice

        case $nodejs_command_choice in
            1)
                # Installer NodeJS
                bash src/cmds/nodejs/install-nodejs.sh
                ;;
            2)
                # Autre commande NodeJS
                bash src/cmds/nodejs/autre-commande.sh
                ;;
            *)
                echo "Option invalide. Choisissez une option de 1 à 2."
                ;;
        esac