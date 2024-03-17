# Use a base image
FROM alpine:latest

# Install SSH and IPUtils-Ping packages
RUN apk update && apk add openssh iputils nano openrc tzdata ansible openjdk21 git

# Set the timezone to Europe/Amsterdam
ENV TZ=Europe/Amsterdam

# Generate host keys for SSH
RUN ssh-keygen -A

# Copy the script to the container
COPY script.sh /mnt/script.sh

# Add execute permissions to the script
RUN chmod +x /mnt/script.sh

# Run the script when the container starts
RUN /mnt/script.sh