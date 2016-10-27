# Dotfiles
A collection of my dotfiles for Linux machines.  You may find this as a good starting point for your own configurations.  I'm most comfortable with a Debian distribution of linux, so the deploy script is best tested with that.  That said, it makes use of pretty basic Linux stuff so I'm sure if anything goes wrong, it won't be hard to fix.  This does seem to work with OSX, but you'll want to make sure you've got a few other dependencies that I've listed below.

## Linux Dependencies
The deploy script uses git, curl and vim to do the bulk of the work.  You'll want those tools installed.

Of course, if you wanna start pulling my i3wm configs (at the time of this writing, those are a work in progress).

## OSX Dependencies
I've got homebrew installed on my Macbook, you'll likely want that.  This is the 21st century after all, you should have a package manager.  I installed macvim, since it provides (at the time of this writing) a newer version of vim and supports [YouCompleteMe](https://github.com/Valloric/YouCompleteMe/issues).

## The Deploy Script
The deploy script just checks for your platform (since I'll wanna make sure I'm using macvim for the vim steps) and then creates a symbolic link between the dotfiles and your home directory.  The script isn't my work though (just added platform detection so OSX wouldn't break on me), so [I won't take credit for that](https://github.com/odcinek/dotfiles).
