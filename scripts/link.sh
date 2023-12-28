#!/bin/bash
input="./linkingList"
cursordir="./cursors"

while IFS= read -r line
do
  first=$(echo $line | awk '{print $1}')
  second=$(echo $line | awk '{print $2}')
  echo "Linking $first to $second..."

  cd $cursordir
  if [ ! -f $second ]; then
    ln -s $first $second
  fi
  cd ..
done < "$input"