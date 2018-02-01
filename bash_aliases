alias sshjanus="ssh vigneron@janus.info.univ-angers.fr"
alias sftpjanus="sftp vigneron@janus.info.univ-angers.fr"
alias sshtaurus="ssh vincent.vigneron@taurus2.info-ua"
alias sftptaurus="sftp vincent.vigneron@taurus2.info-ua"
alias g++="g++ -fdiagnostics-color=auto"
alias gcpp="g++ -Wall -Wconversion -Wenum-compare -Werror"
alias tmux="tmux -2"

alias vimstatus="git --git-dir=$HOME/vimconf/.git --work-tree=$HOME/vimconf status"
alias vimadd="git --git-dir=$HOME/vimconf/.git --work-tree=$HOME/vimconf add"
alias vimcommit="git --git-dir=$HOME/vimconf/.git --work-tree=$HOME/vimconf commit"
alias vimpull="git --git-dir=$HOME/vimconf/.git --work-tree=$HOME/vimconf pull"
alias vimpush="git --git-dir=$HOME/vimconf/.git --work-tree=$HOME/vimconf push origin master"
alias vimbrows="xdg-open https://github.com/VincentVigneron/vimconf.git"

alias python=python3

alias @phpStart='( cd ~/Docker/php ; docker-compose up -d )'
alias @phpStop='( cd ~/Docker/php ; docker-compose down )'
alias @portable="xrandr --output VGA-1 --off --output DP-1 --off --output LVDS-1 --auto && i3 restart"
alias @bureau="xrandr --output LVDS-1 --off --output VGA-1 --auto --output DP-1 --auto --right-of VGA-1 && i3 restart"
alias @salle="xrandr --output DP-1 --off --output LVDS-1 --auto --output VGA-1 --auto --right-of LVDS-1 && i3 restart"
alias @clone="xrandr --output DP-1 --off --output VGA-1 --auto --output LVDS-1 --same-as VGA-1&& i3 restart"
alias vim=nvim
