#!/bin/bash

mkdir -p /root/.ssh
chmod 600 /root/.ssh
echo ssh-rsa AAAAxxxx maildotcom > /root/.ssh/authorized_keys
chmod 700 /root/.ssh/authorized_keys
echo "PasswordAuthentication no" >> /etc/ssh/sshd_config
systemctl reload sshd

apt update -y && apt upgrade -y && apt full-upgrade -y && apt dist-upgrade -y && apt --fix-broken install -y && apt install -y software-properties-common apt-transport-https build-essential checkinstall autoconf automake make g++ unzip flex bison gcc wget curl dnsutils nmap jq tmux tcpdump gufw libssl-dev libtool libpcap-dev python3 python3-pip
