#!/bin/bash

args=$@
path="$(pwd)$@"
cursors_path="$(pwd)/cursors"

append() {
  local delay="250"
  local hotx="0"
  local hoty="0"

  for f in $(ls $2)
  do
    echo "Appending $f..."

    if [ -f $3 ]; then
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
      done < $3
    fi

    echo "$1 $hotx $hoty $2/$f $delay" >> $cursor_file_path
  done
}

for f in $(ls $path)
do
  file_path="$path/$f"
  cursor_file_path="$file_path/$f.cursor"

  path_24="$path/$f/24"
  path_32="$path/$f/32"
  path_48="$path/$f/48"
  path_64="$path/$f/64"

  path_config="$path/$f/config"
  post_rmed=${cursor_file_path%.cursor}
  
  echo "Making cursor $f..."
  append "24" $path_24 $path_config
  append "32" $path_32 $path_config
  append "48" $path_48 $path_config
  append "64" $path_64 $path_config

  xcursorgen $cursor_file_path $post_rmed
  cp $post_rmed $cursors_path  
done