# ----- ----- Set Environment ----- ----- #

function env-macports
	fish_add_path -p /opt/local/bin /opt/local/sbin
	#export MANPATH="/opt/local/share/man:$MANPATH"
#	export DISPLAY=:0
end

# ----- ----- PATH & Config ----- ----- #
function set-brew
	set arch (uname -m)

	switch $arch
		case arm64
			export PATH="/usr/local/bin:$PATH"
			export PATH="/usr/local/sbin:$PATH"
			#eval `/usr/libexec/path_helper -s`
			eval $(/opt/homebrew/bin/brew shellenv)
		case x86_64
			export PATH="/opt/homebrew/bin:$PATH"
			export PATH="/opt/homebrew/sbin:$PATH"
			#eval `/usr/libexec/path_helper -s`
			eval $(/usr/local/Homebrew/bin/brew shellenv)
	end
	alias abrew="arch -arm64 /opt/homebrew/bin/brew"  # ARM Homebrew
	alias ibrew="arch -x86_64 /usr/local/bin/brew" # X86 Homebrew
	
	set -gx LDFLAGS -L/opt/homebrew/lib
	set -gx CPPFLAGS -I/opt/homebrew/include
end

function set-rust
  # fish_add_path -a $HOME/.cargo/bin
	# export PATH="$HOME/.cargo/bin:$PATH"
end

function set-fuchsia
	export PATH="$PATH:/Users/penkwe/Projects/fuchsia/.jiri_root/bin"
	[10:37:53.264] WARN: Please opt in or out of analytics collection. You will receive this warning until an option is selected.
	To check what data we collect run: jiri init -show-analytics-data
	To opt-in run: jiri init -analytics-opt=true "/Users/penkwe/Projects/fuchsia"
end

function set-deno
	export PATH="/Users/penkwe/.deno/bin:$PATH"
end
