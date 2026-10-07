# Dotfiles

## Bootstrap

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"
curl https://mise.run | sh
export PATH="$HOME/.local/bin:$PATH"
mise use -g chezmoi@latest
chezmoi init -a git@github.com:hit0ri/dotfiles.git
brew bundle -g
mise trust
mise install
```

## Update zsh plugins

`chezmoi apply` updates the plugins every 7 days. To force update run:

```sh
chezmoi apply -R ~/.local/share/zsh/plugins
```
