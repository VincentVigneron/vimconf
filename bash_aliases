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
alias @portable="xrandr --output VGA1 --off --output DP1 --off --output LVDS1 --auto && i3 restart > /dev/null"
alias @bureau="xrandr --output LVDS1 --off --output VGA1 --auto --output DP1 --auto --right-of VGA1 && i3 restart > /dev/null"
alias @salle="xrandr --output DP1 --off --output LVDS1 --auto --output VGA1 --auto --right-of LVDS1 && i3 restart > /dev/null"
alias @clone="xrandr --output DP1 --off --output VGA1 --auto --output LVDS1 --same-as VGA1&& i3 restart > /dev/null"
alias vim=nvim

alias otsolver="/home/vincent/hg/otsolver/visual/src/optim/build/RELEASE/bin/otsolver"
alias otsolver_debug="/home/vincent/hg/otsolver/visual/src/optim/build/DEBUG/bin/otsolver"
