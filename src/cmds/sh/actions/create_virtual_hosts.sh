
# Création de virtual hosts
read -p "Entrez le nom du domaine (ex: monprojet.local): " domain_name
sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/$domain_name.conf
sudo sed -i "s/ServerName localhost/ServerName $domain_name/g" /etc/apache2/sites-available/$domain_name.conf
sudo a2ensite $domain_name.conf
sudo systemctl restart apache2



# Certbot pour HTTPS
read -p "Voulez-vous configurer HTTPS avec certbot ? (y/n): " add_certbot
if [[ $add_certbot == "y" ]]; then
    sudo certbot --apache -d $domain_name
fi
