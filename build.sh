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

#for i in {0..80}; do echo timestamp:$i; sleep 60; done 2>&1 | tee -a build.log & # background
(for i in {0..80}; do echo timestamp:$i; sleep 60; done 2>&1 | tee -a build.log) & # background

echo $ pacman -Sy 2>&1 | tee -a build.log
pacman -Sy 2>&1 | tee -a build.log
echo $ pacman -S --needed --noconfirm --noprogressbar base-devel gcc 2>&1 | tee -a build.log
pacman -S --needed --noconfirm --noprogressbar base-devel gcc 2>&1 | tee -a build.log
echo $ makepkg -s --noconfirm --noprogressbar --skippgpcheck -f 2>&1 | tee -a build.log
(makepkg -s --noconfirm --noprogressbar --skippgpcheck -f; echo $? > ~/exit.number) 2>&1 | tee -a build.log

exit_code=$(cat ~/exit.number)
echo "exit code is $exit_code" 2>&1 | tee -a build.log

ls -lR 2>&1 | tee -a build.log # dummy command to flush output, workaround wineconsole limitation.

#clean up
echo wineboot --kill 2>&1 | tee -a build.log # kill background wineconsole and socat processes
wineboot --kill # kill background wineconsole and socat processes
