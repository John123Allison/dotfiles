# get oh my zsh
sudo apt install zsh
sudo apt install curl
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cp .vim ~/.vim -rf
cp .vimrc ~/.vimrc
cp .zshrc ~/.zshrc

vim +PlugInstall
