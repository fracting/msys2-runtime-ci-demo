#!/bin/sh

(for i in {0..80}; do echo timestamp:$i; sleep 60; done) & # background

echo $ pacman -Sy
pacman -Sy
echo $ pacman -S --needed --noconfirm --noprogressbar base-devel gcc
pacman -S --needed --noconfirm --noprogressbar base-devel gcc
echo $ makepkg -s --noconfirm --noprogressbar --skippgpcheck -f
(makepkg -s --noconfirm --noprogressbar --skippgpcheck -f; echo $? > ~/exit.number)

echo $ ls -lh
ls -lh

exit_code=$(cat ~/exit.number)
echo "exit code is $exit_code"

#clean up
echo wineboot --kill # kill background timestamp process and wineconsole itself
wineboot --kill
