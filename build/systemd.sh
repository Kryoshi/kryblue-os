#!/bin/bash

set -ouex pipefail

#Enable virtualization
systemctl enable libvirtd

#Enable docker
systemctl enable docker