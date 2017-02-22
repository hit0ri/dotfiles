dotfiles
========
> managed by GNU Stow

## Usage
```sh
$ cd dotfiles
$ stow -v zsh mpv…
```

### neovim
- install vim-plug
```sh
$ mkdir -p ~/.config/nvim \
    && curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
    && stow -v neovim \
    && nvim +PlugInstall +qall
```
