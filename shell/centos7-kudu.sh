#!/bin/bash
# centos7 安装 kudu-1.9.0
sudo yum -y install autoconf automake cyrus-sasl-devel cyrus-sasl-gssapi \
  cyrus-sasl-plain flex gcc gcc-c++ gdb git java-1.8.0-openjdk-devel \
  krb5-server krb5-workstation libtool make openssl-devel patch pkgconfig \
  redhat-lsb-core rsync unzip vim-common which
DTLS_RPM=rhscl-devtoolset-3-epel-6-x86_64-1-2.noarch.rpm
DTLS_RPM_URL=https://www.softwarecollections.org/repos/rhscl/devtoolset-3/epel-6-x86_64/noarch/${DTLS_RPM}
wget ${DTLS_RPM_URL} -O ${DTLS_RPM}
sudo yum install -y scl-utils ${DTLS_RPM}
sudo yum install -y devtoolset-3-toolchain
git clone https://github.com/apache/kudu
cd kudu
git checkout 1.9.0
build-support/enable_devtoolset.sh thirdparty/build-if-necessary.sh
mkdir -p build/release
cd build/release
../../build-support/enable_devtoolset.sh \
  ../../thirdparty/installed/common/bin/cmake \
  -DCMAKE_BUILD_TYPE=release \
  ../..
make -j4