   # Symfony
        echo "Choisissez une commande :"
        echo "1. Installer Symfony"
        echo "2. Installer Symfony SaaS"
        echo "3. Installer Symfony Flex"
        read -p "Choisissez une commande (1-X) : " symfony_command_choice

        case $symfony_command_choice in
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