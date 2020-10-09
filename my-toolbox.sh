#!/bin/bash

# This script is my lame attempt to "automate" some of my favorite tools.
# Greetz to all creators!

#export DEBLIKE_FRONTEND=noninteractive;


echo "##### My Toolbox #####"

sleep 5;

##### General System Stuff ("hardening", dependencies, etc)
echo -e "\nSystem Tools Check\n"
# System Tools Check
# Check Go
echo -e "\nChecking if Go is installed.\n"
	if [[ $(go version | grep "version") != "version" ]];
		then
			echo -e "Go is not installed. Install it first."
	fi

echo "\n++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n"
echo -e Downloadind and installing Go version 1.13.6"
	cd
	wget -q https://dl.google.com/go/go1.13.6.linux-amd64.tar.gz
	tar -C /usr/local -xzf go1.13.6.linux-amd64.tar.gz
	sudo rm -f go1.13.6.linux-amd64.tar.gz
	export GOROOT=/usr/local/go >> ~/.profile
	export GOPATH=$HOME/go >> ~/.profile
	export PATH=$GOPATH/bin:$GOROOT/bin:$PATH >> ~/.profile
	source ~/.profile
	echo -e "Go Installed."
echo "\n++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n"
sleep 5;
echo "\n++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n"
echo -e "\nAPT System Maintenance - Update and Upgrade\n"
# APT System Maintenance
apt update && sleep 3 && apt update --fix-missing && sleep 3 && apt -y upgrade && sleep3 && apt -y full-upgrade && sleep 3
apt -y --fix-broken install && sleep 3
apt autoclean && sleep 5;
echo "\n++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n"
echo -e "\nInstalling packages\n"
echo -e "\nGeneral System/Tools Required Dependencies\n"
# General System/Tools Required Dependencies
apt -y install build-essential software-properties-common apt-transport-https checkinstall autoconf automake gcc make zip unzip g++ libtool xdg-utils bison flex dnsutils pkg-config
sleep 5
echo -e "\nPython 3.X Stuff\n"
# Python 3.X Stuff
apt -y install python3 python3-pip
sleep 5
echo -e "\nPython 2.7 Stuff (for legacy tools/scripts)\n"
# Python 2.7 Stuff (for legacy tools/scripts)
apt -y install python2.7 python2.7-dev python-pip python-dev 
sleep 5
echo -e "\nOther Stuff/Utilities and Essentials\n"
# Other Stuff/Utilities and Essentials
apt -y install wget curl git ufw vim chromium-browser tcpdump iptraf
sleep 5
echo -e "\nGeneral System/Tools Required Libraries\n"
# General System/Tools Required Libraries
apt -y install libcurl4-openssl-dev libxml2 libxml2-dev libbz2-dev libc6-dev libgdbm-dev libncursesw5-dev libreadline-gplv2-dev libsqlite3-dev libssl-dev libcap-dev libcups2-dev libxtst-dev libxss1 libnss3-dev gcc-multilib g++-multilib libldns-dev libgconf2-dev libxslt1-dev libgmp-dev zlib1g zlib1g-dev libffi-dev libpcap-dev libxssl libsqlite3-dev libyaml-dev libreadline6-dev libncurses5-dev libgdbm5 libpq-dev libjansson-dev libmagic-dev
sleep 5
echo -e "\nOptional Stuff\n"
# Optional Stuff
apt -y install  sqlite3 ruby ruby-dev git-core jruby nodejs python-numpy python-scipy python-setuptools tk-dev  xvfb x11-xkb-utils xfonts-100dpi xfonts-75dpi xfonts-scalable xfonts-cyrillic x11-apps clang libdbus-1-dev libgtk2.0-dev libnotify-dev libgnome-keyring-dev libasound2-dev
sleep 5
# Temorarely Disabled
# apt -y install fail2ban
# Other Tools
apt -y install nmap
sleep 5
# Temorarely Disabled
# apt autoremove
# Disable IPv6 in Ubuntu 18.04
sysctl -w net.ipv6.conf.all.disable_ipv6=1
sysctl -w net.ipv6.conf.default.disable_ipv6=1
sysctl -w net.ipv6.conf.lo.disable_ipv6=1
sysctl -w net.ipv6.conf.ens3.disable_ipv6=1
echo "\n++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n"
##### GitHub Tools Section (effective tools for bbounty, pentesting, etc)
cd /opt/
# Cloning Dirsearch from original Dirsearch GitHub Repository
echo -e "\nCloning Dirsearch 0.3.9 into /opt/\n";
git clone https://github.com/maurosoria/dirsearch.git
mv dirsearch/ dirsearch_v0.3.9/
echo -e "\nDirsearch Completed!\n"
# ToDo - sanity check for tool - enter in directory and run the tool with -h if possible to check the tool was correctly installed.
# Cloning LinkFinder from original LinkFinder GitHub Repository
echo -e "\nCloning LinkFinder into /opt/\n";
git clone https://github.com/GerbenJavado/LinkFinder.git
cd /opt/LinkFinder/
pip3 install -r requirements.txt
python3 setup.py install
cd ..
echo -e "\nLinkFinder Completed!\n"
# ToDo - sanity check for tool - enter in directory and run the tool with -h if possible to check the tool was correctly installed.
# Downloading Yara (3.11.0) from original VirusTotal GitHub Repository
echo -e "\nDownloading Yara 3.11.0 into /opt/\n";
wget https://github.com/VirusTotal/yara/archive/v3.11.0.tar.gz
tar -zxf
mv v3.11.0/ yara_v3.11.0/
cd yara_v3.11.0/
./bootstrap.sh
./configure --with-crypto
make
make install
make check
cd ..
echo -e "\nYara Completed!\n"
# ToDo - sanity check for tool - enter in directory and run the tool with -h if possible to check the tool was correctly installed.
echo "\n++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n"
# Downloading and Installing Commonspeak2 from Source (https://github.com/urfave/cli)
echo -e "\nDownloading and Installing Commonspeak2 from Source /opt/\n";
echo -e "\nThis tool needs Go, Glide and Urfave's cli\n";
echo -e "\nInstalling Glide\n";
	go get github.com/Masterminds/glide
	glide -v
