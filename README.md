# Github Action WPEngine SSH Deploy

This action prints "Hello World" or "Hello" + the name of a person to greet to the log.

## Inputs

### `WPE_ENV_NAME`

**Required** Your WPEngine site name. `wpeid`

### `WPE_SSH_KEY_PRIVATE`

**Required** Your SSH private key for WPE in Github Secret' `private key`

### `DEST_PATH`

Optional relative destination path `destination path`

###  `SRC_PATH`

Optional relative source path `source path`

## Outputs

This action do not output.

## Example usage

Refer to the sample yaml file in this repo: `.github/workflows/sample.yml`