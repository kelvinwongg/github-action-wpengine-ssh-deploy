#!/bin/sh -l

: ${INPUT_WPE_ENV_NAME?Required WPE site name not set.}
: ${INPUT_WPE_SSH_KEY_PRIVATE?Required private key secret not set.}

#SSH Key Vars 
SSH_PATH="."
SSH_KEY_PRIVATE_PATH="$SSH_PATH/wpegitkey"

#Copy Secret Keys to container
echo "$INPUT_WPE_SSH_KEY_PRIVATE" > "$SSH_KEY_PRIVATE_PATH"

#Set Key Perms 
chmod 600 "$SSH_KEY_PRIVATE_PATH"

# TRY SSH
ssh -i ${SSH_KEY_PRIVATE_PATH} -o StrictHostKeyChecking=no ttidev@ttidev.ssh.wpengine.net

echo "::set-output name=changed_files::'This is a list of changed files.'"