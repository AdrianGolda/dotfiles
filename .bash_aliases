alias aliases="vim ~/.bash_aliases && source ~/.bash_aliases"
alias vimrc="vim ~/.vimrc"
alias pip="pip3"

alias lookup='python3 ~/code/python/html_parser.py'

alias cs='cd;ls'
alias lsd='ls -d */'
alias lsdd='ls -d .*/'

alias cls="printf '\033c'"
function cd_up() {
  cd $(printf "%0.0s../" $(seq 1 $1));
}
alias ..="cd_up"
alias 'cd..'='cd_up'

function cd_
{
  [[ -d "$@" ]] || return 1
  echo "$@" > ~/.last_dir
  cd "$@"
}

alias explore='nemo .'
alias suexplore='sudo nemo .'

alias try='gnome-open'
alias sa='source ~/.bash_aliases;echo "Bash aliases sourced."'

if [ "$LANG" != "en_US.UTF-8" ]; then
    alias cdd='cd ~/Pobrane'
    alias cdp='cd ~/Pulpit'
else
    alias cdd='cd ~/Downloads'
    alias cdp='cd ~/Desktop'
fi

alias cds='cd /mnt/shared'
alias cdmn='cd /mnt/shared/PG/MN/MN2'

alias cdb='cd ~/Books'
alias cdv='cd ~/.vim'
alias cdSteam='cd ~/.local/share/Steam/steamapps/common/Counter-Strike\ Global\ Offensive'

alias hibernate='systemctl hibernate'
alias suspend='systemctl suspend'

test-microphone() {
    arecord -vvv -f dat /dev/null
}
untar(){
    FILE=$1
    if [ -z ${FILE} ]; then
        exit;
    fi
    tar -xvzf $FILE
}

alias disablespikes='sudo killall -STOP NetworkManager'
alias enablespikes='sudo killall -CONT NetworkManager'

alias res='xrandr -s 1920x1080'
alias res2='xrandr -s 1024x768 -r 75'

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

alias governors='cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors'
alias governor='cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor'

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
mkcdir ()
{
    mkdir -p -- "$1" &&
      cd -P -- "$1"
}

