#!/bin/sh -l

: ${WPE_SSHG_KEY_PRIVATE?Required secret not set.}

echo "Hello $1"
time=$(date)
echo "::set-output name=time::$time"
echo "WPE_ENV_NAME: $2"