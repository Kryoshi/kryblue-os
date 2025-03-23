# kryblue-os

Customised universal blue image based off of [ublue-os/image-template](https://github.com/ublue-os/image-template)

# Installation

- Install official [Fedora Silverblue 41 ISO](https://fedoraproject.org/atomic-desktops/silverblue/download)
- Rebase to the unsigned base ublue image `rpm-ostree rebase ostree-unverified-registry:ghcr.io/ublue-os/silverblue-nvidia:latest`
- Rebase to the signed custom image `rpm-ostree rebase ostree-image-signed:docker://ghcr.io/kryoshi/kryblue-os:latest`
