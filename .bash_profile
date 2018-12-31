## Custom Functions

# Base 64 a file and copy to clipboard
base64() {
  openssl base64 -in "$1" | tr -d '\n' | pbcopy
}

# Get the process using a TCP port
# portproc($1-port_number)
portproc() {
  lsof -nP -i4TCP:$1 | grep LISTEN
}

## Alias vim to nvim
alias vim="nvim"
alias vi="nvim"

## Override builtin emacs
alias emacs="/usr/local/Cellar/emacs/26.1_1/bin/emacs"

## Development Environments

# Go
export GOPATH=$HOME/Development/Environments/go

# Haskell
export PATH=$PATH:$GOPATH/bin:~/Library/Haskell/bin/

# Nvm
export NVM_DIR="/Users/chriskellendonk/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Commands
alias firefox='open -a FirefoxDeveloperEdition'
alias chrome='open -a /Applications/Google\ Chrome.app'

# Colors on `ls`
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# --------------------------------------
# PROMPT
# --------------------------------------

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# this prompt will show the hostname in green if the last command returned 0,
# otherwise it will be red.
PROMPT_SYMBOL=$'𝝙'  #"<<>>"

if [ "`id -u`" -eq 0 ]; then
    PS1="\n\[\033[m\]|\[\033[1;35m\]\t\[\033[m\]|\[\e[1;31m\]\u\[\e[1;36m\]\[\033[m\]@\[\e[1;36m\]\h\[\033[m\]:\[\e[0m\]\[\e[1;32m\][\W]\[\033[33m\]\$(parse_git_branch)\n\[\033[91m\]$PROMPT_SYMBOL \[\e[0m\]"
else
    PS1="\n\[\033[m\]|\[\033[1;35m\]\t\[\033[m\]|\[\e[1m\]\u\[\e[1;36m\]\[\033[m\]@\[\e[1;36m\]\h\[\033[m\]:\[\e[0m\]\[\e[1;32m\][\W]\[\033[33m\]\$(parse_git_branch)\n\[\033[91m\]$PROMPT_SYMBOL \[\e[0m\]"
fi

export PS1
