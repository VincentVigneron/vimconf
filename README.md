# vimconf
rxvt-unicode-256colors arandr (dual screen)
.bashrc .vimrc spell UltiSnips and others are symlinks to the files in vimconf

cd ~
mkdir ycm_build
cd ycm_build
cmake -G "Unix Makefiles" . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
cd .vim/bundle/YouComplete/me
./install.py --clang-completer
sudo ln -s libclang.so.1 libclang.so
sudo apt-get isntall python3-numpy
sudo apt-get isntall python3-matlib

