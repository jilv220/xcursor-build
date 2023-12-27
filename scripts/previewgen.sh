#!/bin/bash

counter=0
row_counter=0
col=6

if [ -f "preview.png" ]; then
  rm preview.png
fi

for f in $(find ./assets/png/**/32/*.png)
do
  if [ $counter -eq $col ]; then
    let row_counter++
    let counter=0
  fi
  
  if [ ! -f "row$row_counter.png" ]; then
    cp $f "row$row_counter.png"
  else
    convert +append "row$row_counter.png" $f "row$row_counter.png"
  fi

  let counter++
done

convert -append row*.png preview.png
rm row*.png