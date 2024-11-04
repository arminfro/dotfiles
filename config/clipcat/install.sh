#!/bin/bash

# ref https://github.com/xrelkd/clipcat/blob/develop/docs/INSTALL.md#fedora-linux

# Create a temporary directory
temp_dir=$(mktemp -d)

# Switch into the temporary directory
cd "$temp_dir" || exit

export CLIPCAT_VERSION=$(basename $(curl -s -w %{redirect_url} https://github.com/xrelkd/clipcat/releases/latest))

curl -s -L -O https://github.com/xrelkd/clipcat/releases/download/${CLIPCAT_VERSION}/clipcat-${CLIPCAT_VERSION#v}-1.el7.x86_64.rpm
sudo dnf install --assumeyes clipcat-${CLIPCAT_VERSION#v}-1.el7.x86_64.rpm
