#!/bin/sh

echo stat / 2>&1 | tee -a ~/msys2_update.log
stat / 2>&1 | tee -a ~/msys2_update.log
echo stat /dev 2>&1 | tee -a ~/msys2_update.log
stat /dev 2>&1 | tee -a ~/msys2_update.log
echo stat /dev/fd 2>&1 | tee -a ~/msys2_update.log
stat /dev/fd 2>&1 | tee -a ~/msys2_update.log
echo stat /proc 2>&1 | tee -a ~/msys2_update.log
stat /proc 2>&1 | tee -a ~/msys2_update.log
echo stat /proc/self 2>&1 | tee -a ~/msys2_update.log
stat /proc/self 2>&1 | tee -a ~/msys2_update.log
echo stat /proc/self/fd 2>&1 | tee -a ~/msys2_update.log
stat /proc/self/fd 2>&1 | tee -a ~/msys2_update.log
echo stat /proc/self/fd/* 2>&1 | tee -a ~/msys2_update.log
stat /proc/self/fd/* 2>&1 | tee -a ~/msys2_update.log

echo ls -lR /dev 2>&1 | tee -a ~/msys2_update.log
ls -lR /dev 2>&1 | tee -a ~/msys2_update.log

echo ls -lR /proc/self 2>&1 | tee -a ~/msys2_update.log
ls -lR /proc/self 2>&1 | tee -a ~/msys2_update.log

echo ls -lR /proc/self/ 2>&1 | tee -a ~/msys2_update.log
ls -lR /proc/self/ 2>&1 | tee -a ~/msys2_update.log

echo rm -vf /dev/fd 2>&1 | tee -a ~/msys2_update.log
rm -vf /dev/fd 2>&1 | tee -a ~/msys2_update.log
echo ln -svf /proc/self/fd /dev/fd 2>&1 | tee -a ~/msys2_update.log
ln -svf /proc/self/fd /dev/fd 2>&1 | tee -a ~/msys2_update.log
echo stat /dev/fd 2>&1 | tee -a ~/msys2_update.log
stat /dev/fd 2>&1 | tee -a ~/msys2_update.log
echo stat /dev/fd/* 2>&1 | tee -a ~/msys2_update.log
stat /dev/fd/* 2>&1 | tee -a ~/msys2_update.log
rm -vf /dev/fd 2>&1 | tee -a ~/msys2_update.log
echo read ~/msys2_strace.log for stracing on ln 2>&1 | tee -a ~/msys2_update.log
strace -o ~/msys2_strace.log -f ln -svf /proc/self/fd /dev/fd


echo pacman -Sy
pacman -Sy 2>&1 | tee -a ~/msys2_update.log
echo pacman -S --needed --noconfirm msys2-runtime pacman
pacman -S --needed --noconfirm msys2-runtime pacman pacman-mirrors 2>&1 | tee -a ~/msys2_update.log
