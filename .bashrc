export EC2_HOME=~/local/ec2
#export EC2_PRIVATE_KEY=`ls $EC2_HOME/pk-*.pem`
#export EC2_CERT=`ls $EC2_HOME/cert-*.pem`
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/
PATH=$PATH:$EC2_HOME/bin

PATH=~/bin:/usr/local/bin:$PATH
export PATH

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
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
    #PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    PS1='\u@MacBook:\w\$ '
fi
unset color_prompt force_color_prompt



# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    #PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    #PS1="\[\e]0;\u@MacBook: \w\a\]$PS1"
    PS1="\[\e]0;\u@MacBook: \a\]$PS1"
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

case $(uname) in
    Linux)
      # enable color support of ls and also add handy aliases
      if [ -x /usr/bin/dircolors ]; then
          eval "`dircolors -b`"
          alias ls='ls --color=auto'
          #alias dir='dir --color=auto'
          #alias vdir='vdir --color=auto'
      
          #alias grep='grep --color=auto'
          #alias fgrep='fgrep --color=auto'
          #alias egrep='egrep --color=auto'
      fi
      ;;
    Darwin)
      CLICOLOR=1
      export CLICOLOR
      ;;
esac

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

################################################################
# python virtualenv & virtualenvwrapper
# set virtualenvwrapper env variables
# note: will use the first python found in path (see comment below)
# references:
# http://www.doughellmann.com/docs/virtualenvwrapper/install.html
# http://docwhat.org/2011/06/virtualenv-on-os-x/
################################################################
# set the root path for virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
#
# uncomment and set to use specific python (requires re-source)
# export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2.7
#
# ensure that all new environments are isolated from the
# system site-packages directory
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
#
# pip is designed to work with virtualenv, in that it can be
# given the path to a virtualenv environment (with -E or
# --environment) and it will know to install to that
# environment instead of the system site-package locations.
# the next two lines make pip use the same directory
# for virtualenvs as virtualenvwrapper and detect an
# active (active in the virtualenv/wrapper context)
# virtualenv and install to it, without having to pass it
# the -E parameter
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true
#
export PROJECT_HOME=$HOME/dev
#
# load up all the virtualenvwrapper goodness so you can
# call its commands from the command line easily
source /usr/local/bin/virtualenvwrapper.sh

