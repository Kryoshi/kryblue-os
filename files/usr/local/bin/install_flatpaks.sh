#!/bin/bash

# Script to install flatpak applications

FLATPAKS=(
  "org.mozilla.firefox"
  "org.gnome.Loupe"
  "org.inkscape.Inkscape"
  "com.github.PintaProject.Pinta"
  "com.jgraph.drawio.desktop"
  "de.haeckerfelix.Fragments"
  "com.discordapp.Discord"
  "org.gimp.GIMP"
  "org.videolan.VLC"
)

for FLATPAK in ${FLATPAKS[@]}; do
  flatpak install -y $FLATPAK
done
