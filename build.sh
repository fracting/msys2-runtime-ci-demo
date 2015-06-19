#!/bin/sh

echo pacman -Sy
pacman -Sy
echo pacman -S --needed --noconfirm --noprogressbar base-devel gcc
pacman -S --needed --noconfirm --noprogressbar base-devel gcc
echo makepkg -s --noconfirm --noprogressbar --skippgpcheck -f
makepkg -s --noconfirm --noprogressbar --skippgpcheck -f

status=$?
echo $status | tee ~/build.log # store exit code of makepkg
echo "exit code is $status"

#clean up
echo wineboot --kill # kill background wineconsole and socat processes
wineboot --kill # kill background wineconsole and socat processes
