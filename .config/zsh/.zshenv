OS=$(uname -s)
case $OS in
	Darwin)
		CONDA_PATH=/usr/local/Caskroom/miniconda
		export ZSH="/Users/penkwe/.oh-my-zsh"
		;;
	Linux)
		CONDA_PATH=/home/penkwec/miniconda3
		export ZSH="/home/penkwec/.oh-my-zsh"
		;;
esac

# ----- ----- Config that include local variables ----- ----- #

#source $HOME/.cargo/env
set-brew

source $HOME/.bin/func.sh				# Personal Functions
source $HOME/.config/zsh/aliases		# Aliases
export PATH=$HOME/.bin:$PATH

# User configuration
export EDITOR='nvim'
export NEMU_HOME=$HOME/Code/ics2020/nemu
export AM_HOME=$HOME/Code/ics2020/abstract-machine

function set-conda(){

	# >>> conda initialize >>>
	# !! Contents within this block are managed by 'conda init' !!
	__conda_setup="$("$CONDA_PATH/bin/conda" 'shell.zsh' 'hook' 2> /dev/null)"
	if [ $? -eq 0 ]; then
		eval "$__conda_setup"
	else
		if [ -f "$CONDA_PATH/base/etc/profile.d/conda.sh" ]; then
			. "$CONDA_PATH/base/etc/profile.d/conda.sh"
		else
			export PATH="$CONDA_PATH/bin:$PATH"
		fi
	fi
	unset __conda_setup
	# <<< conda initialize <<<

	#CONDA_AUTO_ACTIVATE_BASE=false
	#conda config --set auto_activate_base false
}
