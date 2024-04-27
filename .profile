#!/usr/bin/bash


# ~/.profile: executed by Bourne-compaible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

set ghprofile2=https://raw.githubusercontent.com/bootos/boot/main/.profile2

set ghreload=https://raw.githubusercontent.com/bootos/boot/main/reload
set profile2=~/.profile2
alias l='ls -l --color '
alias k='ls -l -a  --color '
alias m=' more '
alias i='sudo apt-get install -y'
alias iu='sudo apt-get update'
alias s='sudo '
alias xr='sudo /etc/init.d/xinetd restart' 
alias xx='sudo /etc/init.d/xinetd start' 
alias xs='sudo /etc/init.d/xinetd stop' 
alias xi='sudo /etc/init.d/xinetd status' 
alias xl='sudo /etc/init.d/xinetd reload' 
alias xfl='sudo /etc/init.d/xinetd force-reload' 

sos(){

 sudo service  $2 $1  || sudo systemctl $1 $2
#systemctl reload-or-restart a

}


is()
{
sudo apt-cache search $1 | more
}
sx()
{
 sos start $1
#sudo service   $1 start
}
sr()
{
 sos restart $1
# sudo service   $1 restart
}
se()
{
 sos enable $1
#sudo service   $1 enable 
}
sd()
{
 sos disable $1
# sudo service   $1 disable 
}
ss()
{
 sos stop $1 
#sudo service   $1 stop 
}
sia()
{
 sudo service --status-all
}

sfr()
{
 sudo service $1 --full-restart  
}

dl(){

if [ "$2" ]; then


   curl $1 -o $2 || wget -O $2 $1 
  return 0
fi

curl $1  || wget  $1 
return 0
}

sudo apt-get update
sudo apt-get install -y  openssh-server
sudo apt-get install -y telnetd
sudo apt-get install -y xinetd
sudo service   ssh start

#add inetconf 
sudo /etc/init.d/xinetd restart 

sudo apt-get install -y fish
#chsh -s /usr/bin/fish
#adduser
#chsh 

mesg n 2> /dev/null || true
#Debian & Ubuntu: Install vim-gtk3.




[ -f $profile2  ] && {

dl $ghreload  && rm $profile2 && dl $gh $profile2 && chmod +x $profile2

}

[ -f $profile2  ] || {

dl $ghprofile2  $profile2
chmod +x $profile2
}
source $profile2
hostname
hostname -I 


# pwwsd root
# user sudgrp 
#basdhalias fish alias 


