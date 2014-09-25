# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# Change the window title of X terminals
case $TERM in
        xterm*|rxvt|Eterm|eterm)
                PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'
                ;;
        screen)
                PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\"'
                ;;
esac
export ignoreeof=0


GREEN='\[\033[01;32m\]'
BLUE='\[\033[01;34m\]'
YELLOW='\[\033[1;33m\]'
NOCOLOR='\[\033[00m\]'

PS1='\n\t '$GREEN'\h '$BLUE'\W'$YELLOW"\$(__git_ps1)"$GREEN' $ '$NOCOLOR

# Aliasy
alias ..='cd ..'
alias ...='cd ../..'
alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias l='ls'
alias ff='firefox'
alias ack='ack-grep'
alias trash='trash-put'
alias go='gnome-open'
alias inst='sudo apt-get install'
alias vimenc='vim -c '\''let $enc =&fileencoding | execute "!echo Encoding:  $enc" | q'\'''
alias node='nodejs'

alias mv='my_mv "$BASH_SOURCE"'
alias cp='my_cp "$BASH_SOURCE"'
alias rm='my_rm "$BASH_SOURCE"'
alias v=vim_in_new_or_existing_window
zhead() {
    zcat "$1" | head
}

vim_in_new_or_existing_window () {
    XDG_CONFIG_HOME=~/.terminal-solarized \
        xfce4-terminal --icon vim \
                       --disable-server \
                       --execute vim --servername VIM --remote-silent "$@" &
}

extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2) tar xjvpf $1 ;;
      *.tar.gz) tar xzvpf $1 ;;
      *.bz2) bunzip2 $1 ;;
      *.rar) unrar e $1 ;;
      *.gz) gunzip $1 ;;
      *.tar) tar xvpf $1 ;;
      *.tbz2) tar xjvpf $1 ;;
      *.tgz) tar xzvpf $1 ;;
      *.zip) unzip "$1" ;;
      *.Z) uncompress $1 ;;
      *.7z) 7z x $1 ;;
      *) echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

my_mv() {
    MY_BASH_SOURCE="$1"
    shift
    if [ -z $MY_BASH_SOURCE ]; then # interactive bash?
        echo "mv --verbose --backup=numbered \"$@\""
        /bin/mv --verbose --backup=numbered "$@"
    else
        /bin/mv "$@"
    fi
}

my_cp() {
    MY_BASH_SOURCE="$1"
    shift
    if [ -z $MY_BASH_SOURCE ]; then # interactive bash?
        echo "cp --verbose --backup=numbered \"$@\""
        /bin/cp --verbose --backup=numbered "$@"
    else
        /bin/cp "$@"
    fi
}

my_rm() {
    MY_BASH_SOURCE="$1"
    shift
    if [ -z $MY_BASH_SOURCE ]; then # interactive bash?
        echo "trash-put \"$@\""
        trash-put "$@"
    else
        /bin/rm "$@"
    fi
}


# Zvetseni historie prikazu
HISTSIZE=50000
HISTFILESIZE=50000
export HISTSIZE HISTFILESIZE

# Adding . and personal bin to path
export PATH=.:~/bin:$PATH

# Making less nicely process archives
eval $(lessfile)

# For colourful man pages (CLUG-Wiki style)
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Less syntax highlighting
#export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
#export LESS=' -R '

#export PAGER=/usr/share/vim/vim72/macros/less.sh
#alias less=/usr/share/vim/vim72/macros/less.sh

export PATH=/home/miroslav/bin/Sencha/Cmd/3.1.2.342:$PATH

export SENCHA_CMD_3_0_0="/home/miroslav/bin/Sencha/Cmd/3.1.2.342"

export PERL_LOCAL_LIB_ROOT="$PERL_LOCAL_LIB_ROOT:/home/miroslav/perl5";
export PERL_MB_OPT="--install_base /home/miroslav/perl5";
export PERL_MM_OPT="INSTALL_BASE=/home/miroslav/perl5";
export PERL5LIB="/home/miroslav/perl5/lib/perl5:$PERL5LIB";
export PATH="/home/miroslav/perl5/bin:$PATH";

stty -ixon #disable Ctrl-S

source ~/perl5/perlbrew/etc/bashrc

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
