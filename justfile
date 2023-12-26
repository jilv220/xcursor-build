# Learn how to use justfile from pop-os/launcher!
# https://github.com/pop-os/launcher/blob/master/justfile

cursor_theme_name := 'kasane-teto-cursor'

basedir := ''
builddir := basedir / 'build'
assetsdir := basedir / 'assets'
pngdir := assetsdir / 'png'

local-install-dir := '~/.icons' 

create-cursors:
    scripts/create_cursors.sh {{pngdir}}

build:
    rm -r .{{builddir}}/*
    just create-cursors
    scripts/build.sh {{builddir}}/{{cursor_theme_name}}

install-local:
    mkdir -p {{local-install-dir}}
    cp -r ./build/{{cursor_theme_name}} {{local-install-dir}}

batch-convert:
    scripts/batch_convert.sh

remove-cur:
    rm *.cur

remove-ani:
    rm *.ani