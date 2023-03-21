#!/bin/bash

# install patched font
mkdir /tmp/Inconsolata
cd /tmp/Inconsolata/
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Inconsolata.zip
unzip Inconsolata.zip
rm Inconsolata.zip
rm -vrf -- *Compatible*
mv /tmp/Inconsolata ~/.local/share/fonts/
