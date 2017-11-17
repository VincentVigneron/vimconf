alias sshjanus="ssh vigneron@janus.info.univ-angers.fr"
alias sftpjanus="sftp vigneron@janus.info.univ-angers.fr"
alias sshtaurus="ssh vincent.vigneron@taurus2.info-ua"
alias sftptaurus="sftp vincent.vigneron@taurus2.info-ua"
alias g++="g++ -fdiagnostics-color=auto"
alias gcpp="g++ -Wall -Wconversion -Wenum-compare -Werror -std=c++11"
alias tmux="tmux -2"

alias vimstatus="git --git-dir=$HOME/vimconf/.git --work-tree=$HOME/vim status"
alias vimadd="git --git-dir=$HOME/vimconf/.git --work-tree=$HOME/vim add"
alias vimcommit="git --git-dir=$HOME/vimconf/.git --work-tree=$HOME/vim commit"
alias vimpull="git --git-dir=$HOME/vimconf/.git --work-tree=$HOME/vim pull"
alias vimpush="git --git-dir=$HOME/vimconf/.git --work-tree=$HOME/vim push origin master"
alias vimbrows="xdg-open https://github.com/VincentVigneron/vimconf.git"

alias python=python3

alias cpycm="cp $HOME/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
alias @phpDev='docker run --rm -it --name phpDev -p 80:80 -p 3306:3306 -v $HOME/Mes_projets_web:/home/php_dev/Mes_projets_web php7-dev'
alias @portable="xrandr --output VGA-1 --off --output DP-1 --off --output LVDS-1 --mode 1366x768 && i3 restart"
alias @bureau="xrandr --output LVDS-1 --off --output VGA-1 --mode 1920x1080 --output DP-1 --mode 1920x1080 --right-of VGA-1 && i3 restart"
alias @salle="xrandr --output DP-1 --off --output LVDS-1 --mode 1366x768 --output VGA-1 --mode 1024x768 --right-of LVDS-1 && i3 restart"

# alias ranger='ranger --choosedir=$HOME/.config/ranger/rangerdir; LASTDIR=`cat $HOME/.config/ranger/rangerdir`; cd "$LASTDIR"'
