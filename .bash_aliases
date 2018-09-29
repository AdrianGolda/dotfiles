alias aliases="vim ~/.bash_aliases && source ~/.bash_aliases"
alias vimrc="vim ~/.vimrc"
alias pip="pip3"

alias cs='cd;ls'
alias lsd='ls -d */'
alias lsdd='ls -d .*/'

alias cls="printf '\033c'"
function cd_up() {
    cd $(printf "%0.0s../" $(seq 1 $1));
}
alias ..="cd_up"
alias 'cd..'='cd_up'

if [ "$LANG" != "en_US.UTF-8" ] && [ "$LANG" != "en_GB.utf8" ]; then
    alias cdd='cd ~/Pobrane'
    alias cdp='cd ~/Pulpit'
else
    alias cdd='cd ~/Downloads'
    alias cdp='cd ~/Desktop'
fi

alias cdv='cd ~/.vim'

alias hibernate='systemctl hibernate'
alias suspend='systemctl suspend'

alias governors='cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors'
alias governor='cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor'

untar(){
    FILE=$1
    if [ -z ${FILE} ]; then
        exit;
    fi
    tar -xvzf $FILE
}

mkcdir()
{
    mkdir -p -- "$1" &&
        cd -P -- "$1"
}

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

fall(){
    WHERE="."
    WHAT="file"
    if [[ -n $1 ]]; then
        WHAT=$1
    fi
    if [[ -n $2 ]]; then
        WHERE=$2
    fi
    echo $WHAT

    echo $WHERE

    grep -rnw $WHERE -e $WHAT
}
if [[ -f ~/.local_aliases ]]; then
    source ~/.local_aliases
fi
