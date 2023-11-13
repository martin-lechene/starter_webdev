# WordPress
        echo "Choisissez une commande :"
        echo "1. Installer WordPress de base"
        echo "2. Starter Dev WordPress : Thème + Plugins"
        echo "3. Starter Dev WordPress : Thème"
        echo "4. Starter Dev WordPress : Plugins"
        echo "5. Autre commande WordPress"
        read -p "Choisissez une commande (1-5) : " wp_command_choice

        case $wp_command_choice in
            1)
                # Installer WordPress de base
                bash src/cmds/wp/install-basic.sh
                ;;
            2)
                # Starter Dev WordPress : Thème + Plugins
                bash src/cmds/wp/starter-dev-wp-theme-plugins.sh
                ;;
            3)
                # Starter Dev WordPress : Thème
                bash src/cmds/wp/starter-dev-wp-theme.sh
                ;;  
            4)
                # Starter Dev WordPress : Plugins
                bash src/cmds/wp/starter-dev-wp-plugins.sh
                ;;  
            5)
                # Autre commande WordPress
                bash src/cmds/wp/autre-commande.sh
                ;;
            *)
                echo "Option invalide. Choisissez une option de 1 à 2."
                ;;
        esac