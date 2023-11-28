# WordPress
        echo "Choisissez le type d'installation WordPress :"
        echo "0. Retour"
        echo "1. WP Complet"
        echo "2. WP Core"
        echo "3. WP + React Startkit (postlight)"
        read -p "Choisissez une commande : " wp_command_choice

        case $wp_command_choice in
            0)
                  # Retour
                  bash src/cmds/sh/app.sh
                  ;;
            1)
                # Installation de WordPress Complet
                echo "Installation de WordPress Complet selectionné."
                wait 2
                echo "Chargement de l'installation de WordPress Complet..."
                wait 2
                bash src/cmds/wp/install-full.sh
                ;;
            2)
                # Installation du core de WordPress
                echo "Installation du core de WordPress selectionné."
                wait 2
                echo "Chargement de l'installation du core de WordPress..."
                wait 2
                bash src/cmds/wp/install-core.sh
                ;;
            3)
                # Installation de WordPress + React Startkit (postlight)
                echo "Installation de WordPress + React Startkit (postlight) selectionné."
                wait 2
                echo "Chargement de l'installation de WordPress + React Startkit (postlight)..."
                wait 2
                bash src/cmds/wp/install-react.sh
                ;;
            *)
                echo "Option invalide. Choisissez une option."
                ;;
        esac