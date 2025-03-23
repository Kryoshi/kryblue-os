#!/bin/bash

# Script to install flatpak applications

flatpaks = (
  org.mozilla.firefox
  org.gnome.Loupe
  org.inkscape.Inkscape
  com.github.PintaProject.Pinta
  com.jgraph.drawio.desktop
  de.haeckerfelix.Fragments
  com.discordapp.Discord
  org.gimp.GIMP
  org.videolan.VLC
)

for flatpak in ${flatpaks[@]}; do
  flatpak install flatpak
done
