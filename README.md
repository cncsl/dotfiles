# dotfiles

Personal configuration files for shell, editors, git, and programming environments.

## commands

It's only a backup for myself, please do not execute the following command directly.

```shell
ln -s $(pwd)/zshrc $HOME/.zshrc

#------------- shell -------------
ln -s $(pwd)/yazi $HOME/.config/yazi
ln -s $(pwd)/starship.toml $HOME/.config/starship.toml
mkdir -p $HOME/.config
ln -s $(pwd)/wezterm $HOME/.config/wezterm

#------------ editors ------------
mkdir -p $HOME/.config/nvim/
ln -s $(pwd)/nvim $HOME/.config/nvim

ln -s $(pwd)/vimrc $HOME/.vimrc
ln -s $(pwd)/ideavimrc $HOME/.ideavimrc

#-------------- git --------------
ln -s $(pwd)/gitconfig $HOME/.gitconfig
ln -s $(pwd)/gitignore_global $HOME/.gitignore_global

mkdir -p $XDG_CONFIG_HOME/lazygit/
ln -s $(pwd)/lazygit_config.yml $XDG_CONFIG_HOME/lazygit/config.yml

#----------- languages -----------
mkdir -p $HOME/.m2/
ln -s $(pwd)/lang/java/settings.xml $HOME/.m2/settings.xml

ln -s $(pwd)/npmrc $HOME/.npmrc

mkdir -p $HOME/.pip/
ln -s $(pwd)/lang/python/pip.conf $HOME/.config/pip/pip.conf

mkdir -p $HOME/.config/gem/
ln -s $(pwd)/lang/ruby/gemrc $HOME/.config/gemrc

```

## shell utils

- https://wezterm.org/
- https://github.com/ohmyzsh/ohmyzsh
- https://yazi-rs.github.io/
- https://starship.rs/
- https://github.com/junegunn/fzf

## editors

- https://neovim.io/
- https://astronvim.com/
- https://github.com/JetBrains/ideavim

## Git

- https://git-scm.com/
- https://github.com/jesseduffield/lazygit

## colorschema

- https://github.com/folke/tokyonight.nvim
