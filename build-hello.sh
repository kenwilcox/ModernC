#!/bin/sh

exename="hello"
archname=${1:-amd64} # if not specified, default to amd64

# if flags.sh exists in the arch folder, source it
if [ -e $archname/flags.sh ]; then
    . $archname/flags.sh
fi

clang -std=c89 -pedantic -s -O2 -Wall -Werror \
    -nostdlib \
    -fno-unwind-tables \
    -fno-asynchronous-unwind-tables \
    -fdata-sections \
    -Wl,--gc-sections \
    -Wa,--noexecstack \
    -fno-builtin \
    -fno-stack-protector \
    $COMPILER_FLAGS \
    $archname/start.S $archname/main.c \
    -o $exename \
\
&& strip -R .comment $exename