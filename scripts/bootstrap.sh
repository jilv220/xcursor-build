#!/bin/bash
input="./cursorList"

create_config() {
  local path=$1
  local config_path="$path/config"
  touch $config_path

  cat <<EOF > $config_path
delay 250
size-32 0 0
size-48 0 0
size-64 0 0
EOF
}

cat <<-EOF > index.theme
[Icon Theme]
Name = $1
Comment = Put your own comment here...
EOF

mkdir -p build
mkdir -p cursors

mkdir -p assets/png
while IFS= read -r line
do
  mkdir -p assets/png/$line/24
  mkdir -p assets/png/$line/32
  mkdir -p assets/png/$line/48
  mkdir -p assets/png/$line/64

  create_config assets/png/$line
done < $input