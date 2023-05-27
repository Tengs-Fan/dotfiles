# ----- ----- OS Specific ----- ----- #
os=$(uname)
arch=$(uname -m)        
if [ "$os" = 'Darwin' ] ; then
  USER_ROOT="/Users/tengs"
  if [ "$arch" = 'arm64' ]; then 
    HOMEBREW_ROOT="/opt/homebrew"
  else
    HOMEBREW_ROOT="/usr/local"
  fi
else 
  USER_ROOT="/home/tengs"
  HOMEBREW_ROOT="/home/.linuxbrew"
fi

# ----- ----- Set Environment of Subsystem ----- ----- #
function set-brew(){
  export PATH="$HOMEBREW_ROOT/bin:$HOMEBREW_ROOT/sbin:$PATH"
  eval $(brew shellenv)    

	# alias abrew="arch -arm64 $HOMEBREW_ROOT/bin/brew"  # ARM Homebrew
	# alias ibrew="arch -x86_64 /usr/local/bin/brew" # X86 Homebrew

	export LDFLAGS="-L$HOMEBREW_ROOT/lib $LDFLAGS"
	export CPPFLAGS="-I$HOMEBREW_ROOT/include $CPPFLAGS"
}

function set-conda(){
  # >>> conda initialize >>>
  # !! Contents within this block are managed by 'conda init' !!
  __conda_setup="$('$USER_ROOT/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then
    eval "$__conda_setup"
  else
    if [ -f "$USER_ROOT/miniconda3/etc/profile.d/conda.sh" ]; then
      . "$USER_ROOT/miniconda3/etc/profile.d/conda.sh"
    else
      export PATH="$USER_ROOT/miniconda3/bin:$PATH"
    fi
  fi
  unset __conda_setup
  # <<< conda initialize <<<
}

function set-rust(){
	source "$HOME/.cargo/env"
}

function set-haskell(){
	export PATH="$USER_ROOT/.ghcup/bin:$PATH"
}

function set-deno() {
	export PATH="$USER_ROOT/.deno/bin:$PATH"
}

# ----- ----- path & config of appplication ----- ----- #
function set-cuda() {
	export PATH="/opt/cuda/bin:$PATH";
	export LDFLAGS="-L/opt/cuda/lib64 $LDFLAGS"
	export CPPFLAGS="-I/opt/cuda/include $CPPFLAGS"
	export CFLAGS="-I/opt/cuda/include $CFLAGS"
}

function set-llvm(){
	export PATH="$HOMEBREW_ROOT/opt/llvm/bin:$PATH"
	export LDFLAGS="-L$HOMEBREW_ROOT/opt/llvm/lib -Wl,-rpath,$HOMEBREW_ROOT/opt/llvm/lib $LDFLAGS"
	export CPPFLAGS="-I$HOMEBREW_ROOT/opt/llvm/include $CPPFLAGS"
}

function set-ruby() {
  export PATH="$HOMEBREW_ROOT/opt/ruby/bin:$PATH"
  export LDFLAGS="-L$HOMEBREW_ROOT/opt/ruby/lib $LDFLAGS"
  export CPPFLAGS="-I$HOMEBREW_ROOT/opt/ruby/include $CPPFLAGS"
  export PKG_CONFIG_PATH="$HOMEBREW_ROOT/opt/ruby/lib/pkgconfig $PKG_CONFIG_PATH"
}

function set-fuchsia(){
#	export PATH="$PATH:/Users/tengs/Projects/fuchsia/.jiri_root/bin"
#	[10:37:53.264] WARN: Please opt in or out of analytics collection. You will receive this warning until an option is selected.
#	To check what data we collect run: jiri init -show-analytics-data
#	To opt-in run: jiri init -analytics-opt=true "/Users/tengs/Projects/fuchsia"
}

function set-xilinx() {
#	source /usr/local/Xilinx/Vivado/2020.2/.settings64-Vivado.sh
#	source /usr/local/Xilinx/DocNav/.settings64-DocNav.sh
#	source /usr/local/Xilinx/Vitis_HLS/2020.2/.settings64-Vitis_HLS.sh
}

# ----- ----- settings of appplication ----- ----- #
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
