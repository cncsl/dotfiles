# dotfiles

Personal configuration files for shell, editors, git, and programming environments.

## Shell & CLI

- [Ghostty](https://ghostty.org)
- [tmux](https://github.com/tmux/tmux)
- [yazi](https://yazi-rs.github.io)
- [starship](https://starship.rs)
- [fzf](https://github.com/junegunn/fzf)

## Editors

- [Neovim](https://neovim.io)
- [Astronvim](https://astronvim.com)
- [ideavim](https://github.com/JetBrains/ideavim)
- [Typora](https://typora.io/) (for Markdown)

## Development

- [Docker Desktop](https://www.docker.com)
- [nvm](https://github.com/nvm-sh/nvm)
- [sdkman](https://sdkman.io)
- [maven](https://maven.apache.org)
- [JetBrains Toolbox](https://www.jetbrains.com/zh-cn/toolbox-app/) and some IDEs
- [Flutter](https://docs.flutter.dev)

## Git

- [Git](https://git-scm.com)
- [Lazygit](https://github.com/jesseduffield/lazygit)

## Fonts

- JetBrainsMono Nerd Font
- [Maple Font](https://github.com/subframe7536/maple-font) (for Chinese Characters)

## macOS

### [Karabiner-Elements](https://karabiner-elements.pqrs.org)

- hold `caps_lock` → `Hyper` (`<ctrl-cmd-option>`, `Shift` is reserved for uppercase bindings)
- `<Hyper-h>` = `←` (left arrow, and `j`, `k`, `l` for up, down, right)

### [Hammerspoon](http://www.hammerspoon.org)
> Inspired by [awesome-hammerspoon](https://github.com/ashfinal/awesome-hammerspoon)
- `<Hyper-w>`: window management
- `<Hyper-s>`: system control
- `<Hyper-o>`: application launcher
 
## Theme

- [tokyonight](https://github.com/folke/tokyonight.nvim)

## Setup

> These commands are kept as a reference for setting up a new machine.
> Do not execute them blindly. Adjust paths and existing files according to the local environment.

```shell
ln -s $(pwd)/zshrc $HOME/.zshrc

export XDG_CONFIG_HOME="$HOME/.config"
mkdir -p "$XDG_CONFIG_HOME"


#------------- shell -------------
ln -s $(pwd)/yazi $XDG_CONFIG_HOME/yazi
ln -s $(pwd)/starship.toml $XDG_CONFIG_HOME/starship.toml
ln -s $(pwd)/ghostty $XDG_CONFIG_HOME
mkdir -p "$XDG_CONFIG_HOME/tmux" && ln -s $(pwd)/tmux.conf $XDG_CONFIG_HOME/tmux/tmux.conf


#------------ editors ------------
ln -s $(pwd)/nvim $XDG_CONFIG_HOME

ln -s $(pwd)/ideavimrc $HOME/.ideavimrc


#-------------- git --------------
ln -s $(pwd)/gitconfig $HOME/.gitconfig
ln -s $(pwd)/gitignore_global $HOME/.gitignore_global

mkdir -p "$XDG_CONFIG_HOME/lazygit" && ln -s $(pwd)/lazygit_config.yml $XDG_CONFIG_HOME/lazygit/config.yml


#----------- languages -----------
mkdir -p "$HOME/.m2" && ln -s $(pwd)/lang/java/settings.xml $HOME/.m2/settings.xml
mkdir -p "$HOME/.sdkman/etc" && ln -s $(pwd)/lang/java/sdkman_config $HOME/.sdkman/etc/config

ln -s $(pwd)/lang/node/npmrc $HOME/.npmrc

mkdir -p "$XDG_CONFIG_HOME/pip" && ln -s $(pwd)/lang/python/pip.conf $XDG_CONFIG_HOME/pip/pip.conf


#----------- others -----------
ln -s $(pwd)/hammerspoon $HOME/.hammerspoon
ln -s $(pwd)/karabiner $XDG_CONFIG_HOME
```
