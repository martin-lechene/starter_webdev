
echo "Création du projet Laravel $project_name dans $project_destination"
composer create-project --prefer-dist laravel/laravel "$project_destination"/"$project_name"
cd "$project_destination/$project_name"
if [[ $version == "5" ]]; then
    composer create-project --prefer-dist laravel/laravel "$project_destination"/"$project_name" "5.*"
    php_version=$(php -v | head -n 1 | cut -d " " -f 2 | cut -c 1-3)
    if [[ $php_version != "7.3" ]]; then
        # change version for php 7.3 in php.ini
        sudo sed -i "s/7.4/7.3/g" /etc/apache2/sites-available/"$project_name".conf
    fi
elif [[ $version == "6" ]]; then
    composer create-project --prefer-dist laravel/laravel "$project_destination"/"$project_name" "6.*"
elif [[ $version == "7" ]]; then
    composer create-project --prefer-dist laravel/laravel "$project_destination"/"$project_name" "7.*"
elif [[ $version == "8" ]]; then
    composer create-project --prefer-dist laravel/laravel "$project_destination"/"$project_name" "8.*"
elif [[ $version == "9" ]]; then
    composer create-project --prefer-dist laravel/laravel "$project_destination"/"$project_name" "9.*"
elif [[ $version == "10" ]]; then
    composer create-project --prefer-dist laravel/laravel "$project_destination"/"$project_name" "10.*"
else
    composer create-project --prefer-dist laravel/laravel "$project_destination"/"$project_name"
fi