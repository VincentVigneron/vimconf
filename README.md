# PACKAGES
pacaur (aur)<br />
termite<br />
albert (aur)<br />
polybar (aur)<br />
gsimplecal<br />
xrandr<br />
gtk-3<br />
g++<br />
clang<br />
notification-daemon<br />
acpi<br />
acpid<br />
alsa-tools<br />
alsa-utils<br />
cups<br />
firefox<br />
gimmage<br />
gimp<br />
ranger<br />
gnome-screenshot<br />
gucharmap<br />
i3-gap (aur)<br />
i3lock<br />
immagemagick<br />
kate<br />
lightdm<br />
lightdm-greeter<br />
nautilus<br />
netctl<br />
cmake<br />
okular<br />
openjdk9<br />
python<br />
texlive-bibtexextra<br />
texlive-core<br />
texlive-fontsextra<br />
texlive-formatsextra<br />
texlive-games<br />
texlive-humanities<br />
texlive-langextra<br />
texlive-latexextra<br />
texlive-music<br />
texlive-pictures<br />
texlive-pstricks<br />
texlive-publishers<br />
texlive-science<br />
tmux<br />
tree<br />
wicd<br />
wicd-gtk<br />
wpa_actiond<br />
wpa_supplicant<br />
util-linux<br />
vim<br />
vlc<br />
w3m<br />
wget<br />
xclip<br />
xorg-server<br />
xorg-xbacklight<br />
xorg-xinit<br />
xorg-xrandr<br />
xterm<br />
zip<br />
docker<br />
compton<br />
eclipse<br />
foomatic-db<br />
foomatic-db-engine<br />
foomatic-db-gutenprint-ppds<br />
foomatic-db-nonfree<br />
foomatic-db-nonfree-ppds<br />
foomatic-db-ppds<br />
git<br />
gksu<br />
gnuplot<br />
htop<br />
ifplugd<br />
light (aur)<br />
pulseaudio-alsa<br />
python-numpy<br />
python-pip<br />
python-pywal<br />
rust-docs<br />
rust-racer<br />
rustfmt<br />
rustup<br />
skypeforlinux-bin (aur)<br />
virtualbox<br />

# FONTS
terminus-font<br />
ttf-font-awesomefont<br />
typicons (aur ?)<br />
bdf-unifont<br />
ttf-bitstream-vera<br />
ttf-dejavu<br />
ttf-droid<br />
ttf-fira-mono<br />
ttf-fira-sans<br />
ttf-font-awesome<br />
ttf-freefont<br />
ttf-hack<br />
ttf-inconsolata<br />
ttf-roboto<br />
ttf-symbola<br />
ttf-typicons (aur)<br />
ttf-ubuntu-font-family<br />

# VIM
Install plugin<br />

# YouCompleteMe
cd ~<br />
mkdir ycm_build<br />
cd ycm_build<br />
cmake -G "Unix Makefiles" . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp<br />
cd .vim/bundle/YouComplete/me<br />
./install.py --clang-completer --racer-completer<br />

# BATTERY
sudo cp lowbattery.timer /etc/systemd/user<br />
sudo cp lowbattery.service /etc/systemd/user<br />
sudo systemctl enable lowbattery.timer<br />

# DISABLE POWER BUTTON
sudo -E /etc/systemd/logind.conf<br />
HandlePowerKey=ignore<br />

# ETHERNET
sudo cp ethernet-dhcp /etc/netctl/<br />
sudo systemctl enable ifplugd<br />

# CUPS
??<br />
