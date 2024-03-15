#!/bin/sh

# Create a file in /root directory
touch /root/myfile.txt

# Check if the file was created successfully
if [ -e /root/myfile.txt ]; then
    echo "File created successfully in /root directory."
else
    echo "Failed to create file in /root directory."
fi