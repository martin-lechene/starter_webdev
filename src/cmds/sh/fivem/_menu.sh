# FiveM Server Menu
        echo "Choisissez le type d'installation FiveM :"
        echo "1. Installer un serveur FiveM"
        echo "2. Installer un serveur QBCore"
        echo "3. Installer un serveur ESX"
        echo "4. Installer un serveur VRP"
        read -p "Choisissez une commande (1-x) : " command_choice

        case $command_choice in
            1)
                # Installation de FiveM
                echo "Installation de FiveM selectionné."
                wait 2
                echo "Chargement de l'installation de FiveM..."
                wait 2
                bash src/cmds/sh/fivem/install_fivem.sh
                ;;
            2)
                # Installation de QBCore
                echo "Installation de QBCore selectionné."
                wait 2
                echo "Chargement de l'installation de QBCore..."
                wait 2
                bash src/cmds/sh/fivem/install_qbcore.sh
                ;;
            3)
                # Installation de ESX
                echo "Installation de ESX selectionné."
                wait 2
                echo "Chargement de l'installation de ESX..."
                wait 2
                bash src/cmds/sh/fivem/install_esx.sh
                ;;
            4)
                # Installation de VRP
                echo "Installation de VRP selectionné."
                wait 2
                echo "Chargement de l'installation de VRP..."
                wait 2
                bash src/cmds/sh/fivem/install_vrp.sh
                ;;
            *)
                echo "Option invalide. Choisissez une option."
                ;;
        esac