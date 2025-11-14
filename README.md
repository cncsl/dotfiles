# dotfiles

Personal configuration files for shell, editors, git, and programming environments.

## list

### shell utils

- https://wezterm.org/
- https://github.com/ohmyzsh/ohmyzsh
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

- https://github.com/fastfetch-cli/fastfetch
- Nerd Font JetBrainsMono Nerd Font
- Chinese Font https://github.com/lxgw/LxgwNeoXiHei

## commands backup

It's only a backup for myself, please do not execute the following command directly.

```shell
ln -s $(pwd)/zshrc $HOME/.zshrc

mkdir -p $HOME/.config

#------------- shell -------------
ln -s $(pwd)/yazi $HOME/.config/yazi
ln -s $(pwd)/starship.toml $HOME/.config/starship.toml
ln -s $(pwd)/wezterm $HOME/.config/wezterm

#------------ editors ------------
mkdir -p $HOME/.config/nvim/
ln -s $(pwd)/nvim $HOME/.config/nvim

ln -s $(pwd)/vimrc $HOME/.vimrc
ln -s $(pwd)/ideavimrc $HOME/.ideavimrc

#-------------- git --------------
ln -s $(pwd)/gitconfig $HOME/.gitconfig
ln -s $(pwd)/gitignore_global $HOME/.gitignore_global

if [ -z "$XDG_CONFIG_HOME" ]; then
  mkdir -p "$HOME/Library/Application\ Support/lazygit/"
  ln -s $(pwd)/lazygit_config.yml "$HOME/Library/Application\ Support/lazygit/config.yml"
else
  mkdir -p "$XDG_CONFIG_HOME/lazygit/"
  ln -s $(pwd)/lazygit_config.yml $XDG_CONFIG_HOME/lazygit/config.yml
fi

#----------- languages -----------
mkdir -p "$HOME/.m2/"
ln -s $(pwd)/lang/java/settings.xml $HOME/.m2/settings.xml

ln -s $(pwd)/npmrc $HOME/.npmrc

mkdir -p "$HOME/.pip/"
ln -s $(pwd)/lang/python/pip.conf $HOME/.config/pip/pip.conf


#----------- others -----------
softwareupdate --install-rosetta
```
