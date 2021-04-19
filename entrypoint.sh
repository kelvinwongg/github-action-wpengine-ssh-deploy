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
WPE_SSH_HOST="$INPUT_WPE_ENV_NAME.ssh.wpengine.net"
if [ -n "$DEST_PATH" ]; then 
    DIR_PATH="$DEST_PATH"
else 
    DIR_PATH=""
fi

if [ -n "$SRC_PATH" ]; then
    SRC_PATH="$SRC_PATH"
else
    SRC_PATH="."
fi
WPE_DESTINATION="$INPUT_WPE_ENV_NAME"@"$WPE_SSH_HOST":sites/"$INPUT_WPE_ENV_NAME"/"$DIR_PATH"

# List of changed files
GIT_DIFF_TREE_PATH="./git_diff_tree"
GIT_DIFF_TREE=$(git diff-tree --no-commit-id --name-only --diff-filter=ACMRT -r $GITHUB_SHA)
echo "$GIT_DIFF_TREE" >> "$GIT_DIFF_TREE_PATH"

# Do the RSYNC
rsync -azPvn --files-from=$GIT_DIFF_TREE_PATH -e "ssh -i ${SSH_KEY_PRIVATE_PATH} -o StrictHostKeyChecking=no" $SRC_PATH "$WPE_DESTINATION"