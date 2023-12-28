#!/bin/bash

args=$@
path="$(pwd)$@"
cursors_path="$(pwd)/cursors"

append_32() {
  local delay="250"
  local hotx="2"
  local hoty="4"

  for f in $(ls $1)
  do
    echo "Appending $f..."

    if [ -f $2 ]; then
      while IFS= read -r line
      do
        local first=$(echo $line | awk '{print $1}')
        local second=$(echo $line | awk '{print $2}')
        if [ $first = "delay" ]; then
          delay=$second
        elif [ $first = "size-32"  ]; then
          local third=$(echo $line | awk '{print $3}')
          hotx=$second
          hoty=$third
        fi
      done < $2
    fi

    echo "32 $hotx $hoty $f $delay" >> $cursor_file_path
  done
}

for f in $(ls $path)
do
  cursor_file_path="$path/$f/$f.cursor"
  path_32="$path/$f/32"
  path_config="$path/$f/config"
  post_rmed=${cursor_file_path%.cursor}
  
  echo "Making cursor $f..."
  append_32 $path_32 $path_config
  xcursorgen -p $path_32 $cursor_file_path $post_rmed

  cp $post_rmed $cursors_path  
done