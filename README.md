# Dotfiles

## Bootstrap

```sh
curl https://mise.run | sh
export PATH="$HOME/.local/bin:$PATH"
mise use -g chezmoi@latest
chezmoi init --apply git@github.com:hit0ri/dotfiles.git
mise trust
mise bootstrap --yes
```
