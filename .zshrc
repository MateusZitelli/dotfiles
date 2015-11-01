source $HOME/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle command-not-found
antigen bundle vi-mode
export KEYTIMEOUT=1
antigen bundle npm
antigen bundle nvm
antigen bundle gnu-utils
antigen bundle cp
antigen bundle python
antigen bundle node
antigen bundle ssh-agent

# Completion configs
antigen bundle zsh-users/zsh-completions src
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
zmodload zsh/terminfo

# External navigation plugin
antigen bundle rupa/z

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme agnoster

# Tell antigen that you're done.
antigen apply

# Keybindings {
# For normal mode
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# For vim mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
# Store the command for later 
bindkey -M vicmd "q" push-line-or-edit

# Who doesn't want home and end to work?
bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line

# Ensure that arrow keys work as they should
bindkey '\e[A' up-line-or-history
bindkey '\e[B' down-line-or-history

bindkey '\eOA' up-line-or-history
bindkey '\eOB' down-line-or-history

bindkey '\e[C' forward-char
bindkey '\e[D' backward-char

bindkey '\eOC' forward-char
bindkey '\eOD' backward-char

bindkey -M viins 'jj' vi-cmd-mode
bindkey -M vicmd 'u' undo

# Rebind the delete key. Again, useless.
bindkey '\e[3~' delete-char

# it's like, space AND completion.  Gnarlbot.
bindkey -M viins ' ' magic-space
#}


#{{{ History Stuff

# Remember about a years worth of history (AWESOME)
SAVEHIST=10000
HISTSIZE=10000

# Don't overwrite, append!
setopt APPEND_HISTORY

# Write after each command
# setopt INC_APPEND_HISTORY

# Killer: share history between multiple shells
setopt SHARE_HISTORY

# If I type cd and then cd again, only save the last one
setopt HIST_IGNORE_DUPS

# Even if there are commands inbetween commands that are the same, still only save the last one
setopt HIST_IGNORE_ALL_DUPS

# Pretty    Obvious.  Right?
setopt HIST_REDUCE_BLANKS

# If a line starts with a space, don't save it.
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE

# When using a hist thing, make a newline show the change before executing it.
setopt HIST_VERIFY

# Save the time and how long a command ran
setopt EXTENDED_HISTORY

setopt HIST_SAVE_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS

#}}}

server () {
    local port="${1:-8000}"
    python3 -m "http.server" "$port"
}

# Set Path
export PATH="$HOME/.gem/ruby/2.2.0/bin:$PATH"
export PATH="/usr/local/heroku/bin:$PATH"

# Caffe
export LD_LIBRARY_PATH=/home/mateus/local/caffe/distribute/lib/:$LD_LIBRARY_PATH

# Android
export ANDROID_SDK_HOME=/home/mateus/Android/Sdk


# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
