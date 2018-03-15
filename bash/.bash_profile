# Set Alias in Terminal
alias ll='ls -lah'
alias rm='trash'

# docker alias
alias di='docker images'
alias dps='docker ps -a'
alias drm='docker rm'
alias drma='dRmAll'
alias drmi='docker rmi'
alias dstart='docker start'
alias dstop='docker stop'

# User define function
function dRmAll(){
 docker ps -aq | xargs -n 1 docker rm
}

# Set pyenv
export PYENV_ROOT=/usr/local/var/pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# Set R locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

