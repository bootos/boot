#!/bin/bash
# alias wrap_args='f(){ echo before "$@" after;  unset -f f; }; f'
#mount –o rw,remount /
#sudo passwd root

setpasswd () {


#adduser "$1"
echo "$2" | passwd "$1" --stdin

 passwd "$1" <<< "$2" 

  echo -e "$2\n$2" | (passwd $1)

  echo "$1:$2" | chpasswd

   echo "$1:$2" | sudo chpasswd
   echo "$1:$2" | chpasswd
   echo "$1:$2" | sudo chpasswd

echo $2 | passwd --stdin $1 # Eternal Sin.
echo "$2" | passwd --stdin $1 # Eternal Sin, but at least you remembered to quote your PE.
passwd --stdin $1 <<< "$2" # A little less insecure, still pretty insecure, though.
passwd --stdin $1 < "$2" # With a password file that was created with a secure `umask(1)`, a little bit secure.

#passwd --stdin  <<< $(pass somehost/someuser) 

passwd $1 << EOD
$2
$2
EOD
#adduser $user
echo $2 | passwd --stdin $1

passwd $1 << EOD
$3
$2
$2
EOD
}

passwdsudocmd () {

(echo '$1' | sudo -S $2) || (echo '$1' | sudo -kS $2 )

}

#setpasswd  root root




sudo apt-get update
sudo apt-get install -y telnet 
sudo apt-get install -y telnetd 
sudo apt-get install -y inetd
sudo apt-get install -y telnet-server
sudo apt-get install -y xinetd 

sudo apt-get install -y openssh-client 
sudo apt-get install -y openssh-server

sudo apt install -y tightvncserver

sudo apt install -y xrdp

sudo apt install -y telnetd telnet

sudo /etc/init.d/xinetd restart 

sudo echo "telnet stream tcp nowait telnetd /usr/sbin/tcpd /usr/sbin/in.telnetd" >> /etc/inetd.conf

# /etc/inetd.conf
#telnet stream tcp nowait telnetd /usr/sbin/tcpd /usr/sbin/in.telnetd

#sudo nano /etc/inetd.conf

#defaults
#{
# log_type = SYSLOG daemon info
#instances = 60
#log_type = SYSLOG authpriv
#log_on_success = HOST PID
#log_on_failure = HOST
#cps = 25 30
#}

sudo echo "service telnet \
 {\
  disable = no\
  flags = REUSE\
  socket_type = stream\
  wait = no\
  user = root\
  server = /usr/sbin/in.telnetd\
  log_on_failure += USERID\
 } " >> /etc/xinetd.d/telnet




sudo echo "service telnet
{\
	disable = no\
	flags = REUSE\
	socket_type = stream\
	wait = no\
	user = root\
	server = /usr/sbin/in.telnet\
	log_on_failure += USERID\
}" >> /etc/xinetd.d/telnet


#{
# log_type = SYSLOG daemon info
#	instances = 60
#	log_type = SYSLOG authpriv
#	log_on_success = HOST PID
#	log_on_failure = HOST
#	cps = 25 30
#}

sudo ufw allow 23

sudo echo "telnet        23/tcp " >> /etc/services 



sudo echo "service telnet
{\
	disable = no\
	flags = REUSE\
	socket_type = stream\
	wait = no\
	user = root\
	server = /usr/sbin/in.telnetd\
	log_on_failure += USERID\
}" >> /etc/xinetd.d/telnet


#only_from = 192.168.120.0/24 #Only users in 192.168.120.0 can access to
#only_from = .bob.com #allow access from bob.com
#no_access = 192.168.120.{101,105} #not allow access from the two IP.
#access_times = 8:00-9:00 20:00-21:00 #allow access in the two times

sudo service xinetd restart

sudo systemctl restart xinetd.service

sudo systemctl start xinetd.service
sudo /etc/init.d/xinetd restart 



#Match Address 10.0.0.0/8,172.16.0.0/12,192.168.0.0/16


sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
#PermitRootLogin without-password
sudo sed -i 's/ChallengeResponseAuthentication yes/ChallengeResponseAuthentication no/' /etc/ssh/sshd_config
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo sed -i 's/PubKeyAuthentication yes/PubKeyAuthentication no/' /etc/ssh/sshd_config

