function set-clash() {
	ln -s /home/linuxbrew/.linuxbrew/opt/clash/bin/clash /usr/local/bin/clash
	curl https://efanyun.me/clash/207089/uWJGgmHgzX/ > /etc/clash/config.yaml
	cp /etc/clash/config.yaml /home/frind/.config/clash/config.yaml
}

function set-swap() {
	swapoff -a
	dd if=/dev/zero of=/swapfile bs=1G count=$1
	chmod 600 /swapfile
	mkswap /swapfile
	swapon /swapfile
}

function cmd() {
	mkdir $1
	cd $1
}

function weather() {
  curl wttr.in/$1
}
