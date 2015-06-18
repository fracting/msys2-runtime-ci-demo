#!/bin/sh

pacman -S --needed --noconfirm socat
# echo for local debug
echo socat tcp-listen:44444,fork,bind=127.0.0.1 exec:/usr/bin/bash,stderr
socat tcp-listen:44444,fork,bind=127.0.0.1 exec:/usr/bin/bash,stderr
