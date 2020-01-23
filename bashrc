# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

Black='\[\e[0;30m\]'
Red='\[\e[0;31m\]'
Green='\[\e[0;32m\]'
Orange='\[\e[0;33m\]'
Blue='\[\e[0;34m\]'
Purple='\[\e[0;35m\]'
Cyan='\[\e[0;36m\]'
LightGray='\[\e[0;37m\]'
DarkGray='\[\e[1;30m\]'
LightRed='\[\e[1;31m\]'
LightGreen='\[\e[1;32m\]'
Yellow='\[\e[1;33m\]'
LightBlue='\[\e[1;34m\]'
LightPurple='\[\e[1;35m\]'
LightCyan='\[\e[1;36m\]'
White='\[\e[1;37m\]'
NoColor='\[\e[m\]'

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

_dir_chomp () {
    local p=${1/#$HOME/\~} b s
    s=${#p}
    while [[ $p != "${p//\/}" ]]&&(($s>$2))
    do
        p=${p#/}
        [[ $p =~ \.?. ]]
        b=$b/${BASH_REMATCH[0]}
        p=${p#*/}
        ((s=${#b}+${#p}))
    done
    echo ${b/\/~/\~}${b+/}$p
}

if [ "$color_prompt" = yes ]; then
    #HomeShrink="${PWD/$HOME/\~}"
    #FolderShrink="${HomeShrink#\~}"
    #Dirname='`echo "${HomeShrink%/*}" | sed -e "s;\(/.\)[^/]*;\1;g"`/${FolderShrink##*/}'
    #PS1="${debian_chroot:+($debian_chroot)}${DarkGray}[\A]${LightRed}\u${DarkGray}@\h${NoColor}:${LightGreen}${Dirname}${DarkGray}\$${NoColor} "
    #PS1='`echo "${PWD%/*}" | sed -e "s;\(/.\)[^/]*;\1;g"`/${PWD##*/} \$ '
    #PS1="${debian_chroot:+($debian_chroot)}${DarkGray}[\A]${LightRed}\u${DarkGray}@\h${NoColor}:${LightGreen}\W${DarkGray}\$${NoColor} "
    #PS1='${debian_chroot:+($debian_chroot)}${DarkGray}[\A]${LightRed}\u${DarkGray}@\h${NoColor}:${LightGreen} $( _dir_chomp '$(pwd)' 20)${DarkGray}\$${NoColor} '
    PS1='\[\e[1;30m\][\A]\[\e[1;31m\]\u\[\e[1;30m\]@\h\[\e[m\]:\[\e[1;32m\] $( _dir_chomp "$(pwd)" 20)\[\e[1;30m\]$\[\e[m\] ' 
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
        ;;
    *)
        ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    if [ -f ~/.dircolors/dircolors.ansi-light ]; then
        eval `dircolors ~/.dircolors/dircolors.ansi-light`
    else
        test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    fi
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# if [[ $UID -ge 1000 && -d $HOME/bin && -z $(echo $PATH | grep -o $HOME/bin) ]]
# then
# 	    export PATH="${PATH}:$HOME/bin"
# fi


complete -c man which


#LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/Logiciels/gecode-4.4.0
#export LD_LIBRARY_PATH


shopt -s histappend
PROMPT_COMMAND='history -a'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


# ssh-keygen -t rda -C "vigneron.vincent.49@gmail.com"
# xsel --clipboard < ~/.ssh/id_rsa.pub

stty ixany
stty ixoff -ixon

# export VISUAL=kate

export JAVA_HOME="/usr/lib/jvm/java-12-openjdk"
# export VISUAL="/usr/bin/kate"
export EDITOR="nvim"
export RUST_SRC_PATH=$HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src/
export IWYU_MAPPING=$HOME/.config/iwyu/mappings.mp
export FZF_DEFAULT_COMMAND="fd --type f"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
    #PS1="%{$fg[black]%}[%T]%{$reset_color%}%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m%{$reset_color%}:%{$fg[yellow]%}%2~%{$reset_color%} "
