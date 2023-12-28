#!/bin/bash

first=$1
path="$(pwd)$1"

mkdir -p $path

cp "$(pwd)/index.theme" $path
cp "$(pwd)/preview.png" $path
cp -r "$(pwd)/cursors" $path