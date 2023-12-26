#!/bin/bash

for f in $(find .. -name 'teto_*.ani')
do
  echo "Processing $f file..."
  python ~/Scripts/ani2ico.py $f
done