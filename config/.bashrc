# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
# alias ll='ls -halF'
alias ll='ls -hl'
alias lla='ls -hAl'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
###############################################################################
#                             BASH CONFIGURATION                              #
###############################################################################
#################################### SHELL ####################################
eval `dircolors ~/.dir_colors`
## make color displayed correctly in vim from guake
if [ $TERM == "xterm" ]; then
    export TERM=xterm-256color
fi

## look for PID of parent process
parent=$(ps -o 'cmd=' $(ps -o 'ppid=' $$))
## from guake or not
[ "$(echo $parent | grep 'guake')" == "" ] && FROM_GUAKE=FALSE || FROM_GUAKE=TRUE
## avoid nestted invoking tmux
[ "$(echo $parent | grep 'tmux')" == "" ] && FROM_TMUX=FALSE || FROM_TMUX=TRUE
## avoid from ssh link
[ "$(echo $parent | grep 'sshd')" == "" ] && FROM_SSH=FALSE || FROM_SSH=TRUE

## gnome-terminal or guake
[ $FROM_GUAKE == "TRUE" ] && FROM_GNOME=FALSE || FROM_GNOME=TRUE

export FROM_TMUX
export FROM_SSH
export FROM_GUAKE
export FROM_GNOME

#### ALIAS
alias ssh2='ssh -X xuwutao@124.16.143.99'
alias sfat='ssh -X xuwutao@159.226.161.107 -i ~/.ssh/xuwutao_id_rsa'
alias cdd='cd ~/Downloads'
alias cdc='cd ~/Documents'
alias cdp='cd ~/program'
alias cdw='cd ~/workspace'
alias ..='cd ..'
alias ...='cd ../..'
alias cls='clear'
alias vim='vim --servername vim'
alias jupyter='nohup jupyter notebook > ~/Documents/python/jupyter/jupyter.log 2>&1 &'

#### BINDINGS
bind 'set completion-ignore-case on'
bind 'set visible-stats on'

################################### PLUGIN ####################################
#### FOR AUTOJUMP 
[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && . ~/.autojump/etc/profile.d/autojump.sh

#### FOR THEFUCK
if [ $FROM_SSH == "FALSE" ]; then
    eval "$(thefuck --alias fuck)"
fi

#### FOR POWERLINE
if [ $FROM_SSH == "FALSE" ]; then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    source $HOME/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
fi

#### FOR FZF 
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
## layout
export FZF_DEFAULT_OPTS="--reverse --height=45% "
## preview command
export FZF_DEFAULT_OPTS+="--preview=\"cat {+}\" "
## preview-window
export FZF_DEFAULT_OPTS+="--preview-window=right:50%:wrap:hidden "
## toggle options
export FZF_DEFAULT_OPTS+="--bind=alt-k:preview-up,alt-j:preview-down,"
export FZF_DEFAULT_OPTS+="alt-u:preview-page-up,alt-d:preview-page-down,"
export FZF_DEFAULT_OPTS+="alt-p:toggle-preview,alt-w:toggle-preview-wrap,"
## option 'in/out' works when --multi exists
export FZF_DEFAULT_OPTS+="alt-i:toggle-in,alt-o:toggle-out"


############################### UBUNTU SOFTWARE ###############################
#### FOR SSH 
export office=xuwutao@124.16.143.99:/home/xuwutao
export xuwutao="-i ~/.ssh/xuwutao_id_rsa xuwutao@159.226.161.107:/public/home/xuwutao"

#### FOR JAVA
export JAVA_HOME=$HOME/program/jdk1.8.0_144
export JRE_HOME=$HOME/program/jdk1.8.0_144/jre 
export CLASSPATH=.:$CLASSPATH:$JAVA_HOME/lib:$JRE_HOME/lib 
export PATH=$JAVA_HOME/bin:$JRE_HOME/bin:$PATH 

#### FOR PYTHON
## python virtualenvs
export WORKON_HOME=$HOME/.virtualenvs
source $HOME/.local/bin/virtualenvwrapper.sh
## python wigner-function
export PATH=$HOME/program/wigxjpf-1.6/bin:$PATH
export LD_LIBRARY_PATH=$HOME/.local/lib:$LD_LIBRARY_PATH

#### TEXLIVE 2016
PATH=$HOME/program/texlive/2016/bin/x86_64-linux:$PATH; export PATH
MANPATH=$HOME/program/texlive/2016/texmf-dist/doc/man:$MANPATH; export MANPATH
INFOPATH=$HOME/program/texlive/2016/texmf-dist/doc/info:$INFOPATH; export INFOPATH

#### FOR COSMOMC  
## intel fortran compiler
source $HOME/program/intel/compilers_and_libraries_2017.2.174/linux/bin/compilervars.sh intel64
## openmpi
export PATH=$HOME/program/openmpi/bin:${PATH}
## cfitsio
export LD_LIBRARY_PATH=$HOME/program/cfitsio/lib:${LD_LIBRARY_PATH}
## pgplot
PATH=$HOME/program/pgplot:$PATH
 PGPLOT_DIR=$HOME/program/pgplot/;export PGPLOT_DIR
 export LD_LIBRARY_PATH=$HOME/program/pgplot:${LD_LIBRARY_PATH}
 PGPLOT_FONT=$HOME/program/pgplot/grfont.dat ;export PGPLOT_FONT
 PGPLOT_DEV=/Xserve;export PGPLOT_DEV
## healpix
export PATH=$HOME/program/Healpix_3.31/bin:${PATH}
## python library in cosmomc
export PYTHONPATH=$HOME/workspace/CosmoMC-June2016/python:$PYTHONPATH



if [ $FROM_SSH == "FALSE" ]; then
    if [ $FROM_GNOME == "TRUE" -a $FROM_TMUX == "FALSE" ]; then
        session=GNOME
        tmux has -t $session > /dev/null 2>&1
        if [ $? != 0 ]; then
            tmux new -d -n "vim" -s $session "vim"
            tmux new-window -t $session
            tmux split-window -h -t $session:2
            tmux select-window -t $session:2
        fi
        tmux attach -t $session
        echo "exit from tmux-session..."
    fi
fi
