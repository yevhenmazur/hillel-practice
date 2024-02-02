#! /bin/sh

sitename="$SITENAME"
directory="/src/$sitename"

if [ ! -d "$directory" ]; then
        echo "$directory doese not exist. Runing initialization steps..."
        cd /src/
        hugo new site $sitename
        cd $directory
        git init
        git submodule add https://github.com/theNewDynamic/gohugo-theme-ananke.git themes/ananke
        echo "theme = 'ananke'" >> hugo.toml
        echo "Initialization steps for site $sitename" are done.
else
        echo "$directory already exist."
fi

echo "Running HUGO server..."
cd $directory
hugo server --bind 0.0.0.0
