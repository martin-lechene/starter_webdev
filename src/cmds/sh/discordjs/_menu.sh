 # Discord Bot
        echo "Choisissez une commande :"
        echo "1. Installer Discord Bot Basic"
        echo "2. Command Creator"
        echo "3. Auto send message basic"
        echo "4. Auto send message with embed"
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