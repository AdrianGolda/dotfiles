alias aliases="vim ~/.bash_aliases && source ~/.bash_aliases"
alias locals="vim ~/.local_aliases"
alias ci3="vim ~/.config/i3/config.base"
alias ci3l="vim ~/.config/i3/config.local"
alias ci3s="bash ~/.config/i3/i3.sh"
alias vimrc="vim ~/.vimrc"
alias pip="pip3"


alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias l='ls -FGlAhp'                        # Preferred 'ls' implementation
alias ls='ls -GFh --color=always'                          # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
alias lsd='ls -d */'

alias cls="printf '\033c'"

function cd_up() {
    cd $(printf "%0.0s../" $(seq 1 $1));
    ls --color=always;
}
alias ..="cd_up"
alias 'cd..'='cd_up'
function cd() {
    new_directory="$*";
    if [ $# -eq 0 ]; then 
        new_directory=${HOME};
    fi;
    builtin cd "${new_directory}" && ls --color=always
}

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

################
# 3. File and folder management
##

#   extract:  Extract most know archives with one command
#   ---------------------------------------------------------
extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}


