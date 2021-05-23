# .bashrc
[[ $- == *i* ]] || return
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
#JAVA_HOME=$HOME/Apps/JAVA/jdk-11/
PATH="$HOME/Apps:$HOME/.local/bin:$HOME/bin:$JAVA_HOME/bin:$HOME/scripts:$PATH"
export PATH
export EDIT0R=vim
export HISTCONTROL=ignoredups:erasedups:ignorespace
# https://wiki.archlinux.org/index.php/Uniform_look_for_Qt_and_GTK_applications#Styles_for_both_Qt_and_GTK
export QT_QPA_PLATFORMTHEME=qt5ct
# User specific aliases and functions
alias nan='netstat -an |grep LISTEN | grep tcp'
alias gst='git status'
alias gpl='git pull'
alias gca='git add . && git commit -a && git push'
alias ls='ls --color'
alias ll='ls -lhtr'
alias l='ls -lh'
alias la='ls -lhatr'
alias py='python'
alias vi='vim'
# reload and merge .Xresources file
alias rexvt='xrdb ~/.Xresources && pkill urxvt'
alias rxconf='vim ~/.Xresources'
alias vimrc='vim ~/.vimrc'
alias i3conf='vim ~/.config/i3/config'
alias bashrc='vim ~/.bashrc'
alias polyconf='vim ~/.config/polybar/config'
alias psef='ps -ef | grep -i '
alias reload-fontcache='sudo fc-cache -f -v '
alias hist=history
release=$(sed -n 1p  /etc/os-release)
if [[ $release == *"Fedora"* ]]; then
  echo "Running on Fedora " $HOSTNAME
fi
# If running in TTY mode, increase the font size
if [[ 'tty' =~ ^/dev/tty[0-9]+ ]]; then
    setfont /usr/share/kbd/consolefonts/iso02-12x22.psfu.gz &
fi
#Prompt
function prompt() {
Black="\e[30m"
Red="\e[31m"
Green="\e[32m"
LightGreen="\e[32;1m"
Blue="\e[34m"
LightBlue="\e[34;1m"
NC="\e[0m" # No Color
PS1="\[$LightGreen\033(0\154\033(B\][\[\033(0\161\161\033(B$Green\][\[$Red\]\u@\h\[$Green\]]\[\033(0\161\033(B\][\[$Red\]\w\[$Green\]]\[\033(0\161\033(B\][\[$Red\]\!\[$Green\]]\[\033(0\161\161\033(B\]]\n\[$LightGreen\033(0\155\161\033(B$Green\][\[$Red\]\#\[$Green\]]\[\033(0\161\033(B\][\[$Red\]\$\[$Green\]]\[\033(0\161\161\033(B\][\[$NC\]"
PS2="> "
}
if [[ "${DISPLAY%%:0*}" != "" ]]; then
    HILIT=${red}   # remote machine: prompt will be partly red
else
    HILIT=${cyan}  # local machine: prompt will be partly cyan
fi
function fastprompt()
{
    unset PROMPT_COMMAND
    case $TERM in
        *term | rxvt )
            PS1="${HILIT}[\h]$NC \W > \[\033]0;\${TERM} [\u@\h] \w\007\]" ;;
        linux )
            PS1="${HILIT}[\h]$NC \W > " ;;
        *)
            PS1="[\h] \W > " ;;
    esac
}
function _powerprompt()
{
    LOAD=$(uptime|sed -e "s/.*: \([^,]*\).*/\1/" -e "s/ //g")
}

function powerprompt()
{
    PROMPT_COMMAND=_powerprompt
    case $TERM in
        *term | rxvt  )
            PS1="${HILIT}[\A - \$LOAD]$NC\n[\u@\h \#] \W > \
                 \[\033]0;\${TERM} [\u@\h] \w\007\]" ;;
        linux )
            PS1="${HILIT}[\A - \$LOAD]$NC\n[\u@\h \#] \W > " ;;
        * )
            PS1="[\A - \$LOAD]\n[\u@\h \#] \W > " ;;
    esac
}
powerprompt     # This is the default prompt -- might be slow.

