 # Docker
        echo "Choisissez une commande :"
        echo "1. Installer Docker"
        echo "2. Autre commande Docker"
        read -p "Choisissez une commande (1-2) : " docker_command_choice

        case $docker_command_choice in
            1)
                # Installer Docker
                bash src/cmds/docker/install-docker.sh
                ;;
            2)
                # Autre commande Docker
                bash src/cmds/docker/autre-commande.sh
                ;;
            *)
                echo "Option invalide. Choisissez une option de 1 à 2."
                ;;
        esac