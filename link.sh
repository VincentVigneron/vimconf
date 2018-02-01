#!/bin/bash

directory="$HOME/vimconf"

declare -a list_of_conf=(
	"gsimplecal"
	"gtk-3.0"
	"i3"
	"nvim"
	"polybar"
	"ranger"
	"rofi"
	"termite"
)
for i in "${list_of_conf[@]}"; do
	if [ -e $HOME/.config/$i ]
	then
		echo "Le fichier $i existe déjà, je n'ai donc rien fait !"
	else
		echo $i
		ln -s $directory/$i $HOME/.config/$i
	fi
done

declare -a list_of_conf=(
	"bash_aliases"
	"bash_profile"
	"bashrc"
	"compton.conf"
	"ctags"
	"dircolors"
	"inputrc"
	"tmux.conf"
)
for i in "${list_of_conf[@]}"; do
	if [ -e $HOME/.$i ]
	then
		echo "Le fichier $i existe déjà, je n'ai donc rien fait !"
	else
		echo $i
        ln -s $i/dircolors $HOME/.$i
	fi
done
