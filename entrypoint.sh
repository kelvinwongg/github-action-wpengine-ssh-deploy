#!/bin/sh -l

: ${WPE_ENV_NAME?Required WPE site name not set.}
: ${WPE_SSH_KEY_PUBLIC?Required public key secret not set.}
: ${WPE_SSH_KEY_PRIVATE?Required private key secret not set.}

echo "Hello $1"
time=$(date)
echo "::set-output name=time::$time"
echo "WPE_ENV_NAME: $2"