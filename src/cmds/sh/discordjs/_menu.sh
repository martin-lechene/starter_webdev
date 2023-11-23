 # Discord Bot
        echo "Choisissez une commande :"
        echo "1. Bot Basic"
        echo "2. Command Creator"
        echo "3. Message Creator"
        echo "4. Auto send message"
        echo "5. Listening commande"
        read -p "Choisissez une commande : " discord_command_choice

        case $discord_command_choice in
            1)
                # Installer Discord Bot
                bash src/cmds/discord/install-discord-bot.sh
                ;;
            2)
                # Autre commande Discord Bot
                bash src/cmds/discord/autre-commande.sh
                ;;
            *)
                echo "Option invalide. Choisissez une option de 1 à 2."
                ;;
        esac