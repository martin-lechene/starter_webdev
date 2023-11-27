#!/bin/bash

# [test]
echo "Choisissez une commande :"
echo "1. Basic / Hello World"
read -p "Choisissez une commande () : test_command_choice"

case $test_command_choice in
    1)
        # Installer test basic
        bash src/cmds/test/install_basic.sh
        ;;
    2)
        # Return
        bash src/cmds/test/_return.sh
        ;;
    *)
        echo "Option invalide. Choisissez une option."
        ;;
esac
