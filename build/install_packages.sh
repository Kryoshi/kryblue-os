#!/bin/bash

set -ouex pipefail


### direct

# Starship prompt
curl -Lo /tmp/starship.tar.gz "https://github.com/starship/starship/releases/latest/download/starship-x86_64-unknown-linux-gnu.tar.gz"
tar -xzf /tmp/starship.tar.gz -C /tmp
install -c -m 0755 /tmp/starship /usr/bin

echo "eval \"\$(starship init bash)\"" >> /etc/bashrc

### dnf

PACKAGES_INSTALL=(
  "@virtualization"
  "nerd-fonts"
  "fastfetch"
  "code"
  "git"
)
for PACKAGE in ${PACKAGES_INSTALL[@]}; do
  dnf5 install -y "$PACKAGE"
done

dnf5 install -y gh --repo gh-cli


PACKAGES_REMOVE=(
  "firefox"
  "gnome-tour.x86_64"
)
for PACKAGE in ${PACKAGES_REMOVE[@]}; do
  dnf5 remove -y "$PACKAGE"
done

# Gnome extensions
EXTENSIONS=(
  "gnome-shell-extension-pop-shell"
  "gnome-shell-extension-blur-my-shell"
  "gnome-shell-extension-caffeine"
  "gnome-shell-extension-appindicator"
  "gnome-shell-extension-vertical-workspaces"
  "gnome-shell-extension-system-monitor"
  "gnome-shell-extension-frippery-move-clock"
)
for EXTENSION in ${EXTENSIONS[@]}; do
  dnf5 install -y "$EXTENSION"
done