# Use a base image
FROM alpine:latest

# Install SSH and IPUtils-Ping packages
RUN apk update && apk add iputils nano openrc tzdata cifs-utils psmisc

# Set the timezone to Europe/Amsterdam
ENV TZ=Europe/Amsterdam
ENV SAMBA_SOURCE=TEST1
ENV SAMBA_DESTINATION=TEST2

# copy local files
COPY root/ /

# Add execute permissions to the script
RUN chmod +x /script.sh

# This Dockerfile sets the entrypoint to "tail -f /dev/null".
# The purpose of this entrypoint is to keep the container running indefinitely.
CMD ["tail", "-f", "/dev/null"]
# allowing it to be used as a base image for other containers or as a placeholder.
ENTRYPOINT ["/script.sh"]