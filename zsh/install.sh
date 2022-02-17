echo 'Change shell to zsh'
sudo chsh -s /bin/zsh $USER

# install zsh plugin manager zinit
mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin"
