# Path to your oh-my-zsh installation.
export ZSH="/Users/penkwe/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="kennethreitz"
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# CASE_SENSITIVE="true"
# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

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

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

#source $HOME/.cargo/env
export PATH=$HOME/.bin:$PATH
. $HOME/.bin/func.sh

# User configuration
export EDITOR='nvim'
export NEMU_HOME=/home/frind/Code/ics2020/nemu
export AM_HOME=/home/frind/Code/ics2020/abstract-machine

# Alias
source $HOME/.config/zsh/aliases

# History
setopt HIST_FIND_NO_DUPS
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_space      # ignore commands that start with space
setopt histignorealldups sharehistory

setopt notify              # report the status of background jobs immediately
setopt numericglobsort     # sort filenames numerically when it makes sense
setopt magicequalsubst     # enable filename expansion for arguments of the form ‘anything=expression’

# Override the existing widget that's bound to alt-backspace.
#zle -N backward-kill-word
#backward-kill-word() {
#  if [[ $LBUFFER[-1] == [[:WORD:]] ]]; then
#    # If there's a word char left of the cursor, use the old widget.
#    zle .backward-kill-word
#  else
#    # Select all consecutive non-word chars left of the cursor.
#    (( MARK = ${#LBUFFER%%[^[:WORD:]]##}  ))
#    # Kill them. 
#    zle .kill-region
#  fi
#}

# CommandLine Edit
WORDCHARS='*?_[]\|~&;!'\''#$%^(){}<>'
setopt extendedglob 		# Keybindings to help edit
bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search
#bindkey '^-' undo 		# ctrl + bar
bindkey -s '^o' 'nvim $(fzf)^M'

# ======================================================================== #
# Architecture Dependent
# ======================================================================== #

if [ $(uname -s) = "Darwin" ]  
then
 
	arch=$(uname -m)        
	case $arch in
		arm*)               
			set-arm-java
			env-macports
			export PATH="/usr/local/bin:$PATH"    
			export PATH="/usr/local/sbin:$PATH"    
			eval `/usr/libexec/path_helper -s`    
			eval $(/opt/homebrew/bin/brew shellenv)    
			;;              
		i?86|x86*|amd64)    
			set-x64-java
			env-macports
			export PATH="/opt/homebrew/bin:$PATH"    
			export PATH="/opt/homebrew/sbin:$PATH"    
			eval `/usr/libexec/path_helper -s`    
			eval $(/usr/local/Homebrew/bin/brew shellenv)    
			ZSH_THEME="random"
			;;              
	esac
	alias abrew="arch -arm64 /opt/homebrew/bin/brew"  # ARM Homebrew
	alias ibrew="arch -x86_64 /usr/local/bin/brew" # X86 Homebrew

	test -e /Users/penkwe/.iterm2_shell_integration.zsh && source /Users/penkwe/.iterm2_shell_integration.zsh || true
fi

if [ $(uname -s) = "Linux" ]  
then
	set-brew
	set-proxy
	#set-xilinx
	
	export TERM=kitty

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
fi

# CommandLine Utilities
eval $(zoxide init zsh)
eval $(thefuck --alias)
