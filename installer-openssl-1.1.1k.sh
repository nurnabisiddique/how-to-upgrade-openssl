#!/bin/sh
yum -y update
yum install -y make gcc perl-core pcre-devel wget zlib-devel
sudo yum -y groupinstall "Development Tools"
wget https://www.openssl.org/source/openssl-1.1.1w.tar.gz
tar -xzvf openssl-1.1.1w.tar.gz
cd openssl-1.1*/
./config --prefix=/usr/local/openssl --openssldir=/usr/local/openssl
make
rm -rf /usr/bin/openssl
sudo make install
sudo ldconfig
sudo tee /etc/profile.d/openssl.sh<<EOF
export PATH=/usr/local/openssl/bin:\$PATH
export LD_LIBRARY_PATH=/usr/local/openssl/lib:\$LD_LIBRARY_PATH
EOF
source /etc/profile.d/openssl.sh
logout
which openssl
openssl version