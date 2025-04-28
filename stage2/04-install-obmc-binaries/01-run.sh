#!/bin/bash
set -e

# Ensure the home directory exists for the default user (e.g., pi)
USER_HOME="${ROOTFS_DIR}/home/pi"

# Copy scripts to /usr/bin
install -m 755 files/checkin "${ROOTFS_DIR}/usr/bin/"
install -m 755 files/ac "${ROOTFS_DIR}/usr/bin/"
install -m 755 files/checkin_output_banner "${ROOTFS_DIR}/usr/local/bin/"

# Copy the custom .tmux.conf file
install -v -o 1000 -g 1000 -m 644 files/tmux/.tmux.conf "${USER_HOME}/.tmux.conf"

# Ensure the minicom configuration directory exists
install -d "${ROOTFS_DIR}/etc/minicom"
# Copy the custom minicom configuration
install -m 644 files/minicom/minirc.bmc "${ROOTFS_DIR}/etc/minicom/minirc.bmc"
install -m 644 files/minicom/minirc.bios "${ROOTFS_DIR}/etc/minicom/minirc.bios"
install -m 644 files/minicom/minirc.dfl "${ROOTFS_DIR}/etc/minicom/minirc.dfl"

