#!/bin/sh
pwd
ls
pacman -Sy
pacman -S --needed --noconfirm base-devel gcc
makepkg -s --skippgpcheck -f
