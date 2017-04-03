# Phusion SSH

Make it easy to test SSH commands with the [Phusion Baseimage](https://github.com/phusion/baseimage-docker).

***This image contains and uses insecure ssh host keys - DO NOT USE IN PRODUCTION!***

# Setup
## Config
Review variables at the top of the makefile.

## Init project
`make init`

Binds ssh keys into the container. 

This command copies your local `id_rsa` and `id_rsa.pub` keys. If you wish to supply your own, add them to the `ssh/`. Ensure the filenames are `id_rsa` and `id_rsa.pub`.

## Build Container
`make build`

Builds the container based on the settings in the makefile.

# Usage
`make start`

Starts the container based on the config in the Makefile. This command starts it with the `-it --rm` options. If you want to start in detached mode run `make detatched`

# Misc
SSH runs on port `2222` so you will need to make sure you bind the port that you want to use for ssh on the host into the container.
