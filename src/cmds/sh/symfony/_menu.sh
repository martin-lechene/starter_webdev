   # Symfony
        echo "Choisissez une commande :"
        echo "1. Installer Symfony"
        echo "2. Autre commande Symfony"
        read -p "Choisissez une commande (1-2) : " symfony_command_choice

        case $symfony_command_choice in
            1)
                # Installer Symfony
                bash src/cmds/symfony/install-symfony.sh
                ;;
            2)
                # Autre commande Symfony
                bash src/cmds/symfony/autre-commande.sh
                ;;
            *)
                echo "Option invalide. Choisissez une option de 1 à 2."
                ;;
        esac