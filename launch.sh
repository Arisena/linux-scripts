#!/bin/bash

[ -z $CALLED_FROM_START_APP ] && { echo "Not called correctly"; exit 42; }

dialog --title "Launch.sh" \
	--backtitle 'Version 0.3' \
	--cancel-label 'Exit' \
	--msgbox 'Work in Progress, Proceed at your own risk' 7 25

exec 3>&1
selection=$(dialog --title "Graphical Interface" \
	--backtitle 'WIP' \
	--clear \
	--cancel-label 'Exit' \
	--menu "Please Select:" 11 25 4 \
	"1" "i3" \
	"2" "gnome" \
	"3" "cinnamon" \
	"4" "Dwarf Fortress" \
	"5" "Cataclysm DDA" \
	2>&1 1>&3)

case $selection in
	0 )
		clear
		echo "Program Exit"
		;;
	1 )
		XS=i3 startx
		;;
	2 )
		XS=gnome startx
		;;
	3 )
		XS=cin startx
		;;
	4 )
		XS=df startx
		;;
	5 )
		XS=cata startx
		;;
esac

clear
