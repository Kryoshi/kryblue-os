#!/bin/bash

set -ouex pipefail

### Set custom scripts as executable

SCRIPTS=(
  "code_extensions_install.sh"
  "code_settings_update.sh"
  "install_flatpaks.sh"
  "systeminit.sh"
)
for SCRIPT in ${SCRIPTS[@]}; do
  chmod +x "/usr/local/bin/$SCRIPT"
done