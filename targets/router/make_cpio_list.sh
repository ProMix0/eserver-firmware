#!/bin/sh

# this script is a workaround to avoid creating /dev/console node cause it requires root
# first argument must be romfs directory which will be parsed to produce cpio list
# kernel will assemble cpio archive from this list through usr/gen_init_cpio

test -n "$1" && cd "$1" || {
	echo "Can't cd to $1" >&2
	exit 1
}

find . -type d -printf 'dir /%P %m 0 0\n'
find . -type f -printf 'file /%P '`pwd`'/%P %m 0 0\n'
find . -type l -printf 'slink /%P ' -exec readlink -n {} \; -printf ' %m 0 0\n'
echo 'nod /dev/console 0600 0 0 c 5 1'

