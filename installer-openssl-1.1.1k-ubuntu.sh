#!/bin/sh
sudo apt-get update
sudo apt-get install -y make gcc perl libssl-dev libpcre3-dev zlib1g-dev
sudo apt-get install -y build-essential
wget https://www.openssl.org/source/openssl-1.1.1w.tar.gz
tar -xzvf openssl-1.1.1w.tar.gz
cd openssl-1.1.1*/
./config --prefix=/usr/local/openssl --openssldir=/usr/local/openssl
make
sudo make install
sudo ldconfig
sudo tee /etc/profile.d/openssl.sh <<EOF
export PATH=/usr/local/openssl/bin:\$PATH
export LD_LIBRARY_PATH=/usr/local/openssl/lib:\$LD_LIBRARY_PATH
EOF
source /etc/profile.d/openssl.sh
logout  # Note: This line might not work as intended in a script, consider removing it.
which openssl
openssl version
