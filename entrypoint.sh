#!/bin/sh -l

echo "Hello $1"
time=$(date)
echo "::set-output name=time::$time"
echo "WPE_ENV_NAME: $2"