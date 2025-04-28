#!/bin/bash
set -e

install -m 755 files/set-obmc-hostname.sh "${ROOTFS_DIR}/usr/local/bin/"

# Copy the systemd service file to the systemd directory
install -m 644 files/set-obmc-hostname.service "${ROOTFS_DIR}/etc/systemd/system/"

# Enable the service
on_chroot << EOF
systemctl enable set-obmc-hostname.service
EOF
