#!/bin/sh -l

: ${INPUT_WPEENVNAME?Required WPE site name not set.}
# : ${INPUT_WPE_SSH_KEY_PUBLIC?Required public key secret not set.}
# : ${INPUT_WPE_SSH_KEY_PRIVATE?Required private key secret not set.}

echo "Hello $1"
time=$(date)
echo "::set-output name=time::$time"
echo "INPUT_WPEENVNAME: $INPUT_WPEENVNAME"