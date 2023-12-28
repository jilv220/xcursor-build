# Xcursor-Build

## Dependencies
```
just 
xcursorgen
imagemagick(convert)
```

## Usage
1. Clone the repo
2. Run `just boostrap` to bootstrap the project
3. Under `assets/png/<cursor-name>`, you will find four sizes `24`, `32`, `48` and `64`
4. Drop the `.png` assets into their corresponding folder
5. Config the cursor through editing `config` file under every `/assets/png/<cursor-name>` <br>
`config` has the following format
```
delay 250           # animation delay
size-24 0 0         # the coordinates of cursor tip 
size-32 0 0
size-48 0 0
size-64 0 0
```
6. Config `index.theme`
```
[Icon Theme]        
Name = default     
Comment = Put your own comment here...
Example = default #optional 
Inherits = <the old cursor theme> #optional
```
7. Run `just build` to build the package
8. Run `just install-local` to install locally into `~/.icons`
9. Zip and publish your cursor theme to `gnome-look`, or package it manually into corresponding distro's package format

## Wiki

## Acknowledgement
[Arch Wiki](https://wiki.archlinux.org/title/Cursor_themes)<br>
[Dracula Gtk Theme](https://github.com/dracula/gtk/tree/master)<br>
[Pop!_OS launcher](https://github.com/pop-os/launcher)<br>