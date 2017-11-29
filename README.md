# PACKAGES
pacaur (aur)
termite
albert (aur)
polybar (aur)
gsimplecal
xrandr
gtk-3
g++
clang
notification-daemon
acpi
acpid
alsa-tools
alsa-utils
cups
firefox
gimmage
gimp
ranger
gnome-screenshot
gucharmap
i3-gap (aur)
i3lock
immagemagick
kate
lightdm
lightdm-greeter
nautilus
netctl
cmake
okular
openjdk9
python
texlive-bibtexextra
texlive-core
texlive-fontsextra
texlive-formatsextra
texlive-games
texlive-humanities
texlive-langextra
texlive-latexextra
texlive-music
texlive-pictures
texlive-pstricks
texlive-publishers
texlive-science
tmux
tree
wicd
wicd-gtk
wpa_actiond
wpa_supplicant
util-linux
vim
vlc
w3m
wget
xclip
xorg-server
xorg-xbacklight
xorg-xinit
xorg-xrandr
xterm
zip
docker
compton
eclipse
foomatic-db
foomatic-db-engine
foomatic-db-gutenprint-ppds
foomatic-db-nonfree
foomatic-db-nonfree-ppds
foomatic-db-ppds
git
gksu
gnuplot
htop
ifplugd
light (aur)
pulseaudio-alsa
python-numpy
python-pip
python-pywal
rust-docs
rust-racer
rustfmt
rustup
skypeforlinux-bin (aur)
virtualbox

# FONTS
terminus-font
ttf-font-awesomefont
typicons (aur ?)
bdf-unifont
ttf-bitstream-vera
ttf-dejavu
ttf-droid
ttf-fira-mono
ttf-fira-sans
ttf-font-awesome
ttf-freefont
ttf-hack
ttf-inconsolata
ttf-roboto
ttf-symbola
ttf-typicons (aur)
ttf-ubuntu-font-family

# VIM
Install plugin

# YouCompleteMe
cd ~
mkdir ycm_build
cd ycm_build
cmake -G "Unix Makefiles" . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
cd .vim/bundle/YouComplete/me
./install.py --clang-completer --racer-completer

# BATTERY
sudo cp lowbattery.timer /etc/systemd/user
sudo cp lowbattery.service /etc/systemd/user
sudo systemctl enable lowbattery.timer

# DISABLE POWER BUTTON
sudo -E /etc/systemd/logind.conf
HandlePowerKey=ignore

# ETHERNET
sudo cp ethernet-dhcp /etc/netctl/
sudo systemctl enable ifplugd

# CUPS
??
