#!/bin/bash

set -ouex pipefail

### Cleanup COPR repositories

dnf5 -y copr disable che/nerd-fonts

#sed -i 's@enabled=1@enabled=0@g' /etc/yum.repos.d/vscode.repo
#sed -i 's@enabled=1@enabled=0@g' /etc/yum.repos.d/gh-cli.repo