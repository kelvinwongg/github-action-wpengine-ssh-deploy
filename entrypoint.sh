#!/bin/sh -l

: ${$2?Required WPE site name not set.}
: ${$3?Required public key secret not set.}
: ${$4?Required private key secret not set.}

echo "Hello $1"
time=$(date)
echo "::set-output name=time::$time"
echo "WPE_ENV_NAME: $2"