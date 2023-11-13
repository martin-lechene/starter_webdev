    # Web App, PHP, SearchPHP, Mastodon, ..
        echo "Choisissez une commande :"
        echo "1. Installer PHP de base"
        echo "2. Installer Composer"
        echo "3. Installer SearchPHP"
        echo "4. Installer Mastodon"
        echo "5. Autre commande PHP"
        read -p "Choisissez une commande (1-5) : " php_command_choice

        case $php_command_choice in
            1)
                # Installer PHP de base
                bash src/cmds/php/install-basic.sh
                ;;
            2)
                # Installer Composer
                bash src/cmds/php/install-composer.sh
                ;;
            3)
                # Installer SearchPHP
                bash src/cmds/php/install-searchphp.sh
                ;;
            4)
                # Installer Mastodon
                bash src/cmds/php/install-mastodon.sh
                ;;
            5)
                # Autre commande PHP
                bash src/cmds/php/autre-commande.sh
                ;;
            *)
                echo "Option invalide. Choisissez une option de 1 à 5."
                ;;
        esac