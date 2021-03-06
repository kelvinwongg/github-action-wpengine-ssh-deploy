# Container image that runs your code
FROM alpine:latest

# Add packages require for SSH connection
RUN apk update && \
	apk add --no-cache \
	# ca-certificates \
	git \
	rsync \
	openssh-client
	# sshpass \
	# bash

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]