# setup yarn config, should be done in yarn/install.sh, but then execution order matters
yarn config set prefix ~/.yarn

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
