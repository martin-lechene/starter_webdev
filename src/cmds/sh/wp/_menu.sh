# WordPress
        echo "Choisissez une commande :"
        echo "1. WordPress Complet"
        echo "2. WordPress Core"
        read -p "Choisissez une commande (1-2) : " wp_command_choice

        case $wp_command_choice in
            1)
                # Installation de WordPress Complet
                bash src/cmds/wp/install-full.sh
                ;;
            2)
                # Installation du core de WordPress
                bash src/cmds/wp/install-core.sh
                ;;
            *)
                echo "Option invalide. Choisissez une option de 1 à 2."
                ;;
        esac