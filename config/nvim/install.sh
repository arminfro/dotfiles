# setup yarn config, should be done in yarn/install.sh, but then execution order matters
yarn config set prefix ~/.yarn

# needed for nvim-telescope/telescope-z.nvim
ln -s ~/.zshrc ~/.zshenv
