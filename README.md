# Dotfiles

Configuration for things.

## Stow

I use `stow` to symlink configs. This repo should be in a direct subfolder of `~` like
`~/.dotfiles`. Then, from `~/.dotfiles`. I can run `stow nvim`.

Just a reminder to myself how this works: `stow` would symlink `~/.config` to
`~/.dotfiles/nvim/.config`. If `~/.config` already exists as a directory, it will instead
symlink `~/.config/nvim` to `~/.dotfiles/nvim/.config/nvim`. If stow already created a
symlink `~/.config` for another source, it will replace that symlink with a directory by
the same name and symlink the contents instead.


## Neovim

```sh
stow nvim
```

### pyenv
Neovim is configured to use a dedicated python virtual environment. Since I am using `pyenv`,
this should be installed. I also use `poetry` for dependency management.

Currently, on Manjaro, I have system python 3.10.1 and I created the `nvim` pyenv with it:
```sh
pyenv virtualenv system nvim
pyenv local nvim
```

To setup the python dependencies for neovim, cd into `~/.config/nvim`. Then:
```sh
# install dependencies - use pinned versions from lock file (or create one)
poetry install --no-root

# install dependencies - update to newest matching versions
poery update
```