echo -e "\nInstalling Urfave cli\n";
	GO111MODULE=on go get github.com/urfave/cli/v2
echo -e "\nInstalling Commonspeak2\n";
	go get github.com/assetnote/commonspeak2
echo -e "\nErrors will occur, no problem. LOL\n";
	cd ~/go/src/github.com/assetnote/commonspeak2/
	glide install
	go build
	./commonspeak2 -v
#ToDo Credentials.json
echo "\n++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n"
# Cloning SQLMap from original SQLMap GitHub Repository 
echo -e "\nCloning SQLMap into /opt/\n";
git clone https://github.com/sqlmapproject/sqlmap.git
echo -e "\nSQLMap Completed!\n"
# ToDo - sanity check for tool - enter in directory and run the tool with -h if possible to check the tool was correctly installed.
# Cloning MassDNS from original MassDNS GitHub Repository 
echo -e "\nCloning MassDNS 0.3 into /opt/\n";
git clone https://github.com/blechschmidt/massdns.git
mv massdns/ massdns_0.3/
cd massdns_0.3/
make
cd..
echo -e "\nMassDNS Completed!\n"
# ToDo - sanity check for tool - enter in directory and run the tool with -h if possible to check the tool was correctly installed.
# Cloning Altdns from original Altdns GitHub Repository 
echo -e "\nCloning Altdns 1.0.0 into /opt/\n";
git clone https://github.com/infosec-au/altdns.git
mv altdns/ altdns_1.0.0/
cd altdns_1.0.0/
pip install -r requirements.txt
cd ..
echo -e "\nAltdns Completed!\n"
# ToDo - sanity check for tool - enter in directory and run the tool with -h if possible to check the tool was correctly installed.
# Downloading Aquatone from original Aquatone GitHub Repository 
echo -e "\nDownloading Aquatone into /opt/\n";
wget https://github.com/michenriksen/aquatone/releases/download/v1.7.0/aquatone_linux_amd64_1.7.0.zip
mkdir aquatone_v1.7.0_amd64
unzip aquatone_linux_amd64_1.7.0.zip -d aquatone_v1.7.0_amd64/
echo -e "\nAquatone Completed!\n"
# ToDo - sanity check for tool - enter in directory and run the tool with -h if possible to check the tool was correctly installed.
# Cloning VHostScan from original VHostScan GitHub Repository
echo -e "\nCloning VHostScan 1.21 into /opt/\n";
git clone https://github.com/codingo/VHostScan.git
mv VHostScan/ VHostScan_1.21/
cd VHostScan_1.21/
python3 setup.py install
cd ..
echo -e "\nVhostScan Completed!\n"
# ToDo - sanity check for tool - enter in directory and run the tool with -h if possible to check the tool was correctly installed.
# Cloning dnsgen from original dnsgen GitHub Repository
echo -e "\nCloning dnsgen 1.0.1 into /opt/\n";
git clone https://github.com/ProjectAnte/dnsgen.git
mv dnsgen/ dnsgen_1.0.1/
cd dnsgen_1.0.1/
pip3 install -r requirements.txt
python3 setup.py install
cd ..
echo -e "\ndnsgen Completed!\n"
# ToDo - sanity check for tool - enter in directory and run the tool with -h if possible to check the tool was correctly installed.
# Downloading Subfinder from original Subfinder GitHub Repository
echo -e "\nDownloading Subfinder (2.3.2) into /opt/\n";
wget https://github.com/projectdiscovery/subfinder/releases/download/v2.3.2/subfinder-linux-amd64.tar
mkdir subfinder_v2.3.2_amd64
tar -xzvf subfinder-linux-amd64.tar
mv subfinder-linux-amd64 subfinder_v2.3.2_amd64/
# Optionally you can put subfinder into some executable path so other automation tools can benefit from it
cp /opt/subfinder_v2.3.2_amd64/subfinder-linux-amd64 /usr/bin/
echo -e "\nSubfinder Completed!\n"
# ToDo - sanity check for tool - enter in directory and run the tool with -h if possible to check the tool was correctly installed.
