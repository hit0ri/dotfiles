# Dotfiles

## Bootstrap

```sh
curl https://mise.run | sh
export PATH="$HOME/.local/bin:$PATH"
mise use -g chezmoi@latest
chezmoi init -a git@github.com:hit0ri/dotfiles.git
mise trust
mise bootstrap -y
```

## Update zsh plugins

`chezmoi apply` updates the plugins every 7 days. To force update run:

```sh
chezmoi apply -R ~/.local/share/zsh/plugins
```
