#!/bin/bash
# David Lázaro Viagel
# Script 10

clear
if (( $EUID != 0 )) # $EUID = 0 if you are running the script with root privileges
then
  echo "This script must be run as a root"
  exit 1 
fi

echo "Dona'm el nom de l'usuari: "
read user
echo "Indica el nom del grup del sistema: "
read grup
echo "Estas segur que vols afegir $user al grup $grup?  'y' per si o 'n' per no"
read opc
case $opc in
	y)
		gpasswd -a $user $grup
	;;
	n)
		exit 1
	;;
esac
exit 3
