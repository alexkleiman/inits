#! /bin/bash

. ./func.sh

echo "Setting up X11 configuration:"

linkOrWarn x11/xinitrc ~/.xinitrc
linkOrWarn x11/Xresources ~/.Xresources
