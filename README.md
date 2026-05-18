# dotfiles

Personal configuration files for shell, editors, git, and programming environments.

## list

### shell utils

- https://ghostty.org
- https://github.com/tmux/tmux
- https://yazi-rs.github.io/
- https://starship.rs/
- https://github.com/junegunn/fzf

### editors

- https://neovim.io/
- https://astronvim.com/
- https://github.com/JetBrains/ideavim
- https://typora.io/

### develop

- [Docker Desktop](https://www.docker.com/)
- [nvm](https://github.com/nvm-sh/nvm)
- [GraalVM](https://www.graalvm.org)
- [maven](https://maven.apache.org)
- [Jetbrains Toolbox App](https://www.jetbrains.com/zh-cn/toolbox-app/) and some IDE
- [Flutter](https://docs.flutter.dev) (not include platform specific dependencies)

### git

- https://git-scm.com/
- https://github.com/jesseduffield/lazygit

### colorschema

- https://github.com/folke/tokyonight.nvim

### other

- Nerd Font JetBrainsMono Nerd Font
- Chinese Font https://github.com/subframe7536/maple-font

## commands backup

It's only a backup for myself, please do not execute the following command directly.

```shell
ln -s $(pwd)/zshrc $HOME/.zshrc

export XDG_CONFIG_HOME="$HOME/.config"
mkdir -p "$XDG_CONFIG_HOME"


#------------- shell -------------
ln -s $(pwd)/yazi $XDG_CONFIG_HOME/yazi
ln -s $(pwd)/starship.toml $XDG_CONFIG_HOME/starship.toml
ln -s $(pwd)/wezterm $XDG_CONFIG_HOME/wezterm
mkdir -p "$XDG_CONFIG_HOME/tmux" && ln -s $(pwd)/tmux.conf $XDG_CONFIG_HOME/tmux/tmux.conf


#------------ editors ------------
mkdir -p "$XDG_CONFIG_HOME/nvim" && ln -s $(pwd)/nvim $XDG_CONFIG_HOME/nvim

ln -s $(pwd)/vimrc $HOME/.vimrc
ln -s $(pwd)/ideavimrc $HOME/.ideavimrc


#-------------- git --------------
ln -s $(pwd)/gitconfig $HOME/.gitconfig
ln -s $(pwd)/gitignore_global $HOME/.gitignore_global

mkdir -p "$XDG_CONFIG_HOME/lazygit/" && ln -s $(pwd)/lazygit_config.yml $XDG_CONFIG_HOME/lazygit/config.yml


#----------- languages -----------
mkdir -p "$HOME/.m2/" && ln -s $(pwd)/lang/java/settings.xml $HOME/.m2/settings.xml

ln -s $(pwd)/npmrc $HOME/.npmrc

mkdir -p "$XDG_CONFIG_HOME/.pip/" && ln -s $(pwd)/lang/python/pip.conf $HOME/.config/pip/pip.conf


#----------- others -----------
softwareupdate --install-rosetta
```
