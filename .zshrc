# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

# Alias
source $HOME/.config/zsh/aliases

# 
export TERM=kitty

export NEMU_HOME=/home/frind/Code/ics2020/nemu
export AM_HOME=/home/frind/Code/ics2020/abstract-machine

# History
setopt HIST_FIND_NO_DUPS
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_space      # ignore commands that start with space

# beeps
unsetopt BEEP
setopt notify              # report the status of background jobs immediately
setopt numericglobsort     # sort filenames numerically when it makes sense
setopt magicequalsubst     # enable filename expansion for arguments of the form ‘anything=expression’

# CommandLine Utilities
eval "$(zoxide init zsh)"
eval $(thefuck --alias)

# Keybindings
bindkey -e
setopt extendedglob 		# Keybindings to help edit
#WORDCHARS='*?_[]\|~&;!'\''#$%^(){}<>'
bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search
#bindkey '^-' undo 		# ctrl + bar

bindkey -s '^o' 'nvim $(fzf)^M'
