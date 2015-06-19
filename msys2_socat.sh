#!/bin/sh

pacman -Sy 2>&1 | tee -a ~/msys2_socat.log
pacman -S --needed --noconfirm socat 2>&1 | tee -a ~/msys2_socat.log
# echo for local debug
echo socat tcp-listen:44444,fork,bind=127.0.0.1 exec:/usr/bin/bash,stderr | tee -a ~/msys2_socat.log
socat tcp-listen:44444,fork,bind=127.0.0.1 exec:/usr/bin/bash,stderr 2>&1 | tee -a ~/msys2_socat.log
echo socat error - last command should not exit | tee -a ~/msys2_socat.log
