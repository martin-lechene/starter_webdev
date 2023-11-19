# Python
        echo "Choisissez une commande :"
        echo "1. Installer projet Basic"
        echo "2. Installer projet Django"
        echo "3. Installer projet Flask"
        echo "4. Installer projet FastAPI"
        echo "5. Installer projet Pygame"
        echo "6. Installer projet crawler"
        read -p "Choisissez une commande (1-6) : " python_command_choice

        case $python_command_choice in
            1)
                # Installer Python
                bash src/cmds/python/install_basic.sh
                ;;
            2)
                # Installer Django
                bash src/cmds/python/install_django.sh
                ;;
            3)
                # Installer Flask
                bash src/cmds/python/install_flask.sh
                ;;

            4)
                # Installer FastAPI
                bash src/cmds/python/install_fastapi.sh
                ;;

            5)
                # Installer Pygame
                bash src/cmds/python/install_pygame.sh
                ;;
            *)
                echo "Option invalide. Choisissez une option de 1 à 6."
                ;;
        esac