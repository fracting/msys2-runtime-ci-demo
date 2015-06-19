#!/bin/sh
echo pacman -S --needed --noconfirm base-devel gcc
pacman -S --needed --noconfirm base-devel gcc
echo makepkg -s --noconfirm --skippgpcheck -f
makepkg -s --noconfirm --skippgpcheck -f

echo $? > ~/build.log # store exit code of makepkg

#clean up
echo wineboot --kill # kill background wineconsole and socat processes
wineboot --kill # kill background wineconsole and socat processes
