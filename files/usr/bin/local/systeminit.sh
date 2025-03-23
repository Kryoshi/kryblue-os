#!/bin/bash

### Script to initialise system after initial setup and installation

## starship

starship_preset = "tokyo-night"

starship preset "$starship_preset" -o ~/.config/starship.toml

## flatpak

flatpak remote-delete fedora
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo