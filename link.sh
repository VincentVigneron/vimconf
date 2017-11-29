#!/bin/bash

directory="$HOME/vimconf"

declare -a list_of_conf=(
	"i3"
	"polybar"
	"gtk-3.0"
	"ranger"
	"gsimplecal"
	"pacaur"
	"albert"
	"termite"
)
for i in "${list_of_conf[@]}"
do
	if [ -e $HOME/.$i ]
	then
		echo "Le fichier $i existe déjà, je n'ai donc rien fait !"
	else
		echo $i
		ln -s $directory/$i ~/.config/$i
	fi
done
