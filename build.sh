#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf5 install -y @virtualization
dnf5 install -y gnome-shell-extension-pop-shell
dnf5 install -y cascadia-code-nf-fonts

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

dnf5 -y copr enable atim/starship
dnf5 -y install starship
dnf5 -y copr disable atim/starship

### Example for enabling a System Unit File

systemctl enable libvirtd

### Install flatpaks

#Remove fedora remote
flatpak remote-delete fedora

#Add flathub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install org.mozilla.firefox

### Write to files

echo "eval \"\$(starship init bash)\"" >> /etc/bash.bashrc.local