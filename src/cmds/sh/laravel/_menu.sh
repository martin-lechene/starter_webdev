  # Laravel
        echo "Choisissez une commande :"
        echo "1. Installer Laravel"
        echo "2. Installer Laravel Valet"
        echo "3. Autre commande Laravel"
        read -p "Choisissez une commande (1-3) : " laravel_command_choice

        case $laravel_command_choice in
            1)
                # Installer Laravel
                bash src/cmds/laravel/install-laravel.sh
                ;;
            2)
                # Installer Laravel Valet
                bash src/cmds/laravel/install-laravel-valet.sh
                ;;
            3)
                # Autre commande Laravel
                bash src/cmds/laravel/autre-commande.sh
                ;;
            *)
                echo "Option invalide. Choisissez une option de 1 à 3."
                ;;
        esac