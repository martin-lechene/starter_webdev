  # NodeJS
        echo "Choisissez une commande :"
        echo "1. Installer NodeJS"
        echo "2. Installer dogs-api"
        read -p "Choisissez une commande : " nodejs_command_choice

        case $nodejs_command_choice in
            1)
                # Installer NodeJS
                bash src/cmds/sh/nodejs/install_nodejs.sh
                ;;
            2)
                # dogs-api
                bash src/cmds/sh/nodejs/dogs_api.sh
                ;;
            *)
                echo "Option invalide."
                ;;
        esac