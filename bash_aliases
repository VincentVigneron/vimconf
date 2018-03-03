alias g++="g++ -fdiagnostics-color=auto"
alias gcpp="g++ -Wall -Wconversion -Wenum-compare -Werror"
alias tmux="tmux -2"

alias vimstatus="git --git-dir=~/vimconf/.git --work-tree=/vimconf status"
alias vimadd="git --git-dir=/vimconf/.git --work-tree=/vimconf add"
alias vimcommit="git --git-dir=/vimconf/.git --work-tree=/vimconf commit"
alias vimpull="git --git-dir=/vimconf/.git --work-tree=/vimconf pull"
alias vimpush="git --git-dir=/vimconf/.git --work-tree=/vimconf push origin master"
alias vimbrows="xdg-open https://github.com/VincentVigneron/vimconf.git"

alias python=python3

alias @phpStart='( cd ~/Docker/php ; docker-compose up -d )'
alias @phpStop='( cd ~/Docker/php ; docker-compose down )'
alias @phpCo='( cd ~/Docker/php ; docker-compose exec web bash )'
alias @phpDB='( cd ~/Docker/php ; docker-compose exec db bash )'
alias @portable="xrandr --output VGA-1 --off --output DP-1 --off --output LVDS-1 --auto && i3 restart > /dev/null"
alias @bureau="xrandr --output LVDS-1 --off --output VGA-1 --auto --output DP-1 --auto --right-of VGA-1 && i3 restart > /dev/null"
alias @salle="xrandr --output DP-1 --off --output LVDS-1 --auto --output VGA-1 --auto --right-of LVDS-1 && i3 restart > /dev/null"
alias @clone="xrandr --output DP-1 --off --output VGA-1 --auto --output LVDS-1 --same-as VGA-1&& i3 restart > /dev/null"
alias vim=nvim
