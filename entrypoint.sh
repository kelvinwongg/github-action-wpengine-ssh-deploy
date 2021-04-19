#!/bin/sh -l

: ${INPUT_WPE_ENV_NAME?Required WPE site name not set.}
: ${INPUT_WPE_SSH_KEY_PUBLIC?Required public key secret not set.}
: ${INPUT_WPE_SSH_KEY_PRIVATE?Required private key secret not set.}

#SSH Key Vars 
SSH_PATH="$HOME/.ssh"
# KNOWN_HOSTS_PATH="$SSH_PATH/known_hosts"
WPE_SSH_KEY_PRIVATE_PATH="$SSH_PATH/github_action"
WPE_SSH_KEY_PUBLIC_PATH="$SSH_PATH/github_action.pub"

# Setup our SSH Connection & use keys
mkdir "$SSH_PATH"
# ssh-keyscan -t rsa "$WPE_SSH_HOST" >> "$KNOWN_HOSTS_PATH"

#Copy Secret Keys to container
echo "$INPUT_WPE_SSH_KEY_PRIVATE" > "$WPE_SSH_KEY_PRIVATE_PATH"
echo "$INPUT_WPE_SSH_KEY_PUBLIC" > "$WPE_SSH_KEY_PUBLIC_PATH"

#Set Key Perms 
chmod 700 "$SSH_PATH"
chmod 644 "$KNOWN_HOSTS_PATH"
chmod 600 "$WPE_SSH_KEY_PRIVATE_PATH"
chmod 644 "$WPE_SSH_KEY_PUBLIC_PATH"

# ls . -alh
ssh -v -p 22 -i ${WPE_SSH_KEY_PRIVATE_PATH} -o StrictHostKeyChecking=no ttidev@ttidev.ssh.wpengine.net
# ssh -i ${WPE_SSH_KEY_PRIVATE_PATH} -o StrictHostKeyChecking=no ttidev@ttidev.ssh.wpengine.net