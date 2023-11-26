read -p "Voulez-vous lancer le serveur de développement de se projet ? (y/n): " serve
if [[ $serve == "y" ]]; then
    php artisan serve
fi
