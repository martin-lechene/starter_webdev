   # Symfony
        echo "Choisissez une commande :"
        echo "0. Retour"
        echo "1. Installer Symfony"
        echo "2. Installer Symfony SaaS"
        echo "3. Installer Symfony Flex"
        read -p "Choisissez une commande : " symfony_command_choice

        case $symfony_command_choice in
            0)
                # Retour
                bash src/cmds/sh/app.sh
                ;;
            1)
                # Installer Symfony
                bash src/cmds/symfony/install_symfony.sh
                ;;
            2)
                # Installer Symfony SaaS
                bash src/cmds/symfony/install_saas.sh
                ;;
            3)
                # Installer Symfony Flex
                bash src/cmds/symfony/install_flex.sh
                ;;
            *)
                echo "Option invalide. Choisissez une option."
                ;;
        esac