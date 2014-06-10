#! /bin/bash

. ./func.sh

echo "Setting up bash and zsh configuration:"

linkOrWarn shells/bash_aliases ~/.bash_aliases
linkOrWarn shells/bashrc ~/.bashrc
linkOrWarn shells/dircolors ~/.dircolors
linkOrWarn shells/environment ~/.environment
linkOrWarn shells/zshrc ~/.zshrc
linkOrWarn shells/local-environment ~/.local-environment
