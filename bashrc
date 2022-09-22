# .bashrc
[[ $- == *i* ]] || return
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
#JAVA_HOME=$HOME/Apps/JAVA/jdk-11/
#JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.332.b09-1.el9_0.x86_64/
#export JAVA_HOME
PATH="$HOME/Apps:$HOME/.local/bin:$HOME/bin:$JAVA_HOME/bin:$HOME/scripts:$PATH"
export PATH
export EDIT0R=vim
export HISTCONTROL=ignoredups:erasedups:ignorespace
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
alias vim='nvim'
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
function cd {
    builtin cd "$@" && ls -lrth
}
export PATH=/home/egraaf/bin:$PATH
#export DOCKER_HOST=unix:///run/user/1000/docker.sock
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

PATH="/home/egraaf/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/egraaf/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/egraaf/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/egraaf/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/egraaf/perl5"; export PERL_MM_OPT;
