#!/bin/bash

directory="$HOME/vim"

declare -a list_of_files=(
	"bash_aliases"
	"bash_profile"
	"bashrc"
	"fonts"
	"inputrc"
	"tmux.conf"
	"vimrc"
	"Xdefaults"
)
declare -a list_of_vim=("spell" "UltiSnips")

for i in "${list_of_files[@]}"
do
	if [ -e $HOME/.$i ]
	then
		echo "Le fichier $i existe déjà, je n'ai donc rien fait !"
	else
		ln -s $directory/$i $HOME/.$i
	fi
done

if [ ! -d $HOME/.vim ]
then
	mkdir $HOME/.vim
fi
for i in "${list_of_vim[@]}"
do
	if [ -e $HOME/.vim/$i ]
	then
		echo "Le fichier $i existe déjà, je n'ai donc rien fait !"
	else
		ln -s $directory/$i $HOME/.vim/$i
	fi
done

