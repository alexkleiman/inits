#! /bin/bash

. ./func.sh

echo "Setting up emacs configuration:";

linkOrWarn emacs/emacs.d ~/.emacs.d
