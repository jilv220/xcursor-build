#!/bin/bash

args=$@
path="$(pwd)$@"
cursors_path="$(pwd)/cursors"

append_32() {
  for f in $(ls $1)
  do
    echo "Appending $f..."
    echo "32 2 4 $f 250" >> $cursor_file_path
  done
}

for f in $(ls $path)
do
  cursor_file_path="$path/$f/$f.cursor"
  path_32="$path/$f/32"
  post_rmed=${cursor_file_path%.cursor}
  
  if [ ! -f $cursor_file_path ]; then 
    echo "Making cursor $f..."
    append_32 $path_32
  else
    echo "Cursor $f already exists. Skip..."
  fi

  xcursorgen -p $path_32 $cursor_file_path $post_rmed
  cp $post_rmed $cursors_path  
done