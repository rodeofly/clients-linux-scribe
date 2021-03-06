#!/bin/bash
# Script original de Didier SEVERIN (30/06/20)
# Académie de la Réunion
# Version 2.0

# Definition des fichiers et répertoires de travail
driverfile="/etc/cups/ppd/PHOTOCOPIEUSE_SDP.ppd"
binarydir="/usr/bin/recup_pin/"
scriptfile="$binarydir/recup_pin.sh"
my_dir="$(dirname "$0")"

# Copie du package recup_pin et attribution à l'utilisateur root
cp -fr $my_dir/recup_pin /usr/bin/
chown root:root $scriptfile

# Définition des droits
chmod 0755 /etc/cups/ppd/
chmod -R 0755 $binarydir
chmod 0744 $binarydir/DRIVER_ORIGINAL.PPD

# Copie du driver original
rm -fr /etc/cups/ppd/PHOTOCOPIEUSE*
cp $my_dir/recup_pin/DRIVER_ORIGINAL.PPD $driverfile

# Modification des permissions sur le driver
chown root:lp $driverfile
chmod 0777 $driverfile

# Ajout du script de configuration automatique au démarrage
grep "/usr/bin/recup_pin/" /etc/profile > /dev/null
if [ $? -ne 0 ]; then
	echo "/usr/bin/recup_pin/recup_pin.sh" >> /etc/profile
fi
