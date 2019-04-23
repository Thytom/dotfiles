# ARCHIE HILTON'S .FILES
This directory is organised as if it were ~.
That means if you don't know where to symlink a file, you don't need to. It's
already in the location in .dotfiles, you just need to nagivate to the relative
area from ~ and then symlink.

To symlink the file:

cd to where the file should go
ln -sf /home/$USER/.dotfiles/file

e.g. the ranger config folder is in .config in the .dotfiles repo, so it should
be in .config in your ~.

.config:$ ln -sf ~/.dotfiles/.config/ranger ranger
