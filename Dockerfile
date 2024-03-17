# Use a base image
FROM alpine:latest

# Install SSH and IPUtils-Ping packages
RUN apk update && apk add iputils nano openrc tzdata samba

# Set the timezone to Europe/Amsterdam
ENV TZ=Europe/Amsterdam

# copy local files
COPY root/ /

# Add execute permissions to the script
RUN chmod +x /script.sh

# Run the script when the container starts
CMD ["/script.sh"]

# Expose port 445
EXPOSE 445

# This Dockerfile sets the entrypoint to "tail -f /dev/null".
# The purpose of this entrypoint is to keep the container running indefinitely,
# allowing it to be used as a base image for other containers or as a placeholder.
ENTRYPOINT ["tail", "-f", "/dev/null"]