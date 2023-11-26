read -p "Voulez-vous exécuter les migrations ? (y/n): " migrate
if [[ $migrate == "y" ]]; then
    php artisan migrate
fi