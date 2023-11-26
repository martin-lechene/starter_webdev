read -p "Voulez-vous exécuter les seeders ? (y/n): " seed
if [[ $seed == "y" ]]; then
    php artisan db:seed
fi