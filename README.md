# INSTALLATION

## PACKAGES
trizen (aur)<br />
termite<br />
rofi<br />
polybar (aur)<br />
gsimplecal<br />
gtk-3<br />
gcc<br />
clang<br />
unversal-ctags-git (aur) (link  ctags to ~/.ctags) <br />
notify-osd<br />
acpi<br />
acpid<br />
alsa-tools<br />
alsa-utils<br />
cups<br />
firefox<br />
deepin-image-viewer<br />
gimp<br />
ranger<br />
gnome-screenshot<br />
gucharmap<br />
i3-gap (aur)<br />
i3lock<br />
immagemagick<br />
kate<br />
lightdm<br />
lightdm-gtk-greeter<br />
sddm<br />
nautilus<br />
netctl<br />
cmake<br />
okular<br />
openjdk<br />
python<br />
texlive-most<br />
texlive-lang<br />
texlive-bin<br />
the_silver_searcher<br />
tmux<br />
tree<br />
wicd<br />
wicd-gtk<br />
wpa_supplicant<br />
util-linux<br />
neovim<br />
neovim-surround (aur)<br />
neovim-airline (aur)<br />
neovim-airline-themes (aur)<br />
neovim-commentary (aur)<br />
neovim-ctrlp (aur)<br />
neovim-fugitive (aur)<br />
neovim-nerdtree (aur)<br />
neovim-plug (aur)<br />
neovim-ultisnips (aur)<br />
neovim-youcomplete-me-core-git (aur)<br />
python-neovim<br />
vlc<br />
w3m<br />
wget<br />
xclip<br />
xorg-server<br />
xorg-xbacklight<br />
xorg-xinit<br />
xorg-xrandr<br />
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
cargo-profiler<br />
skypeforlinux-bin (aur)<br />
virtualbox<br />
shellcheck<br />
python-vint (aur)<br />
vint (pip3)<br />
qt4<br /><br />

xdg-open Documents/Cours/web/cours/crs_php_01_introduction.pdf<br />

## TO REMOVE ?
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
wpa_actiond<br />
ttf-inconsolata<br />

## FONTS
terminus-font<br />
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
ttf-roboto<br />
ttf-symbola<br />
ttf-typicons (aur)<br />
ttf-inconsolata<br />
ttf-ubuntu-font-family<br />

## GRUB

### EDIT /etc/default/grub
sudo -E nvim /etc/default/grub<br />
GRUB_HIDDEN_TIMEOUT=1<br />
GRUB_HIDDEN_TIMEOUT_QUIET=true<br />

### UPDATE GRUB
grub-mkconfig -o /boot/grub/grub.cfg<br />

## VIM
Install plugin<br />

### TODO
nerdtree -> netrw + vinegar<br />
treetag & easytag<br />

## BINARIES
cp bin/\* /usr/local/bin<br />

## TWO MINUTES TIMER
sudo cp systemd/usr/timer-twominutes.timer /etc/systemd/user<br />
sudo cp systemd/usr/timer-twominutes.target /etc/systemd/user<br />
systemctl --user enable timer-twominutes.timer<br />

## BATTERY
sudo cp systemd/usr/lowbattery.service /etc/systemd/user<br />
sudo cp bin/lowbattery.sh /usr/local/bin (see BINARIES section)<br />
systemctl --user enable lowbattery.service<br />

## DISABLE POWER BUTTON
sudo -E /etc/systemd/logind.conf<br />
HandlePowerKey=ignore<br />

## ETHERNET
sudo cp netctl/ethernet-dhcp /etc/netctl/<br />
sudo systemctl enable ifplugd<br />

## WIFI
sudo systemctl enable wicd.service<br />

## ACPI¶
sudo systemctl enable acpid.service<br />

## LIGHT
sudo cp bl /etc/acpi/handlers/<br />
sudo cp bl_u /etc/acpi/events<br />
sudo cp bl_d /etc/acpi/events<br />

## CUPS
sudo systemctl enable cups-browsed.service<br />
sudo systemctl enable org.cups.cupsd.service<br />
sudo gpasswd -a USER sys<br />
sudo gpasswd -a USER lp<br />
### drivers
? sudo chmod a+r /etc/cups<br />
? sudo chmod 1777 /var/spool/cups/tmp<br />
? sudo chmod 1777 /var/spool/cups<br />
? sudo chmod 1777 /usr/lib/cups/\*<br />

## LANG AND KEYBOARD
### TODO
setxkbmap fr (witch keyboard mapping)<br />
localectl set-locale LANG=fr_FR.UTF-8<br />
localectl set-x11-keymap fr "" latin9<br />
localectl set-keymap fr-latin9<br />

### TODO
basic keyboard config<br />

## RUST
rustup toolchain install nightly<br />
rustup component add rls-preview --toolchain nightly<br />

## DISPLAY AT BOOT
### TODO
chose the "best" monitors at boot<br />


## CLONE SCALING
### TODO
make clone alias to scale<br />

## DOCK EVENT
### TODO
handle dock event<br />


## PRINT COLOR
chmod u+x print_color.py<br />
sudo apt-get install python3<br />
sudo apt-get install python-pip3<br />
sudo pip3 install PyPDF2<br />
sudo pip3 install wand<br />


## BASHRC
### TODO
Clean bashrc => zshrc<br />

## ZSHRC
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"<br />

## SDDM
systemctl enable sddm.service<br />
sudo su<br />
echo 'setxkbmap "fr"' >> /usr/share/sddm/scripts/Xsetup<br />
pacman -Rs qt5-virtualkayboard<br />
