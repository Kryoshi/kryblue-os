#!/bin/bash

set -ouex pipefail

###Enable COPR repositories

dnf5 -y copr enable che/nerd-fonts