# linuxbrew
#eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
function set-brew
	set HOMEBREW_PREFIX /home/linuxbrew/.linuxbrew
	set HOMEBREW_CELLAR /home/linuxbrew/.linuxbrew/Cellar
	set HOMEBREW_REPOSITORY /home/linuxbrew/.linuxbrew/Homebrew
# already set in /etc/environment
	# set PATH $PATH:/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin
# Let man do this, which may be better
	# set MANPATH /home/linuxbrew/.linuxbrew/share/man${MANPATH+:$MANPATHend:;
	# set INFOPATH /home/linuxbrew/.linuxbrew/share/info:${INFOPATH:-end;

	set LDFLAGS -L/home/linuxbrew/.linuxbrew/lib $LDFLAGS
	set CPPFLAGS -I/home/linuxbrew/.linuxbrew/include $CPPFLAGS
	set CFLAGS -I/home/linuxbrew/.linuxbrew/include $CFLAGS
end

function set-linuxbrew
	set PATH /home/linuxbrew/.linuxbrew/bin /home/linuxbrew/.linuxbrew/sbin $PATH
end

function set-cuda
	set PATH /opt/cuda/bin $PATH
	set LDFLAGS -L/opt/cuda/lib64 $LDFLAGS
	set CPPFLAGS -I/opt/cuda/include $CPPFLAGS
	set CFLAGS -I/opt/cuda/include $CFLAGS
end

#function set-xilinx
#	source /usr/local/Xilinx/Vivado/2020.2/.settings64-Vivado.sh
#	source /usr/local/Xilinx/DocNav/.settings64-DocNav.sh
#	source /usr/local/Xilinx/Vitis_HLS/2020.2/.settings64-Vitis_HLS.sh
#end

#function set-proxy
#	set http_proxy=http://127.0.0.1:7890/
#	set https_proxy=http://127.0.0.1:7890/
#	set all_proxy=socks5://127.0.0.1:7890/
#
#	set HTTP_PROXY=http://127.0.0.1:7890/
#	set HTTPS_PROXY=http://127.0.0.1:7890/
#	set ALL_PROXY=socks5://127.0.0.1:7890/
#end
#
#function unset-proxy
#	unset http_proxy https_proxy all_proxy
#	unset HTTP_PROXY HTTPS_PROXY ALL_PROXY
#end

