#!/bin/bash
clear
rm -rf $HOME/tmprestigrestore
myspeed="2"
#######################################################
echo "version 64"; sleep $myspeed
#######################################################
cd $HOME
ts=$(date +"%s")
if [[ -d start2 ]]
then
  mv start2 start2-backup-$ts
fi
if [[ ! -f color.dat ]]
then
  wget https://raw.githubusercontent.com/abraxas678/start2/main/color.dat
fi
source $HOME/color.dat
#tput cup 1 0 && tput ed; 
echo "[1] DEFINE USERNAME"
echo "[2] INSTALL ZSH -- Oh-my-Zsh -- Antigen FRAMEWORK"
echo "[3] CLONE REPOSITORY"
echo "[4] SETUP RCLONE"
echo "[5] SETUP GPG"
echo ""
#tput cup 7 0 && tput ed
 #  [1] DEFINE USERNAME
 #################################################### [1] DEFINE USERNAME
  printf "${NC}"; printf "${BLUE2}"
  echo; echo; echo "CURRENT USER DETAILS:"; echo; sleep 1
  printf "${NC}"; printf "${BLUE3}"
  echo $USER; echo; sleep 1; id
  printf "${NC}"; printf "${BLUE2}"; 
  echo
  printf "${NC}"; printf "${BLUE2}USE "; printf "${RED}$USER"; printf "${BLUE2} AS USERNAME? (y/n)"
  read -n 1 myanswer
  if [[ $myanswer -ne "y" ]]
  then
    echo; echo; printf "USERNAME TO USE: >>> "; read myuser
    printf "${NC}"; printf "${BLUE3}"
    echo; echo "USING $myuser"; echo; echo BUTTON; read me
    echo; echo "sudo chown $myuser:1000 $HOME -R"
     echo "sudo chmod 700 -R $HOME"
    sudo chown $myuser:100 $HOME -R
    sudo chmod 700 -R $HOME
  fi 
echo
printf "${NC}"; printf "${BLUE2}"; 
echo; printf "DEFINE SPEED (default=2): "; read -n 1 myspeed; echo
############################################################ DEFINE SPEED
printf "${NC}"; printf "${BLUE3}"
echo "speed [$myspeed]"
myspeed1=$(($myspeed-1))
if [[ $myspeed1 -lt "0" ]]
then
  myspeed1=0
fi
myspeed2=$(($myspeed+5))
echo "lower speed [$myspeed1]"; sleep 2
#tput cup 10 10
#delstart="n"
#echo; echo "DELETE FOLDER START? (y/n)"; echo
#read -n 1 -t 5 delstart
#if [[ $delstart = "y" ]]
#then
#  cd $HOME
#  rm -rf 
#fi
echo
printf "${BLUE1}"; printf "${UL1}"
echo; echo "[1] SYSTEM UPATE AND UPGRADE"; sleep $myspeed
##########################################  [1] SYSTEM UPATE AND UPGRADE
printf "${NC}"; printf "${BLUE3}"
echo "sudo apt-get update && sudo apt-get upgrade -y"
echo; sleep 4
sudo apt-get update && sudo apt-get upgrade -y
echo "$EDITOR=/usr/bin/nano" >> $HOME/.bashrc
source $HOME/.bashrc
sudo apt-get install tmux tmuxinator git
cd $HOME
git clone http://github.com/abraxas678/start3.git
echo BUTTON
read me
tmux new-session -d -s "Start2" $HOME/start3/start.sh