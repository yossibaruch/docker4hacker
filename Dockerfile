FROM ubuntu:latest
MAINTAINER yossibaruch
RUN apt-get update -y
RUN apt-get install -y \
build-essential \
conntrack \
debconf-utils \
exploitdb \
exploitdb-bin-sploits \
gdb \
git \
gobuster \
hashcat \
hydra \
inetutils-ping \
kmod \
libcap* \
man-db \
metasploit-framework \
minicom \
nasm \
net-tools \
nmap \
python \
python-dev \
python-pip \
sqlmap \
sslscan \
sudo \
tcpdump \
traceroute \
vim \
wget \
wordlists \
xz-utils \
zlib1g \
zlib1g-dev

# Other installs
RUN pip install scapy
RUN pip install pwntools
RUN pip install --upgrade pip

# Create known_hosts for git cloning and add host keys
RUN touch /root/.ssh/known_hosts
RUN ssh-keyscan bitbucket.org >> /root/.ssh/known_hosts
RUN ssh-keyscan github.com >> /root/.ssh/known_hosts

# Clone git repos and add kismet
RUN git clone https://github.com/danielmiessler/SecLists.git /opt/seclists
RUN git clone https://github.com/PowerShellMafia/PowerSploit.git /opt/powersploit
RUN echo "kismet kismet/install-setuid select true" | sudo debconf-set-selections
RUN echo "kismet kismet/install-users string root" | sudo debconf-set-selections
RUN apt-get install -y ettercap-text-only kismet aircrack-ng nmap yersinia dsniff dnsmasq hostapd
ADD http://scrapmaker.com/data/wordlists/dictionaries/rockyou.txt /opt/rockyou.txt

# Update ENV
ENV PATH=$PATH:/opt/powersploit

# Set entrypoint and working directory
WORKDIR /root/

# Indicate we want to expose ports 80 and 443
EXPOSE 80/tcp 443/tcp
CMD ["/bin/bash"]
