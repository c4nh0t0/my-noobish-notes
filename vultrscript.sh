#!/bin/bash

mkdir -p /root/.ssh
chmod 600 /root/.ssh
echo ssh-rsa AAAAxxxx maildotcom > /root/.ssh/authorized_keys
chmod 700 /root/.ssh/authorized_keys
echo "PasswordAuthentication no" >> /etc/ssh/sshd_config
systemctl reload sshd

# Updating, Upgrading, Cleaning Up and Installing some essential tools
apt update -y && apt upgrade -y && apt full-upgrade -y && apt dist-upgrade -y && apt --fix-broken install -y && apt install -y software-properties-common apt-transport-https build-essential checkinstall autoconf automake make g++ unzip flex bison gcc wget curl dnsutils nmap jq tmux tcpdump ufw libssl-dev libtool libpcap-dev python3 python3-pip xdg-utils pkg-config vim chromium-browser iptraf golang tor tor-geoipdb torsocks torcs

# Downloading Wordlists
cd /opt && mkdir wordlists
cd wordlists/ && git clone https://github.com/danielmiessler/SecLists.git

# Downloading and Installing "altdns"
cd /opt && git clone https://github.com/infosec-au/altdns.git && cd altdns/ && pip install -r requirements.txt

# Downloading and Installing "aquatone"
cd /opt && mkdir aquatone && cd aquatone/ && wget https://github.com/michenriksen/aquatone/releases/download/v1.7.0/aquatone_linux_amd64_1.7.0.zip && unzip aquatone_linux_amd64_1.7.0.zip

# Downloading and Installing "dirsearch"
cd /opt && git clone https://github.com/maurosoria/dirsearch.git

# Downloading and Installing "Gobuster"
cd /opt && git clone https://github.com/OJ/gobuster.git

# Downloading and Installing "gau"
GO111MODULE=on go get -u -v github.com/lc/gau

# Downloading and Installing "nuclei"
GO111MODULE=on go get -u -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei
cd /opt && git clone https://github.com/projectdiscovery/nuclei-templates.git

# Downloading and Installing "CORScanner"
cd /opt && git clone https://github.com/chenjj/CORScanner.git && cd CORScanner/ && pip3 install -r requirements.txt

# Downloading and Installing "ffuf"
GO111MODULE=on go get -u github.com/ffuf/ffuf

# Downloading and Installing "httpx"
GO111MODULE=auto go get -u -v github.com/projectdiscovery/httpx/cmd/httpx

# Downloading and Installing "wafw00f"
cd /opt && git clone https://github.com/EnableSecurity/wafw00f.git && cd wafw00f/ && python3 setup.py install

# Downloading and Installing "Amass"
cd /opt && mkdir amass && cd amass/ && wget https://github.com/OWASP/Amass/releases/download/v3.10.5/amass_linux_amd64.zip

# Downloading and Installing "XSStrike"
cd /opt && git clone https://github.com/s0md3v/XSStrike.git

# Downloading and Installing "Arjun"
cd /opt && git clone https://github.com/s0md3v/Arjun.git
