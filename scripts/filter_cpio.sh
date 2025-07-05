#!/bin/bash

FILTER_STRING=

for arg in "$@"; do
  case $arg in
    no-static)
      FILTER_STRING="$FILTER_STRING | awk '\$2!~/^\/lib\/.*\.[ao]$/'"
      ;;
    no-include)
      FILTER_STRING="$FILTER_STRING | awk '\$2!~/^\/include/'"
      ;;
    *)
      echo "Unsupported argument '$arg'" >&2
      exit 1
  esac
done

eval "cat /dev/stdin $FILTER_STRING"


