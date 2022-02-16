# setup yarn config, should be done in yarn/install.sh, but then execution order matters
yarn config set prefix ~/.yarn

nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
