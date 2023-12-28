# Learn how to use justfile from pop-os/launcher!
# https://github.com/pop-os/launcher/blob/master/justfile

cursor_theme_name := 'kasane-teto-cursors'

# Config directory here
basedir := ''
builddir := basedir / 'build'
assetsdir := basedir / 'assets'
pngdir := assetsdir / 'png'

local-install-dir := '~/.icons' 

bootstrap:
    scripts/bootstrap.sh {{cursor_theme_name}}

create-cursors:
    rm -rf ./assets/png/**/*.cursor
    scripts/create_cursors.sh {{pngdir}}

link:
    scripts/link.sh

previewgen:
    scripts/previewgen.sh

build:
    rm -rf .{{builddir}}/*
    rm -f ./cursors/*
    just create-cursors
    just link
    just previewgen
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