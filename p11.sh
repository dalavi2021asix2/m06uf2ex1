#!/bin/bash
# David Lázaro Viagel
# Script 11

clear
if (( $EUID != 0 )) # $EUID = 0 if you are running the script with root privileges
then
  echo "This script must be run as a root"
  exit 1 
fi

wget http://www.collados.org/asix2/m06/uf2/alumnes.ods
libreoffice --headless --convert-to csv alumnes.ods
pos=$ini
for nom in $(cut -d ',' -f 2 alumnes.csv)
do
	password=$(pwgen 10 1)
	echo "$nom $password" >> contrasenyesalumnes.txt

done
exit 0
