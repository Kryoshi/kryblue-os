#!/bin/bash

set -ouex pipefail

### Build image

# Copy system files onto image
rsync -rvK /ctx/files/ /

# Run build scripts

# shellcheck disable=SC1091
/ctx/build/copr_enable.sh
# shellcheck disable=SC1091
/ctx/build/install_packages.sh
# shellcheck disable=SC1091
/ctx/build/systemd.sh
# shellcheck disable=SC1091
/ctx/build/copr_disable.sh