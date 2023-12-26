#!/bin/bash

first=$1
path="$(pwd)$1"

if [ ! -d $path ]; then
  mkdir $path
fi

cp "$(pwd)/index.theme" $path
cp -r "$(pwd)/cursors" $path