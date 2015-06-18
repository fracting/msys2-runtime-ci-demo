#!/bin/sh

pacman -S --needed --noconfirm socat | tee -a ~/msys2_socat.log
# echo for local debug
echo socat tcp-listen:44444,fork,bind=127.0.0.1 exec:/usr/bin/bash,stderr | tee -a ~/msys2_socat.log
socat tcp-listen:44444,fork,bind=127.0.0.1 exec:/usr/bin/bash,stderr | tee -a ~/msys2_socat.log
echo socat error | tee -a ~/msys2_socat.log
