  # NodeJS
        echo "Choisissez une commande :"
        echo "0. Retour"
        echo "1. Installer NodeJS"
        echo "2. Installer dogs-api (martin-lechene)"
        read -p "Choisissez une commande : " nodejs_command_choice

        case $nodejs_command_choice in
            0)
                # Retour
                bash src/cmds/sh/app.sh
                ;;
            1)
                # Installer NodeJS
                bash src/cmds/sh/nodejs/install_nodejs.sh
                ;;
            2)
                # dogs-api
                bash src/cmds/sh/nodejs/install_dogs_api.sh
                ;;
            *)
                echo "Option invalide."
                ;;
        esac