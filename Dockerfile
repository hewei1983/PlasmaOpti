# http://...# Start a truffle container for testing ethereum funcions. 
FROM golang:1.10
MAINTAINER hewei <eric.he@hotmail.com>  
# Mapping container to host port, for connecting, e.g., metamask
EXPOSE 1233
# install nodejs and install truffle and ganache-cli
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash - \	
  && apt-get install -y nodejs \	
  && npm install -g truffle \	
  && npm install -g ganache-cli \
  && npm install ethereumjs-tx  
  
# make truffle workspace and initialize
RUN mkdir -p /go/src/truffle \	
  && cd /go/src/truffle \	
  && truffle init 
  
RUN mkdir -p /go/src/bancor \
  && cd /go/src/bancor \
  && git clone https://github.com/bancorprotocol/contracts.git
  
RUN mkdir -p /go/src/multiSigWallet \
  && cd /go/src/multiSigWallet \
  && git clone https://github.com/gnosis/MultiSigWallet.git

RUN apt-get install -y vim \	
  && apt-get install -y tree
# install golang tools# 
RUN go get github.com/kardianos/govendor
# set work directory  
WORKDIR /go/src/truffle 
