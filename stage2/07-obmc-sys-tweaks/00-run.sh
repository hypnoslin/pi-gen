#!/bin/bash
set -e

# Enable UART0
on_chroot << EOF
systemctl enable serial-getty@ttyS0.service
EOF

# Install bash profile
install -m 644 files/.bash_profile "${ROOTFS_DIR}/home/pi/.bash_profile"

