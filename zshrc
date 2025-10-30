#---------- zinit ----------
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit


#---------- zsh plugin ----------
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions

#---------- zsh ----------
setopt auto_cd 
setopt long_list_jobs
setopt interactivecomments
# use editor to edit long command
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line

#---------- zsh completion ----------
setopt auto_menu
setopt complete_in_word
setopt always_to_end
autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' special-dirs true
if [[ -n "${terminfo[kcbt]}" ]]; then
  bindkey -M emacs "${terminfo[kcbt]}" reverse-menu-complete
  bindkey -M viins "${terminfo[kcbt]}" reverse-menu-complete
  bindkey -M vicmd "${terminfo[kcbt]}" reverse-menu-complete
fi

#---------- zsh history ----------
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt share_history

# fuzzy find history forward
autoload -U up-line-or-beginning-search
zle -N up-line-or-beginning-search
bindkey -M emacs "^[[A" up-line-or-beginning-search
bindkey -M viins "^[[A" up-line-or-beginning-search
bindkey -M vicmd "^[[A" up-line-or-beginning-search
if [[ -n "${terminfo[kcuu1]}" ]]; then
  bindkey -M emacs "${terminfo[kcuu1]}" up-line-or-beginning-search
  bindkey -M viins "${terminfo[kcuu1]}" up-line-or-beginning-search
  bindkey -M vicmd "${terminfo[kcuu1]}" up-line-or-beginning-search
fi

# fuzzy find history backward
autoload -U down-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey -M emacs "^[[B" down-line-or-beginning-search
bindkey -M viins "^[[B" down-line-or-beginning-search
bindkey -M vicmd "^[[B" down-line-or-beginning-search
if [[ -n "${terminfo[kcud1]}" ]]; then
  bindkey -M emacs "${terminfo[kcud1]}" down-line-or-beginning-search
  bindkey -M viins "${terminfo[kcud1]}" down-line-or-beginning-search
  bindkey -M vicmd "${terminfo[kcud1]}" down-line-or-beginning-search
fi


#---------- alias ----------
alias ls='ls -G'
alias lsa='ls -lah'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'

alias grep='grep --color=auto'


#---------- fzf ----------
export FZF_DEFAULT_OPTS=" --highlight-line \
  --info=inline-right \
  --ansi \
  --layout=reverse \
  --border=none \
  --color=bg+:#2e3c64 \
  --color=bg:#1f2335 \
  --color=border:#29a4bd \
  --color=fg:#c0caf5 \
  --color=gutter:#1f2335 \
  --color=header:#ff9e64 \
  --color=hl+:#2ac3de \
  --color=hl:#2ac3de \
  --color=info:#545c7e \
  --color=marker:#ff007c \
  --color=pointer:#ff007c \
  --color=prompt:#2ac3de \
  --color=query:#c0caf5:regular \
  --color=scrollbar:#29a4bd \
  --color=separator:#ff9e64 \
  --color=spinner:#ff007c \
"
export FZF_CTRL_T_OPTS="--preview 'fzf-preview.sh {}'"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
source <(fzf --zsh)


#---------- yazi ----------
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}


#---------- Shell Utils ----------
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"


#---------- custom ----------
export XDG_CONFIG_HOME="$HOME/.config"
export LANG=en_US.UTF-8
export EDITOR='nvim'


#---------- Homebrew ----------
eval "$(brew shellenv)"
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.ustc.edu.cn/brew.git" 
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.ustc.edu.cn/homebrew-core.git"
export HOMEBREW_API_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles/api"


export WORKSPACE_VOLUMES="/Volumes/workspace"
export MY_WORKSPACE="$WORKSPACE_VOLUMES/cncsl"

#--------- nvm ----------
export NVM_DIR="$HOME/.config/nvm"
if [ -d "$NVM_DIR" ]; then
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
else
  echo "nvm is not installed yet"
fi


#---------- Java ----------
if [ -d "$WORKSPACE_VOLUMES/develop/Java/graalvm-jdk-17.0.12+8.1/Contents/Home" ]; then
  export JAVA_HOME="$WORKSPACE_VOLUMES/develop/Java/graalvm-jdk-17.0.12+8.1/Contents/Home"
  export PATH="$JAVA_HOME/bin:$PATH"
else
  echo "JDK is not installed yet"
fi
if [ -d "$WORKSPACE_VOLUMES/develop/Java/apache-maven-3.9.11" ]; then
  export PATH="$WORKSPACE_VOLUMES/develop/Java/apache-maven-3.9.11/bin:$PATH"
else
  echo "maven is not installed yet"
fi


#---------- Flutter ----------
export FLUTTER_HOME="$WORKSPACE_VOLUMES/develop/flutter"
if [ -d "$FLUTTER_HOME" ]; then
  export PATH="$FLUTTER_HOME/bin:$PATH"
  export PUB_HOSTED_URL=https://mirrors.tuna.tsinghua.edu.cn/dart-pub;
  export FLUTTER_STORAGE_BASE_URL=https://mirrors.tuna.tsinghua.edu.cn/flutter
else
  echo "Flutter is not installed yet"
fi

#---------- docker ----------
if command -v docker >/dev/null 2>&1; then
  fpath=("$HOME/.docker/completions" $fpath)
  autoload -Uz compinit && compinit
else
  echo "docker server is not installed yet"
fi


#---------- MySql-clinet ----------
export PATH="/usr/local/opt/mysql-client/bin:$PATH"


# 工作
if [ -e "$WORKSPACE_VOLUMES/work/config/.zshrc_work" ]; then
  source "$WORKSPACE_VOLUMES/work/config/.zshrc_work"
fi
