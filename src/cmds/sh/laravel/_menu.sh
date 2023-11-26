  # Laravel
        echo "Choisissez une commande :"
        echo "1. Installer Laravel Basic"
        read -p "Choisissez une commande (1-3) : " laravel_command_choice

        case $laravel_command_choice in
            1)
                # Installer Laravel
                echo "Installation de Laravel Basic..."
                wait 3
                bash src/cmds/sh/laravel/install_basic.sh
                echo "Installation de Laravel Basic terminée !"
                ;;
            *)
                echo "Option invalide. Choisissez une option de 1 à 3."
                ;;
        esac