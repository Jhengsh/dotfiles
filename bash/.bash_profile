# Set Alias in Terminal
alias ll='ls -lah'
alias rm='trash'

# Set pyenv
export PYENV_ROOT=/usr/local/var/pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# Set R locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

