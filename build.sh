#!/bin/sh

echo pacman -Sy
pacman -Sy
echo pacman -S --needed --noconfirm base-devel gcc
pacman -S --needed --noconfirm base-devel gcc
echo makepkg -s --noconfirm --skippgpcheck -f
makepkg -s --noconfirm --skippgpcheck -f

echo -n "exit code is "
echo $? | tee ~/build.log # store exit code of makepkg

#clean up
echo wineboot --kill # kill background wineconsole and socat processes
wineboot --kill # kill background wineconsole and socat processes
