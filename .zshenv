# rust
#source $HOME/.cargo/env

# Path
set-brew
set-proxy
#set-xilinx

export PATH=$HOME/.bin:$PATH

# Small Scripts
. $HOME/.bin/func.sh

function set-conda() {	
	# >>> conda initialize >>>
	# !! Contents within this block are managed by 'conda init' !!
	__conda_setup="$('$HOME/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
	if [ $? -eq 0 ]; then
		eval "$__conda_setup"
	else
		if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
			. "$HOME/miniconda3/etc/profile.d/conda.sh"
		else
			export PATH="$HOME/miniconda3/bin:$PATH"
		fi
	fi
	unset __conda_setup
	# <<< conda initialize <<<
	
	#CONDA_AUTO_ACTIVATE_BASE=false
	#conda config --set auto_activate_base false
}

