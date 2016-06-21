sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers
yum -y -q install gcc make gcc-c++ git wget zlib zlib-devel libyaml libyaml-devel readline readline-devel libffi-devel openssl openssl-devel \
		http://vault.centos.org/6.4/os/x86_64/Packages/kernel-devel-`uname -r`.rpm \
		perl bzip2 autoconf automake libtool bison iconv-devel


yum -y -q remove ruby ruby-devel
mkdir /tmp/ruby-build && cd /tmp/ruby-build

wget http://pyyaml.org/download/libyaml/yaml-0.1.6.tar.gz
tar xzvf yaml-0.1.6.tar.gz
cd yaml-0.1.6
./configure
make
make install

wget http://ftp.ruby-lang.org/pub/ruby/ruby-1.9.3-p551.tar.gz
tar zxf ruby-1.9.3-p551.tar.gz
cd ruby-1.9.3-p551
./configure
make
make install

echo -e '\nexport PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
 
gem update --system
gem install bundler
gem install puppet --no-ri --no-rdoc
 
cd ~/ && rm -rf /tmp/ruby-build