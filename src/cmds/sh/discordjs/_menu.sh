 # Discord Bot
        echo "Choisissez une commande :"
        echo "1. Installer Discord Bot"
        echo "2. Autre commande Discord Bot"
        read -p "Choisissez une commande (1-2) : " discord_command_choice

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