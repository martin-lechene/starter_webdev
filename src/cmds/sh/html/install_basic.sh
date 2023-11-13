#!/bin/bash

# Demander le nom du dossier
read -p "Entrez le nom du dossier : " folder_name

# Créer le dossier
mkdir "$folder_name"

# Aller dans le dossier créé
cd "$folder_name"

# Initialiser un projet npm
npm init -y

# Installer les dépendances
npm install node-sass nodemon babel-cli babel-preset-env webpack webpack-cli


echo '{
  "name": "'$folder_name'",
  "version": "1.0.0",
  "description": "",
  "main": "src/js/app.js",
  "scripts": {
    "css": "node-sass --watch src/scss/main.scss src/css/main.css",
    "js-babel": "babel src/js/app.js -o src/js/app.min.js --watch --source-maps",
    "js-webpack": "webpack --watch",
    "css-js-babel": "npm run css & npm run js-babel",
    "css-js-webpack": "npm run css & npm run js-webpack",
    "watch": "nodemon --watch src/scss --watch src/js --ext scss --ext js --exec \"npm run css-js-babel\"",
    "start": "npm run css & npm run js-babel",
    "build": "node-sass src/scss/main.scss src/css/main.css && babel src/js/app.js -o src/js/app.min.js --source-maps"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "devDependencies": {
    "babel-cli": "^6.26.0",
    "babel-preset-env": "^1.7.0",
    "node-sass": "^4.14.1",
    "nodemon": "^2.0.7",
    "webpack": "^5.32.0",
    "webpack-cli": "^4.6.0"
  }
}' > package.json

# Créer le dossier src et ses sous-dossiers
mkdir -p src/css src/scss src/js

# Créer les fichiers css/main.css, scss/main.scss et js/app.js
touch src/css/main.css src/scss/main.scss src/js/app.js


# Créer le fichier .babelrc pour la configuration de Babel
echo '{
  "presets": ["env"]
}' > .babelrc


# Créer le fichier webpack.config.js pour la configuration de Webpack
echo 'const path = require("path");

module.exports = {
  entry: "./src/js/app.js",
  output: {
    filename: "app.min.js",
    path: path.resolve(__dirname, "src/js")
  }
};' > webpack.config.js


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

echo "Installation terminée dans le dossier $folder_name. N'oubliez pas d'exécuter 'npm install' pour installer les dépendances si cela n'a pas été fait."



