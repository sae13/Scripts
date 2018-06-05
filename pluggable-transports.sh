#!/bin/bash
export GOPATH=~/go/path
export GOBIN=~/go/bin
mkdir -p ~/go/{git,path,bin}
mkdir -p ~/go/path/src/golang.org/x 
cd ~/go/path/src/golang.org/x 
git clone https://github.com/golang/crypto.git
git clone https://github.com/golang/net.git
cd ~/go/git
git clone https://git.torproject.org/pluggable-transports/meek.git
git clone https://git.torproject.org/pluggable-transports/obfs4.git
cd ~/go/git/obfs4/obfs4proxy
go get -v
cd ~/go/git/meek/meek-client
go get -v
sudo cp ~/go/bin/* /usr/local/bin
sudo chmod +x /usr/local/bin/meek-client
sudo chmod +x /usr/local/bin/obfs4proxy
echo "
ClientTransportPlugin meek  exec /usr/local/bin/meek-client
ClientTransportPlugin obfs4 exec /usr/local/bin/obfs4proxy
#ClientTransportPlugin obfs3 exec /usr/bin/obfsproxy --managed
" |sudo tee -a /etc/tor/torrc


