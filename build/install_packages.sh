#!/bin/bash

set -ouex pipefail


### direct

# Starship prompt
curl -Lo /tmp/starship.tar.gz "https://github.com/starship/starship/releases/latest/download/starship-x86_64-unknown-linux-gnu.tar.gz"
tar -xzf /tmp/starship.tar.gz -C /tmp
install -c -m 0755 /tmp/starship /usr/bin

echo "eval \"\$(starship init bash)\"" >> /etc/bashrc

### dnf

packages=(
  "@virtualization"
  "nerd-fonts"
  "fastfetch"
  "code"
  "git"
)
for package in ${packages[@]}; do
  dnf5 install -y "$package"
done

# Gnome extensions
extensions=(
  "gnome-shell-extension-pop-shell"
  "gnome-shell-extension-blur-my-shell"
  "gnome-shell-extension-caffeine"
  "gnome-shell-extension-appindicator"
  "gnome-shell-extension-vertical-workspaces"
  "gnome-shell-extension-system-monitor"
  "gnome-shell-extension-frippery-move-clock"
)
for extension in ${extensions[@]}; do
  dnf5 install -y "$extension"
done