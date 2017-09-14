#!/bin/sh
cachedir=${XDG_CACHE_HOME:-"$HOME/.cache"}
histsize=50
if [ -d "$cachedir" ]; then
	cache=$cachedir/emenu
	hist=$cachedir/emenu_hist
else
	cache=$HOME/.emenu_cache # if no xdg dir, fall back to dotfile in ~
	hist=$HOME/.emenu_cache_hist # if no xdg dir, fall back to dotfile in ~
fi
if [ ! -e "$hist" ]; then
	touch "$hist"
fi

if stest -dqr -n "$cache" $PATH; then
	(tac "$hist" ; stest -flx $PATH | sort -u | tee "$cache" ) | dmenu "$@" >> $hist
else
	(tac "$hist" ; cat "$cache") | dmenu "$@" >> $hist
fi

cmd=`tail -n1 $hist`

i3-msg "exec $cmd"

# only keep commands with parameter
cat $hist | grep -e "^[^\s]\+\s\+[^\s]" | uniq | tail -n$histsize > $hist.tmp
mv $hist.tmp $hist
