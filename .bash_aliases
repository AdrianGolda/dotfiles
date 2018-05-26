alias aliases="vim ~/.bash_aliases && source ~/.bash_aliases"
alias vimrc="vim ~/.vimrc"
alias fixpaste='printf "\e[?2004l"'
alias cdpr='cd ~/Pulpit/PR/'
alias cdt='cd ~/.config/terminator'
mounted(){
    mount -v | grep "^/" | awk '{print "\nPartition identifier: " $1  "\n Mountpoint: "  $3}'
}

alias cs='cd;ls'
alias lsd='ls -d */'
alias lsdd='ls -d .*/'

alias cls="printf '\033c'"
alias cd..="cd .."
alias ..="cd .."
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
alias pscsgo='psg csgo | awk "{print $2}"'

function cd_
{
  [[ -d "$@" ]] || return 1
  echo "$@" > ~/.last_dir
  cd "$@"
}

cdb(){
    COUNT=$1
    if [ -z ${COUNT} ]; then
        COUNT=1
    fi
    for (( COUNT=1; c<=COUNT; c++ ))
    do
	`cd ..`
    done
}

alias explore='dolphin .'
alias suexplore='sudo dolphin .'

alias try='gnome-open'
alias text='gedit &'
alias sutext='gksudo gedit &'
alias sa='source ~/.bash_aliases;echo "Bash aliases sourced."'

alias s='sudo '
alias g='git'
alias q='exit'

cl () { cd $@ && ls -F; }

alias cdd='cd ~/Pobrane'
alias cdp='cd ~/Pulpit'
alias cdv='cd ~/.vim'
alias cdSteam='cd ~/.local/share/Steam/steamapps/common/Counter-Strike\ Global\ Offensive'

alias cdc='cd ~/programming/c'
alias cdcpp='cd ~/programming/c++'
alias cdass='cd ~/programming/assembly'
alias cdjava='cd ~/programming/java'

alias update='sudo apt-get update'

alias hibernate='systemctl hibernate'
alias suspend='systemctl suspend'

alias install='sudo apt-get install '
alias remove='sudo apt-get remove '

gamma() {
GAMMA=$1
    if [ -z ${GAMMA} ]; then
        GAMMA=1
    fi
    xgamma -gamma $GAMMA
}
alias gamma2='xgamma -gamma 1.6'

test-microphone() {
    arecord -vvv -f dat /dev/null
}
title(){
    TITLE=`ps aux | awk 'FNR == 1 {print}'`
    echo "$TITLE"
}
untar(){
    FILE=$1
    if [ -z ${FILE} ]; then
        exit;
    fi
    tar -xvzf $FILE
}

alias csgo='~/scripts/csgo-renice.sh '
alias killvlc='~/scripts/killvlc.sh '

alias disablespikes='sudo killall -STOP NetworkManager'
alias enablespikes='sudo killall -CONT NetworkManager'

alias res='xrandr -s 1920x1080'
alias res2='xrandr -s 1024x768 -r 75'

alias rocket='ds4drv --hidraw'


# Programy
alias clion='/usr/bin/clion-2017.2.1/bin/clion.sh'

kp(){
FILE=$1
    if [ -z ${FILE} ]; then
        echo "Tell me what you want to kill"
    fi
    PID=`ps aux | grep xbindkeys | head -n -1 | awk '{print $2}'`
    if [[ ! -z "${PID// }" ]]; then
        echo $PID
        #echo test
        kill $PID
    fi
    
}
