# ----- ----- Config that include local variables ----- ----- #

. $HOME/.bin/func.d/*.zsh
. $HOME/.bin/func.sh
set-rust
set-brew
set-haskell

export PATH=$HOME/.bin:$HOME/.local/bin:$PATH

# User configuration
export EDITOR='nvim'

# Alias
source $HOME/.config/zsh/aliases

# ======================================================================== #
# Oh-my-zsh
# ======================================================================== #


# CASE_SENSITIVE="true"
# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# ======================================================================= #
# Common Utilities
# ======================================================================= #

# History
#HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
#HISTSIZE=10000
#SAVEHIST=10000
setopt HIST_FIND_NO_DUPS
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_space      # ignore commands that start with space
setopt histignorealldups sharehistory

setopt notify              # report the status of background jobs immediately
setopt numericglobsort     # sort filenames numerically when it makes sense
setopt magicequalsubst     # enable filename expansion for arguments of the form ‘anything=expression’

# CommandLine Utilities
eval "$(zoxide init zsh)"
#eval $(thefuck --alias)

# CommandLine Edit
WORDCHARS='*?_[]\|~&;!'\''#$%^(){}<>'
setopt extendedglob 		# Keybindings to help edit
bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search
#bindkey '^-' undo 		# ctrl + bar
#bindkey -s '^o' 'nvim $(fzf)^M'

# Random Shell
# Shells=(elvish nu xonsh oil)
# choice=$((RANDOM % 4))+1
# ${Shells[choice]}
