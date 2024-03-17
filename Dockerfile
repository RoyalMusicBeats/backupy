# Use a base image
FROM alpine:latest

# Install SSH and IPUtils-Ping packages
RUN apk update && apk add iputils nano openrc tzdata samba

# Set the timezone to Europe/Amsterdam
ENV TZ=Europe/Amsterdam

# copy local files
COPY root/ /