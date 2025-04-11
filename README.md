# dotfiles

Personal configuration files for shell, editors, git, and programming environments.

## commands

It's only a backup for myself, please do not execute the following command directly.

```shell
ln -s $(pwd)/zshrc $HOME/.zshrc

#------------- shell -------------
mkdir -p $HOME/.config/tmux/
ln -s $(pwd)/tmux.conf $HOME/.config/tmux/tmux.conf
ln -s $(pwd)/yazi $HOME/.config/yazi
ln -s $(pwd)/starship.toml $HOME/.config/starship.toml
mkdir -p $HOME/.config/atuin/
ln -s $(pwd)/atuin_config.toml $HOME/.config/atuin/config.toml

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

mkdir -p $HOME/.gitconfig/gem/
ln -s $(pwd)/lang/ruby/gemrc $HOME/.config/gemrc

```

## shell utils

- https://iterm2.com/
- https://github.com/ohmyzsh/ohmyzsh
- https://github.com/tmux/tmux
- https://yazi-rs.github.io/
- https://starship.rs/
- https://atuin.sh/

## editors

- https://neovim.io/
- https://astronvim.com/
- https://github.com/JetBrains/ideavim

## Git

- https://git-scm.com/
- https://github.com/jesseduffield/lazygit

## colorschema

- https://draculatheme.com/
