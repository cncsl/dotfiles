# dotfiles

```
ln -s `pwd`/zshrc $HOME/.zshrc

mkdir -p $HOME/.config/tmux/
ln -s `pwd`/tmux.conf $HOME/.config/tmux/tmux.conf

# editors
mkdir -p $HOME/.config/nvim/
ln -s `pwd`/nvim $HOME/.config/nvim

ln -s `pwd`/vimrc $HOME/.vimrc
ln -s `pwd`/ideavimrc $HOME/.ideavimrc

# git
ln -s `pwd`/gitconfig $HOME/.gitconfig
ln -s `pwd`/gitignore_global $HOME/.gitignore_global

mkdir -p $XDG_CONFIG_HOME/lazygit/
ln -s `pwd`/lazygit_config.yml $XDG_CONFIG_HOME/lazygit/config.yml

# languages
ln -s `pwd`/npmrc $HOME/.npmrc
mkdir -p $HOME/.pip/
ln -s `pwd`/lang/python/pip.conf $HOME/.config/pip/pip.conf
mkdir -p $HOME/.gitconfig/gem/
ln -s `pwd`/lang/ruby/gemrc $HOME/.config/gemrc

```
