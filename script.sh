#!/bin/bash

# Define a list of root-privileged files to search for
root_files=(
  "/etc/passwd"
  "/etc/shadow"
  "/etc/sudoers"
 
)

# Loop through the list and search for each file in the entire file system
for file_path in "${root_files[@]}"; do
  echo "Searching for $file_path..."
  sudo find / -type f -name "$(basename "$file_path")" -exec cat {} \;
  echo -e "\n----------------------------------------\n"
done
