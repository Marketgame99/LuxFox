#!/bin/bash

# Disable eth0
ifconfig eth0 down

# Wait a seconds
sleep 1

# Enable eth0
ifconfig eth0 up

# Wait a seconds
sleep 1

# Change to the directory containing the pppwn executable
cd /home/pico/PPPwn-Luckfox/
# Execute the pppwn command with the desired options
./pppwn --interface eth0 --fw 1100 --stage1 "stage1.bin" --stage2 "stage2.bin" -a -t 10 -nw -rs

# Check if the pppwn command was successful
if [ $? -eq 0 ]; then
    echo "pppwn execution completed successfully."
    systemctl stop pppwn.service
else
    echo "pppwn execution failed. Exiting script."
    exit 1
fi

