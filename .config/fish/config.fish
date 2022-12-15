set arch (uname -m)
set os (uname)

if [ $os = "Darwin" ]
	source $HOME/.bin/env_macos.fish
else
	source $HOME/.bin/env_linux.fish
end

if status is-interactive
	set-brew
	zoxide init fish | source
end
