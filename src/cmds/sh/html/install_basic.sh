#!/bin/bash

# Demander le nom du dossier
read -p "Entrez le nom du dossier : " folder_name

# Créer le dossier
mkdir "$folder_name"

# Aller dans le dossier créé
cd "$folder_name"

# Créer package.json
echo '{
  "name": "'$folder_name'",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "keywords": [],
  "author": "",
  "license": "ISC"
}' > package.json

# Créer le dossier src et ses sous-dossiers
mkdir -p src/css src/scss src/js

# Créer les fichiers css/main.css, scss/main.scss et js/app.js
touch src/css/main.css src/scss/main.scss src/js/app.js

# Créer index.html avec la base HTML5
echo '<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>'$folder_name'</title>
  <link rel="stylesheet" href="src/css/main.css">
</head>
<body>
  <script src="src/js/app.js"></script>
</body>
</html>' > index.html

echo "Installation terminée dans le dossier $folder_name."
