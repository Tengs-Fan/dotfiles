# ----- ----- Default PATH & Config ----- ----- #
export PATH="/Users/penkwe/.bin:$PATH"
export LDFLAGS="-L/opt/homebrew/lib $LDFLAGS"
export CPPFLAGS="-I/opt/homebrew/include $CPPFLAGS"

function set-conda(){

	OS=$(uname -s)
	case $OS in
		Darwin)
			CONDA_PATH=/usr/local/Caskroom/miniconda
			;;
		Linux)
			CONDA_PATH=/home/penkwec/miniconda
			;;
	esac
	
	# >>> conda initialize >>>
	# !! Contents within this block are managed by 'conda init' !!
	__conda_setup="$("$CONDA_PATH/miniconda/base/bin/conda" 'shell.zsh' 'hook' 2> /dev/null)"
	if [ $? -eq 0 ]; then
		eval "$__conda_setup"
	else
		if [ -f "$CONDA_PATH/base/etc/profile.d/conda.sh" ]; then
			. "$CONDA_PATH/base/etc/profile.d/conda.sh"
		else
			export PATH="$CONDA_PATH/miniconda/base/bin:$PATH"
		fi
	fi
	unset __conda_setup
	# <<< conda initialize <<<

	#CONDA_AUTO_ACTIVATE_BASE=false
	#conda config --set auto_activate_base false
}
