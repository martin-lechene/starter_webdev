 echo "Choisissez une commande :"
        echo "1. Installer Java"
        echo "2. Autre commande Java"
        read -p "Choisissez une commande (1-2) : " java_command_choice

        case $java_command_choice in
            1)
                # Installer Java
                bash src/cmds/java/install-java.sh
                ;;
            2)
                # Autre commande Java
                bash src/cmds/java/autre-commande.sh
                ;;
            *)
                echo "Option invalide. Choisissez une option de 1 à 2."
                ;;
        esac