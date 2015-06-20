#!/bin/sh

echo stat /
stat /
echo stat /dev
stat /dev
echo stat /dev/fd
stat /dev/fd
echo stat /proc
stat /proc
echo stat /proc/self
stat /proc/self
echo stat /proc/self/fd
stat /proc/self/fd
echo stat /proc/self/fd/*
stat /proc/self/fd/*

echo ls -lR /dev
ls -lR /dev

echo ls -lR /proc/self
ls -lR /proc/self

echo ls -lR /proc/self/
ls -lR /proc/self/

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
