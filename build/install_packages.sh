#!/bin/bash

set -ouex pipefail


### curl

# Starship prompt
curl -Lo /tmp/starship.tar.gz "https://github.com/starship/starship/releases/latest/download/starship-x86_64-unknown-linux-gnu.tar.gz"
tar -xzf /tmp/starship.tar.gz -C /tmp
install -c -m 0755 /tmp/starship /usr/bin

echo "eval \"\$(starship init bash)\"" >> /etc/bash.bashrc.local

### dnf

dnf5 install -y @virtualization
dnf5 install -y gnome-shell-extension-pop-shell
dnf5 install -y nerd-fonts