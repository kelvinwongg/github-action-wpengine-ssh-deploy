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

# TEST SSH CONNECTION
# ssh -i ${SSH_KEY_PRIVATE_PATH} -o StrictHostKeyChecking=no ttidev@ttidev.ssh.wpengine.net

# Set RSYNC variables
WPE_SSH_HOST="$WPE_ENV_NAME.ssh.wpengine.net"
if [ -n "$TPO_PATH" ]; then 
    DIR_PATH="$TPO_PATH"
else 
    DIR_PATH=""
fi

if [ -n "$TPO_SRC_PATH" ]; then
    SRC_PATH="$TPO_SRC_PATH"
else
    SRC_PATH="."
fi

WPE_DESTINATION="$WPE_ENV_NAME"@"$WPE_SSH_HOST":sites/"$WPE_ENV_NAME"/"$DIR_PATH"

# List of changed files
# git diff-tree --no-commit-id --name-only --diff-filter=ACMRT -r $GITHUB_SHA
GIT_DIFF_TREE=$(git diff-tree --no-commit-id --name-only --diff-filter=ACMRT -r $GITHUB_SHA)
echo $GIT_DIFF_TREE

# Set output 'changed_files'
# echo "::set-output name=changed_files::'This is a list of changed files.'"