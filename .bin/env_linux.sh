# Small Scripts
. $HOME/.bin/func.sh

# linuxbrew
#eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
function set-brew() {
	export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew";
	export HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar";
	export HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew";
# already set in /etc/environment
	export PATH="${PATH}:/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin";
	export MANPATH="/home/linuxbrew/.linuxbrew/share/man${MANPATH+:$MANPATH}:";
	export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:${INFOPATH:-}";

	export LDFLAGS="-L/home/linuxbrew/.linuxbrew/lib $LDFLAGS"
	export CPPFLAGS="-I/home/linuxbrew/.linuxbrew/include $CPPFLAGS"
	export CFLAGS="-I/home/linuxbrew/.linuxbrew/include $CFLAGS"
}

function set-linuxbrew() {
	export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:${PATH}";
}

function set-xilinx() {
	source /usr/local/Xilinx/Vivado/2020.2/.settings64-Vivado.sh
	source /usr/local/Xilinx/DocNav/.settings64-DocNav.sh
	source /usr/local/Xilinx/Vitis_HLS/2020.2/.settings64-Vitis_HLS.sh
}

function set-proxy() {
	export http_proxy=http://127.0.0.1:7890/
	export https_proxy=http://127.0.0.1:7890/
	export all_proxy=socks5://127.0.0.1:7890/

	export HTTP_PROXY=http://127.0.0.1:7890/
	export HTTPS_PROXY=http://127.0.0.1:7890/
	export ALL_PROXY=socks5://127.0.0.1:7890/
}

function unset-proxy() {
	unset http_proxy https_proxy all_proxy
	unset HTTP_PROXY HTTPS_PROXY ALL_PROXY
}

