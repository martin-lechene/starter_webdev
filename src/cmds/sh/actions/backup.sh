# Create a backup zip file of the current directory or a specified directory (projects or customs)
read "Voulez-vous créer une sauvegarde de votre projet ? (y/n): " backup
if [[ $backup == "y" ]]; then
    read -p "Entrez le nom de votre projet : " project_name
    read -p "Entrez le chemin de destination du projet (par défaut: projects/): " project_destination
    if [[ -z $project_destination ]]; then
        project_destination="projects"
    fi
    read -p "Entrez le chemin de destination de la sauvegarde (par défaut: backups/): " backup_destination
    if [[ -z $backup_destination ]]; then
        backup_destination="backups"
    fi
    echo "Sauvegarde en cours..."
    zip -r $backup_destination/$project_name.zip $project_destination/$project_name
    echo "Sauvegarde terminée."
else
  echo "Sauvegarde annulée."
fi