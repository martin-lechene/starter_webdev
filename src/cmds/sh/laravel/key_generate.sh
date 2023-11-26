read -p "Voulez-vous générer une clé token d'application ? (y/n): " key_generate
if [[ $key_generate == "y" ]]; then
    php artisan key:generate
fi