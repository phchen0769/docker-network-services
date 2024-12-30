# Use the Alpine Linux base image
FROM alpine:latest

# Install OpenSSH and other utilities
RUN apk update && \
    apk add --no-cache openssh bash

# Copy the custom script, sshd_config, and host keys
COPY setup-ssh-user.sh /usr/local/bin/
COPY ssh-host-keys/* /etc/ssh/
COPY sshd_config /etc/ssh/
RUN chmod +x /usr/local/bin/setup-ssh-user.sh

# Expose SSH port
EXPOSE 22

# Set the script as the entrypoint and make it executable
ENTRYPOINT ["/usr/local/bin/setup-ssh-user.sh"]
