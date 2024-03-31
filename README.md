# Forked for personalization, config folder and packages installation

It adds support for a `config` folder.
This is a 'magic' folder name (you can add more to `folder_corresponding_structure`) to preserve deeper file structures.
For example, you could just add a `xdg` folder into `config`.

It also adds support to install packages as well, by adding files called `system_packages`, `node_packages` or `python_packages`.

Each corresponding installer will get called with a reduced list of packages.
For now the call for system packages is hardcoded to `sudo dnf install -y ...` for usage on fedora systems.
You'll likely want to replace all lines containing it, if you don't use `dnf`.

It generally installs: i3, zsh, neovim nightly, alacritty, python, git

You can delete stuff you don't need, it's mostly independent from each other.

I suggest to create a local branch for your personal-machine use case. That's what I do on every machine using it.

## [holman](https://github.com/holman/dotfiles) does dotfiles

Your dotfiles are how you personalize your system. These are mine.

I was a little tired of having long alias files and everything strewn about
(which is extremely common on other dotfiles projects, too). That led to this
project being much more topic-centric. I realized I could split a lot of things
up into the main areas I used (git, system libraries, and so on), so I
structured the project accordingly.

If you're interested in the philosophy behind why projects like these are
awesome, you might want to [read my post on the
subject](http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/).

## topical

Everything's built around topic areas. If you're adding a new area to your
forked dotfiles — say, "Java" — you can simply add a `java` directory and put
files in there. Anything with an extension of `.zsh` will get automatically
included into your shell. Anything with an extension of `.symlink` will get
symlinked without extension into `$HOME` when you run `script/bootstrap`.

## what's inside

A lot of stuff. Seriously, a lot of stuff. Check them out in the file browser
above and see what components may mesh up with you.
[Fork it](https://github.com/holman/dotfiles/fork), remove what you don't
use, and build on what you do use.

## components

There's a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **topic/\*.zsh**: Any files ending in `.zsh` get loaded into your
  environment.
- **topic/path.zsh**: Any file named `path.zsh` is loaded first and is
  expected to setup `$PATH` or similar.
- **topic/completion.zsh**: Any file named `completion.zsh` is loaded
  last and is expected to setup autocomplete.
- **topic/install.sh**: Any file named `install.sh` is executed when you run `script/install`. To avoid being loaded automatically, its extension is `.sh`, not `.zsh`.
- **topic/\*.symlink**: Any file ending in `*.symlink` gets symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `script/bootstrap`.
- **topic/{system,node,python}\_packages**: Will get installed when you run `script/install`.

## install

This repository is expected to be in `~/.dotfiles`.

Example one liner for fedora (only use it at fresh system installation, or do copy of your configs first):

```sh
git clone https://github.com/arminfro/dotfiles.git ~/.dotfiles && cd ~/.dotfiles/script && ./fedora  && ./bootstrap  && ./install && zsh
```

This will activate some repos and installs some packages.

It will symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`.

The main file you'll want to change right off the bat is `zsh/zshrc.symlink`,
which sets up a few paths and applications that'll be different on your particular machine.