sudo echo "PermitRootLogin yes">> /etc/ssh/sshd_config
sudo echo "ChallengeResponseAuthentication no">> /etc/ssh/sshd_config
sudo echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
sudo echo "PubKeyAuthentication no">> /etc/ssh/sshd_config


sudo systemctl restart sshd
sudo service sshd restart
sudo /etc/init.d/sshd restart
#sudo passwd root

# ssh -o PreferredAuthentications=password -o PubkeyAuthentication=no -o PasswordAuthentication=yes itslinuxfoss@192.168.222.135



test -f ~/.ssh/id_rsa.pub || ssh-keygen -t rsa


#scp ~/.ssh/id_rsa.pub destID@destMachine:/tmp/ #type password

#ssh destID@destMachine #type password

cat /tmp/id_rsa.pub >> ~/.ssh/authorized_keys

rm /tmp/id_rsa.pub

# ssh -o PreferredAuthentications=password -o PubkeyAuthentication=no exampleUser@example.com

sudo adduser z
#groupadd test
sudo usermod -G root a
sudo usermod -g 0 -o a
sudo useradd -m -G root x
sudo useradd -c “admin” -d /home/a -m -k /etc/skel -s /bin/bash -u 0 -o -g root a

sudo usermod -aG sudo z 
 
sudo adduser z sudo


sudo usermod -aG sudo puppy 


#ssh [remote_username]@[server_ip_address] "chmod 700 .ssh; chmod 640 .ssh/authorized_keys"


#cat .ssh/id_rsa.pub | ssh [remote_username]@[server_ip_address] 'cat >> .ssh/authorized_keys'
chmod 0600 /home/$user/.ssh/authorized_keys

chmod 0700 /home/$user/.ssh
chmod 0700 /home/$user


#ssh –D 5534 pnap@ssh.server.com

sudo systemctl restart sshd


sudo nano /etc/ssh/sshd_config
sudo service ssh restart


sudo iptables -A INPUT -p tcp --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
sudo lsof -i -n -P | grep LISTEN
sudo ufw allow ssh

sudo systemctl start sshd

sudo systemctl enable sshd

sudo apt update



sudo systemctl status inetd

sudo ufw allow 23/tcp

sudo ufw reload

sudo yum update
sudo yum install telnet telnet-server -y

sudo systemctl start telnet.socket
sudo systemctl enable telnet.socket

sudo firewall-cmd --permanent --add-port=23/tcp
sudo firewall-cmd --reload

sudo /etc/init.d/inetd restart
# /etc/xinetd.d/telnet  disable = yes.
sudo  chkconfig telnet on
sudo  /etc/init.d/xinetd restart 



sudo service iptables save
sudo service iptables restart
sudo firewall-cmd --reload
sudo  systemctl restart firewalld

sudo iptables -I INPUT 5 -m state --state NEW -m tcp -p tcp -m multiport --dports 5902:5904 -j ACCEPT

sudo firewall-cmd --zone=public --add-port=5902-5904/tcp

 sudo ufw allow 5901:5910/tcp



sudo  iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 5901 -j ACCEPT
sudo firewall-cmd --zone=public --add-port=5901/tcp sudo ufw allow 5901/tcp


sudo systemctl enable vncserver@:1 --now
sudo systemctl start vncserver@:1 --now

# su - tecmint
#[tecmint@tecmint ~]$ vncpasswd
#sudo adduser tecmint
#sudo passwd tecmint


sudo cp /etc/sudoers /root/sudoers.bak

sudo echo "%sudo ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

sudo sh -c 'echo "$(logname) ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/$(logname)'

sudo chmod 440 /etc/sudoers.d/$(logname) – 

sudo  echo "username ALL=(ALL:ALL) NOPASSWD: ALL"  | sudo tee /etc/sudoers.d/username

sudo echo 'password' | sudo -kS command


sudo -S <<< "password" command

sudo echo "$USER ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/$USER

sudo echo "username ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers.d/local

#root    ALL=(ALL:ALL) ALL
#%sudo   ALL=(ALL:ALL) ALL
#u ALL=(ALL) NOPASSWD:ALL
#ubuntu ALL=(ALL) NOPASSWD:ALL
#debian ALL=(ALL) NOPASSWD:ALL
#user ALL=(ALL) NOPASSWD:ALL




#ssh -vvv [server_ip]
#ssh -L 5901:localhost:5901 -N -f -l username hostname_or_IP


ip -a 
