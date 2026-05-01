#!/bin/sh

if cmp --quiet "$1" "$2"; then
	rm "$1"
else
	mv "$1" "$2"
fi

