#!/bin/sh
echo pacman -Sy | tee -a ~/msys2_update.log
pacman -Sy | tee -a ~/msys2_update.log
echo pacman -S --needed --noconfirm msys2-runtime pacman | tee -a ~/msys2_update.log
pacman -S --needed --noconfirm msys2-runtime pacman | tee -a ~/msys2_update.log
