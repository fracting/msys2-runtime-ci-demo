#!/bin/sh

# FIXME This is a very dirty and evil and wrong workaround, will cause unknown behavior, should fix wine bug instead.
echo FIXME This is a very dirty and evil and wrong workaround, will cause unknown behavior, should fix wine bug instead. 2>&1 | tee -a ~/msys2_workaround_bug403.log
rm -vf /dev/fd 2>&1 | tee -a ~/msys2_workaround_bug403.log
echo mkdir -v /dev/fd 2>&1 | tee -a ~/msys2_workaround_bug403.log
mkdir -v /dev/fd 2>&1 | tee -a ~/msys2_workaround_bug403.log
echo touch /dev/fd/62 2>&1 | tee -a ~/msys2_workaround_bug403.log
touch /dev/fd/62 2>&1 | tee -a ~/msys2_workaround_bug403.log
echo touch /dev/fd/63 2>&1 | tee -a ~/msys2_workaround_bug403.log
touch /dev/fd/63 2>&1 | tee -a ~/msys2_workaround_bug403.log


