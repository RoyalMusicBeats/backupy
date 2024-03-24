# Use a base image
FROM alpine:latest

# Install SSH and IPUtils-Ping packages
RUN apk update && apk add iputils nano openrc tzdata cifs-utils psmisc

# Set the timezone to Europe/Amsterdam
ENV TZ=Europe/Amsterdam
ENV SAMBA_DESTINATION=TEST2

# copy local files
COPY root/ /

# Add execute permissions to the script
RUN chmod +x /script.sh

# This Dockerfile sets the entrypoint to "/script.sh", which will be executed when the container starts.
ENTRYPOINT ["/script.sh"]