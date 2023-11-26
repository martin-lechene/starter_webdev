# Etes vous sur de vouloir installer les requirements ? (y/n)

read -p "Etes vous sur de vouloir installer les requirements ? (y/n) : " install_requirements
if [[ $install_requirements == "n" ]]; then
    echo "Annulation de l'installation des requirements"
    exit
fi

if ! [ -x "$(command -v composer)" ]; then
    echo "Composer is not installed"
    echo "Installing Composer..."
    sudo apt install composer
fi
if ! [ -x "$(command -v node)" ]; then
    echo "NodeJS is not installed"
    echo "Installing NodeJS..."
    sudo apt install nodejs
fi
if ! [ -x "$(command -v python)" ]; then
    echo "Python is not installed"
    echo "Installing Python..."
    sudo apt install python
fi
if ! [ -x "$(command -v java)" ]; then
    echo "Java is not installed"
    echo "Installing Java..."
    sudo apt install default-jre
fi
if ! [ -x "$(command -v gcc)" ]; then
    echo "GCC is not installed"
    echo "Installing GCC..."
    sudo apt install gcc
fi
if ! [ -x "$(command -v g++)" ]; then
    echo "G++ is not installed"
    echo "Installing G++..."
    sudo apt install g++
fi
if ! [ -x "$(command -v dotnet)" ]; then
    echo "Dotnet is not installed"
    echo "Installing Dotnet..."
    sudo apt install dotnet-sdk-3.1
fi
if ! [ -x "$(command -v docker)" ]; then
    echo "Docker is not installed"
    echo "Installing Docker..."
    sudo apt install docker
fi
if ! [ -x "$(command -v docker-compose)" ]; then
    echo "Docker-compose is not installed"
    echo "Installing Docker-compose..."
    sudo apt install docker-compose
fi
if ! [ -x "$(command -v php)" ]; then
    echo "PHP is not installed"
    echo "Installing PHP..."
    read -p "Choisissez la version de PHP à installer : " php_version
    sudo apt install php$php_version
fi
# if symfony is not installed
if ! [ -x "$(command -v symfony)" ]; then
    echo "Symfony is not installed"
    echo "Installing Symfony..."
    sudo wget https://get.symfony.com/cli/installer -O - | bash
    sudo mv /home/$USER/.symfony/bin/symfony /usr/local/bin/symfony
fi
# if laravel is not installed
if ! [ -x "$(command -v laravel)" ]; then
    echo "Laravel is not installed"
    echo "Installing Laravel..."
    composer global require laravel/installer
fi
# if discordjs is not installed
if ! [ -x "$(command -v discord.js)" ]; then
    echo "DiscordJS is not installed"
    echo "Installing DiscordJS..."
    npm install discord.js
fi
# if express is not installed
if ! [ -x "$(command -v express)" ]; then
    echo "Express is not installed"
    echo "Installing Express..."
    npm install express
fi
# if nodemon is not installed
if ! [ -x "$(command -v nodemon)" ]; then
    echo "Nodemon is not installed"
    echo "Installing Nodemon..."
    npm install nodemon
fi
# if fastify is not installed
if ! [ -x "$(command -v fastify)" ]; then
    echo "Fastify is not installed"
    echo "Installing Fastify..."
    npm install fastify
fi
# if flask is not installed
if ! [ -x "$(command -v flask)" ]; then
    echo "Flask is not installed"
    echo "Installing Flask..."
    pip install flask
fi
# if django is not installed
if ! [ -x "$(command -v django)" ]; then
    echo "Django is not installed"
    echo "Installing Django..."
    pip install django
fi
# if react is not installed
if ! [ -x "$(command -v react)" ]; then
    echo "React is not installed"
    echo "Installing React..."
    npm install react
fi
# if vue is not installed
if ! [ -x "$(command -v vue)" ]; then
    echo "Vue is not installed"
    echo "Installing Vue..."
    npm install vue
fi
# if angular is not installed
if ! [ -x "$(command -v angular)" ]; then
    echo "Angular is not installed"
    echo "Installing Angular..."
    npm install angular
fi
# if ionic is not installed
if ! [ -x "$(command -v ionic)" ]; then
    echo "Ionic is not installed"
    echo "Installing Ionic..."
    npm install ionic
fi
# if flutter is not installed
if ! [ -x "$(command -v flutter)" ]; then
    echo "Flutter is not installed"
    echo "Installing Flutter..."
    sudo snap install flutter --classic
fi
# if electron is not installed
if ! [ -x "$(command -v electron)" ]; then
    echo "Electron is not installed"
    echo "Installing Electron..."
    npm install electron
fi
# if bootstrap is not installed
if ! [ -x "$(command -v bootstrap)" ]; then
    echo "Bootstrap is not installed"
    echo "Installing Bootstrap..."
    npm install bootstrap
fi
# if tailwind is not installed
if ! [ -x "$(command -v tailwind)" ]; then
    echo "Tailwind is not installed"
    echo "Installing Tailwind..."
    npm install tailwind
fi
# if bulma is not installed
if ! [ -x "$(command -v bulma)" ]; then
    echo "Bulma is not installed"
    echo "Installing Bulma..."
    npm install bulma
fi
# if materialize is not installed
if ! [ -x "$(command -v materialize)" ]; then
    echo "Materialize is not installed"
    echo "Installing Materialize..."
    npm install materialize
fi
# if jquery is not installed
if ! [ -x "$(command -v jquery)" ]; then
    echo "JQuery is not installed"
    echo "Installing JQuery..."
    npm install jquery
fi
