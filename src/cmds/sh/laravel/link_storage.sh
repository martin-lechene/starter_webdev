read -p "Voulez-vous créer le lien symbolique vers le dossier storage ? (y/n): " storage_link
if [[ $storage_link == "y" ]]; then
    php artisan storage:link
fi