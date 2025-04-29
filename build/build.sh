#!/bin/bash

set -ouex pipefail

### Build image

# Copy system files onto image
rsync -rvK /ctx/files/ /

# Run build scripts
/ctx/build/copr_enable.sh
/ctx/build/install_packages.sh
/ctx/build/systemd.sh
/ctx/build/copr_disable.sh
