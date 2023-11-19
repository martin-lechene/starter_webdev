     # C / C++ / C#
        echo "Choisissez une commande :"
        echo "1. Installer C / C++ / C#"
        echo "2. Autre commande C / C++ / C#"
        read -p "Choisissez une commande (1-2) : " c_command_choice

        case $c_command_choice in
            1)
                # Installer Générals
                bash src/cmds/c/install.sh
                ;;
            2)
                # Autre commande C / C++ / C#
                bash src/cmds/c/autre-commande.sh
                ;;
            *)
                echo "Option invalide. Choisissez une option de 1 à 2."
                ;;
        esac