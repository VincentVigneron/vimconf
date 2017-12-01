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
	"nvim"
)
for i in "${list_of_conf[@]}"
do
	if [ -e $HOME/.config/$i ]
	then
		echo "Le fichier $i existe déjà, je n'ai donc rien fait !"
	else
		echo $i
		ln -s $directory/$i $HOME/.config/$i
	fi
done
