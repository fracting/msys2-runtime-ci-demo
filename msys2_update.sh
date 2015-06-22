#!/bin/sh


echo pacman -Sy
pacman -Sy 2>&1 | tee -a ~/msys2_update.log
echo pacman -S --needed --noconfirm msys2-runtime pacman
pacman -S --needed --noconfirm msys2-runtime pacman pacman-mirrors 2>&1 | tee -a ~/msys2_update.log
