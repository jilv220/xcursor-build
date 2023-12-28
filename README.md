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
3. Put the name of your cursor theme under `justfile`
```
cursor_theme_name := 'default'
```
4. Under `assets/png/<cursor-name>`, you will find four sizes `24`, `32`, `48` and `64`
5. Drop the `.png` assets into their corresponding folder
6. Config the cursor through editing `config` file under every `/assets/png/<cursor-name>` <br>
`config` has the following format
```
delay 250           # animation delay
size-24 0 0         # the coordinates of cursor tip 
size-32 0 0
size-48 0 0
size-64 0 0
```
7. Config `index.theme`
```
[Icon Theme]        
Name = default     
Comment = Put your own comment here...
Example = default #optional 
Inherits = <the old cursor theme> #optional
```
8. Run `just build` to build the package
9. Run `just install-local` to install locally into `~/.icons`
10. Zip and publish your cursor theme to `gnome-look`, or package it manually into corresponding distro's package format

## Some Term Differences 
| Cursor Name | CSS Cursor Name |
| ----------- | ----------- |
| link/pointer | pointer |
| left_ptr_watch | progress |
| plus | cell |
| link/alias | alias |
| fleur | move |
| openhand | grab |
| closedhand | grabbing |
| fleur | all-scroll |

For more details, please consult 
[MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/cursor#examples).

## Acknowledgement
[Arch Wiki](https://wiki.archlinux.org/title/Cursor_themes)<br>
[Dracula Gtk Theme](https://github.com/dracula/gtk/tree/master)<br>
[Pop!_OS launcher](https://github.com/pop-os/launcher)<br>