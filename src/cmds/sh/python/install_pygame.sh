#!/bin/bash

# install_pygame.sh

# Installer Pygame
pip install pygame

# Créer un fichier game.py pour un exemple de jeu Pygame simple
echo -e "import pygame\n\npygame.init()\n\n# Votre code de jeu ici\n\npygame.quit()" > game.py

# Afficher un message de fin
echo "Exemple de jeu Pygame a été créé dans le fichier 'game.py'."
