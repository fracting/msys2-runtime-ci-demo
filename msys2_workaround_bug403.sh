#!/bin/sh

# FIXME This is a very dirty and evil and wrong workaround, will cause unknown behavior, should fix wine bug instead.
echo FIXME This is a very dirty and evil and wrong workaround, will cause unknown behavior, should fix wine bug instead.
echo $ rm -vf /dev/fd
rm -vf /dev/fd
echo $ mkdir -v /dev/fd
mkdir -v /dev/fd
echo $ touch /dev/fd/62
touch /dev/fd/62
echo $ touch /dev/fd/63
touch /dev/fd/63


