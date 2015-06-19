#!/bin/sh
ls
pacman -S --needed --noconfirm base-devel gcc
makepkg -s --noconfirm --skippgpcheck -f

echo $? > ~/build.log # store exit code of makepkg

#clean up
wineboot --kill # kill background wineconsole and socat processes
