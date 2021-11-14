# ----- ----- Set Environment ----- ----- #
function env-develop(){
	set-conda
	set-arm-flags
	set-llvm
	set-rust
	set-java
}

function env-gnu(){
	set-gnu
}

function env-x64(){
	set-x64-flags
	set-x64-paths
}

function env-macports(){
	export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
	export MANPATH="/opt/local/share/man:$MANPATH"
#	export DISPLAY=:0
}

# ----- ----- PATH & Config ----- ----- #
function set-llvm(){
	export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
	export LDFLAGS="-L/opt/homebrew/opt/llvm/lib -Wl,-rpath,/opt/homebrew/opt/llvm/lib $LDFLAGS"
	export CPPFLAGS="-I/opt/homebrew/opt/llvm/include $CPPFLAGS"
}

function set-rust(){
	source "$HOME/.cargo/env"
}

function set-arm-java(){
	export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
	export LDFLAGS="-I/opt/homebrew/opt/openjdk/lib $LDFLAGS"
	export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include $CPPFLAGS"
}

function set-x64-java(){
	export PATH="/usr/local/opt/openjdk/bin:$PATH"
	export LDFLAGS="-I/usr/local/opt/openjdk/lib $LDFLAGS"
	export CPPFLAGS="-I/usr/local/opt/openjdk/include $CPPFLAGS"
}

function set-arm-flags(){

	export PKG_CONFIG_PATH="/opt/homebrew/opt/icu4c/lib/pkgconfig:$PKG_CONFIG_PATH"
	export LDFLAGS="-L/opt/homebrew/opt/icu4c/lib $LDFLAGS"
	export CPPFLAGS="-I/opt/homebrew/opt/icu4c/include $CPPFLAGS"

	export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@1.1/lib/pkgconfig:$PKG_CONFIG_PATH"
	export LDFLAGS="-L/opt/homebrew/opt/openssl@1.1/lib $LDFLAGS"
	export CPPFLAGS="-I/opt/homebrew/opt/openssl@1.1/include $CPPFLAGS"

	export PKG_CONFIG_PATH="/opt/homebrew/opt/libffi/lib/pkgconfig:$PKG_CONFIG_PATH"
	export LDFLAGS="-L/opt/homebrew/opt/libffi/lib $LDFLAGS"
	export CPPFLAGS="-I/opt/homebrew/opt/libffi/include $CPPFLAGS"

	export PKG_CONFIG_PATH="/opt/homebrew/opt/libarchive/lib/pkgconfig:$PKG_CONFIG_PATH"
	export LDFLAGS="-L/opt/homebrew/opt/libarchive/lib $LDFLAGS"
	export CPPFLAGS="-I/opt/homebrew/opt/libarchive/include $CPPFLAGS"

	export LDFLAGS="-L/opt/homebrew/opt/binutils/lib $LDFLAGS"
	export CPPFLAGS="-I/opt/homebrew/opt/binutils/include $CPPFLAGS"

	export LDFLAGS="-L/opt/homebrew/opt/openjdk/lib $LDFLAGS"
	export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include $CPPFLAGS"

	export PKG_CONFIG_PATH="/opt/homebrew/opt/curl/lib/pkgconfig:$PKG_CONFIG_PATH"
	export LDFLAGS="-L/opt/homebrew/opt/curl/lib $LDFLAGS"
	export CPPFLAGS="-I/opt/homebrew/opt/curl/include $CPPFLAGS"

	export PKG_CONFIG_PATH="/opt/homebrew/opt/openblas/lib/pkgconfig:$PKG_CONFIG_PATH"
	export LDFLAGS="-L/opt/homebrew/opt/openblas/lib $LDFLAGS"
	export CPPFLAGS="-I/opt/homebrew/opt/openblas/include $CPPFLAGS"
}

function set-arm-paths(){
	export PATH="/opt/homebrew/opt/binutils/bin:$PATH"
	export PATH="/opt/homebrew/opt/bison/bin:$PATH"
	export PATH="/opt/homebrew/opt/curl/bin:$PATH"
}

function set-x64-flags(){

	export LDFLAGS="-L/usr/local/opt/binutils/lib $LDFLAGS "
	export CPPFLAGS="-I/usr/local/opt/binutils/include $CPPFLAGS "

	export LDFLAGS="-L/usr/local/opt/readline/lib $LDFLAGS"
	export CPPFLAGS="-I/usr/local/opt/readline/include"

	export LDFLAGS="-L/usr/local/opt/sqlite/lib $LDFLAGS"
	export CPPFLAGS="-I/usr/local/opt/sqlite/include"

	export LDFLAGS="-L/usr/local/opt/tcl-tk/lib $LDFLAGS"
	export CPPFLAGS="-I/usr/local/opt/tcl-tk/include $CPPFLAGS"

}

function set-x64-paths(){
	export PATH="/usr/local/opt/binutils/bin:$PATH"
	export PATH="/usr/local/opt/sqlite/bin:$PATH"
	export PATH="/usr/local/opt/tcl-tk/bin:$PATH"
}

function set-mips-cross(){
	if [[ -z "${MIPS_CROSS}" ]]; then
		export PATH="/opt/self/Cellar/mips-elf/bin:$PATH"
		export INFOPATH="/opt/self/Cellar/mips-elf/share/info:$INFOPATH"
		export MANPATH="/opt/self/Cellar/mips-elf/man:$MANPATH"
		export LDFLAGS="-L/opt/self/Cellar/mips-elf/lib $LDFLAGS"

		export PATH="/opt/self/Cellar/mips-sde-elf/bin:$PATH"
		export INFOPATH="/opt/self/Cellar/mips-sde-elf/share/info:$INFOPATH"
		export MANPATH="/opt/self/Cellar/mips-sde-elf/man:$MANPATH"
		export LDFLAGS="-L/opt/self/Cellar/mips-sde-elf/lib $LDFLAGS"

		export MIPS_CROSS='True'
	else
		echo 'The mips-cross is set'
	fi
}

# ----- ----- Specific Appplication ----- ----- #
function set-qt5() {
	export PATH="/opt/homebrew/Cellar/qt@5/5.15.2/bin:$PATH"
	export CPPFLAGS="/opt/homebrew/Cellar/qt@5/5.15.2/include $CPPFLAGS"
	export LDFLAGS="/opt/homebrew/Cellar/qt@5/5.15.2/lib $LDFLAGS"
}

function set-fuchsia(){
#	export PATH="$PATH:/Users/penkwe/Projects/fuchsia/.jiri_root/bin"
#	[10:37:53.264] WARN: Please opt in or out of analytics collection. You will receive this warning until an option is selected.
#	To check what data we collect run: jiri init -show-analytics-data
#	To opt-in run: jiri init -analytics-opt=true "/Users/penkwe/Projects/fuchsia"
}

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
