    # Web App, PHP, SearchPHP, Mastodon, ..
        echo "Choisissez une commande :"
        echo "0. Retour"
        echo "1. Installer une base PHP"
        echo "2. Installer PHP Basic project"
        echo "3. Installer SearchPHP"
        echo "4. Installer Mastodon"
        echo "5. Installer Brionmario/php-starter"
        read -p "Choisissez une commande (1-5) : " php_command_choice

        case $php_command_choice in
            0)
                # Retour
                bash src/cmds/sh/app.sh
                ;;
            1)
                # Installer PHP de base
                bash src/cmds/php/install_base.sh
                ;;
            2)
                # Installer PHP Basic project
                bash src/cmds/php/install_basic.sh
                ;;
            3)
                # Installer SearchPHP
                bash src/cmds/php/install_phpsearch.sh
                ;;
            4)
                # Installer Mastodon
                bash src/cmds/php/install_mastodon.sh
                ;;
            5)
                # Installer Brionmario/php-starter
                bash src/cmds/php/install_brionmario.sh
                ;;

            *)
                echo "Option invalide. Choisissez une option de 1 à 5."
                ;;
        esac