#!/bin/bash

### Script to initialise system after initial setup and installation

## starship

starship_preset="tokyo-night"

starship preset "$starship_preset" -o ~/.config/starship.toml

## ptyxis

PROFILE=$(gsettings get org.gnome.Ptyxis default-profile-uuid)
gsettings set org.gnome.Ptyxis.Profile:/org/gnome/Ptyxis/Profiles/${PROFILE:1:-1}/ opacity 0.9

## flatpak

flatpak remote-modify --no-filter --enable flathub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install -y --reinstall flathub $(flatpak list --app-runtime=org.fedoraproject.Platform --columns=application | tail -n +1 )
flatpak remote-delete fedora

## git

git config --global user.name "Ashutush Choudhury"
git config --global user.email "63922550+Kryoshi@users.noreply.github.com"
git config --global init.defaultBranch main
git config --global pull.rebase false
git config --global core.editor "code"
