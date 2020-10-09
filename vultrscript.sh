#!/bin/bash

mkdir -p /root/.ssh
chmod 600 /root/.ssh
echo ssh-rsa AAAAxxxx maildotcom > /root/.ssh/authorized_keys
chmod 700 /root/.ssh/authorized_keys
echo "PasswordAuthentication no" >> /etc/ssh/sshd_config
systemctl reload sshd

# Updating, Upgrading, Cleaning Up and Installing some essential tools
apt update -y && apt upgrade -y && apt full-upgrade -y && apt dist-upgrade -y && apt --fix-broken install -y && apt install -y software-properties-common apt-transport-https build-essential checkinstall autoconf automake make g++ unzip flex bison gcc wget curl dnsutils nmap jq tmux tcpdump ufw libssl-dev libtool libpcap-dev python3 python3-pip xdg-utils pkg-config vim chromium-browser iptraf

# Downloading and Installing "altdns"
cd /opt && git clone https://github.com/infosec-au/altdns.git && cd altdns/ && pip install -r requirements.txt

# Downloading and Installing "aquatone"
cd /opt && mkdir aquatone && cd aquatone/ && wget https://github.com/michenriksen/aquatone/releases/download/v1.7.0/aquatone_linux_amd64_1.7.0.zip && unzip aquatone_linux_amd64_1.7.0.zip
