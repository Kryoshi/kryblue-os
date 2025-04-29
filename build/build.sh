#!/bin/bash

set -ouex pipefail

### Build image

# Copy system files onto image
rsync -rvK /ctx/files/ /

# Rebuild nvidia akmod
dnf5 -y install akmods
akmods --rebuild --force --akmod nvidia
rpm -qi kmod-nvidia-$(uname -r)

# Run build scripts
/ctx/build/copr_enable.sh
/ctx/build/install_packages.sh
/ctx/build/systemd.sh
/ctx/build/copr_disable.sh
