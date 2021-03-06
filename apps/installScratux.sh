#!/bin/bash
# Verification de la présence des fichiers contenant les fonctions et variables communes
if [ -e ./esub_functions.sh ]; then
	my_dir="$(dirname "$0")"
	source $my_dir/esub_functions.sh
elif [ -e ../esub_functions.sh ]; then
	my_dir="($dirname "..")"
	source $my_dir/esub_functions.sh
else
	echo "Fichier esub_functions.sh absent ! Interruption de l'installation."
	exit
fi

getversion

#18.04
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 379CE192D401AB61
echo "deb https://dl.bintray.com/scratux/stable" $version "main" | sudo tee -a /etc/apt/sources.list
sudo apt-get update
sudo apt-get install scratux
