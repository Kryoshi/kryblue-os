#!/bin/bash

# Script to install flatpak applications

FLATPAKS=(
  "org.mozilla.firefox"
  "org.inkscape.Inkscape"
  "com.github.PintaProject.Pinta"
  "com.jgraph.drawio.desktop"
  "de.haeckerfelix.Fragments"
  "com.discordapp.Discord"
  "org.gimp.GIMP"
  "org.videolan.VLC"
  "com.usebottles.bottles"
  "com.github.tchx84.Flatseal"
  "org.kde.kasts"
  "com.github.Matoking.protontricks"
  "app.drey.Warp"
)

for FLATPAK in ${FLATPAKS[@]}; do
  flatpak install -y $FLATPAK
done
