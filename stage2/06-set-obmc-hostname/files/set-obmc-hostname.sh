#!/bin/bash

# Function to check if a hostname is in use
is_hostname_in_use() {
    local hostname="$1"
    if ping -c 1 -W 1 "$hostname" > /dev/null 2>&1; then
        echo "Hostname $hostname is in use."
        return 0
    else
        echo "Hostname $hostname is available."
        return 1
    fi
}

# Iterate over hostnames from obmc-01 to obmc-99
for i in $(seq -w 1 99); do
    hostname="obmc-rpi-$i"
    if ! is_hostname_in_use "$hostname"; then
        # Set the hostname
        echo "$hostname" > /etc/hostname
        sed -i "s/127.0.1.1.*/127.0.1.1\t$hostname/g" /etc/hosts

        # Log the chosen hostname
        echo "Hostname set to $hostname"

        # Disable the service so it does not run again
        systemctl disable set-obmc-hostname.service

        # Reboot to apply changes
        reboot

        # Exit after setting the hostname
        break
    fi
done

