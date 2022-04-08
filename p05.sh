#!/bin/bash
# David Lázaro Viagel
# Script 5

clear
if (( $EUID != 0 )) # $EUID = 0 if you are running the script with root privileges
then
  echo "This script must be run as a root"
  exit 1 
fi

function install(){
	clear
	echo -n "Diga'm el nom del paquet a instal·lar: "
	read paquet
	inst=$(aptitude search $paquet | cut -d " " -f 1)
	if [[ $inst != "i" ]]
	then
	echo "Instal·lant paquet"
	aptitude install -y $paquet # > /dev/null
	echo "Paquet instal·lat"
	fi
	echo -n "Vol continuar? '1' per si o 'n' per no: "
	read opcio
	case $opcio in
		1)
			install
		;;
		n)
			exit 20
		;;	
	esac
}

install
