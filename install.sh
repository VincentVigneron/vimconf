#!/bin/bash

directory="$HOME/vim"


##########
## HOME ##
##########
declare -a list_of_files=(
	"bash_aliases"
	"bash_profile"
	"bashrc"
	"fonts"
	"inputrc"
	"tmux.conf"
	"vimrc"
	"Xresources"
	"Xdefaults"
)
for i in "${list_of_files[@]}"
do
	if [ -e $HOME/.$i ]
	then
		echo "Le fichier $i existe déjà, je n'ai donc rien fait !"
	else
		ln -s $directory/$i $HOME/.$i
	fi
done
fc-cache -fv

#########
## VIM ##
#########
declare -a list_of_vim=("spell" "UltiSnips")
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


########
## I3 ##
########
declare -a list_of_i3=("config" "emenu_run.sh" "Images/Wallpapers/black.jpg")
if [ ! -d $HOME/.config ]
then
	mkdir $HOME/.config/
fi

if [ -e $HOME/.config/i3 ]
then
	echo "Le répertoire .config/i3 existe déjà, je n'ai donc rien fait !"
else
	mkdir $HOME/.config/i3
	mkdir $HOME/.config/i3/Images
	mkdir $HOME/.config/i3/Images/Wallpapers
fi
for i in "${list_of_i3[@]}"
do
	if [ -e $HOME/.config/i3/$i ]
	then
		echo "Le fichier $i existe déjà, je n'ai donc rien fait !"
	else
		ln -s $directory/i3/$i $HOME/.config/i3/$i
	fi
done

declare -a list_of_ranger=("rc.conf")
if [ -e $HOME/.config/ranger ]
then
	echo "Le répertoire .config/ranger existe déjà, je n'ai donc rien fait !"
else
	mkdir $HOME/.config/ranger
fi
for i in "${list_of_ranger[@]}"
do
	if [ -e $HOME/.config/ranger/$i ]
	then
		echo "Le fichier $i existe déjà, je n'ai donc rien fait !"
	else
		ln -s $directory/ranger/$i $HOME/.config/ranger/$i
	fi
done
# curl https://sh.rustup.rs -sSf | sh
# cargo install racer
# rustup component add rust-src
# cargo install rustfmt
