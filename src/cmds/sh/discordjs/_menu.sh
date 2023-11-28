 # Discord Bot
        echo "Choisissez une commande :"
        echo "0. Retour"
        echo "1. Bot Basic"
        echo "2. Bot Music"
        read -p "Choisissez une commande : " discord_command_choice

        case $discord_command_choice in
            0)
                # Retour
                bash src/cmds/sh/app.sh
                ;;
            1)
                # Bot Basic
                echo "Installation du bot Discord Basic"
                bash src/cmds/sh/discordjs/install_basic.sh
                ;;
            2)
                # Bot Music
                echo "Installation du bot Discord Music"
                bash src/cmds/sh/discordjs/install_music.sh
                ;;

            *)
                echo "Option invalide. Choisissez une option de 1 à 2."
                ;;
        esac