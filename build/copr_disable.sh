#!/bin/bash

set -ouex pipefail

### Cleanup COPR repositories

dnf5 -y copr disable che/nerd-fonts