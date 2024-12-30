#!/bin/bash

# Fetch username, password, and public key from environment variables
SSH_USER="${SSH_USER:-}"
SSH_PASSWORD="${SSH_PASSWORD:-}"
SSH_PUBLIC_KEY="${SSH_PUBLIC_KEY:-}"

# Check if both username, password and public key are provided
if [ -z "$SSH_USER" ] || ([ -z "$SSH_PASSWORD" ] && [ -z "$SSH_PUBLIC_KEY" ]); then
    echo "SSH_USER, SSH_PASSWORD or SSH_PUBLIC_KEY environment variables must be set."
    exit 1
fi

# Create the user and set up password or public key authentication
adduser -D -s /bin/bash "$SSH_USER"

# User is activated here eventhough if SSH_PASSWORD is not set  
# running this enables the user and can be used with key based auth
echo "$SSH_USER:$SSH_PASSWORD" | chpasswd 

mkdir -p /home/"$SSH_USER"/.ssh
if [ -n "$SSH_PUBLIC_KEY" ]; then
    echo "$SSH_PUBLIC_KEY" >> /home/"$SSH_USER"/.ssh/authorized_keys
    chown -R "$SSH_USER":"$SSH_USER" /home/"$SSH_USER"/.ssh
    chmod 700 /home/"$SSH_USER"/.ssh
    chmod 600 /home/"$SSH_USER"/.ssh/authorized_keys       
fi

chmod 644 /etc/ssh/*.pub
chmod 600 /etc/ssh/*_key

# Start SSH service in the foreground
/usr/sbin/sshd -D
