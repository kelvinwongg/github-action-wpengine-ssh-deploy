#!/bin/sh -l

: ${INPUT_WPE_ENV_NAME?Required WPE site name not set.}
: ${INPUT_WPE_SSH_KEY_PUBLIC?Required public key secret not set.}
: ${INPUT_WPE_SSH_KEY_PRIVATE?Required private key secret not set.}

# echo "Hello $1"
# time=$(date)
# echo "::set-output name=time::$time"

# echo "INPUT_WPE_ENV_NAME: $INPUT_WPE_ENV_NAME"
# echo "INPUT_WPE_SSH_KEY_PUBLIC: $INPUT_WPE_SSH_KEY_PUBLIC"
# echo "INPUT_WPE_SSH_KEY_PRIVATE: $INPUT_WPE_SSH_KEY_PRIVATE"

echo $INPUT_WPE_SSH_KEY_PRIVATE > ./private_key
ls . -alh
# ssh ttidev@ttidev.ssh.wpengine.net -i ./private_key