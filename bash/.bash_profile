# Set Alias in Terminal
alias ll='ls -lah'
alias rm='trash'

# tmux alias
alias tm='tmux'
alias tma='tmux a -t'
alias tml='tmux ls'

# docker alias
alias di='docker images'
alias de='docker exec'
alias dps='docker ps -a'
alias drm='docker rm'
alias drmi='docker rmi'
alias dstart='docker start'
alias dstop='docker stop'
alias dr='docker run'
alias dn='docker network'
alias gitfp='git fetch --prune'

# Set pyenv
export PYENV_ROOT=/usr/local/var/pyenv
if which pyenv >/dev/null; then eval "$(pyenv init -)"; fi

# Export variables for pyenv install 3.7
# export LDFLAGS="-L/usr/local/opt/zlib/lib"                                                             jhengsh@Jhengshs-MBP
# export CPPFLAGS="-I/usr/local/opt/zlib/include"
# export CFLAGS="-I$(xcrun --show-sdk-path)/usr/include"

# Set Spark PATH
export SPARK_HOME=~/Spark
export PATH=$PATH:$SPARK_HOME/bin
export PYSPARK_DRIVER_PYTHON=jupyter
export PYSPARK_DRIVER_PYTHON_OPTS='notebook'


# Set R locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Set NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# JAVA_HOME
export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"

# Allow multithreading applications
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Gcloud Setting
export CLOUDSDK_PYTHON=/usr/local/var/pyenv/shims/python

# User define function
function gityapf() {
	git status | tee | grep 'modified\|new file' | grep .py | sed 's/modified://g' | sed 's/new file://g' | xargs -n1 yapf -ir
}

function gitdm(){
    BRANCH=$1
    MERGED_BRANCH=${BRANCH:-master}
    echo  "Delete branch which already merge to $MERGED_BRANCH"
    git branch --merged $MERGED_BRANCH | grep -v $MERGED_BRANCH | xargs -n 1 git branch -d
}

function drma() {
	docker ps -qa --filter "status=exited" | xargs -n 1 docker rm
}

function dstarta() {
    docker ps -qa --filter "status=exited" | xargs -n 1 docker start
}
function drmin() {
	docker images | awk '{if ( $1 == "<none>" ) print $3}' | xargs -n 1 docker rmi
}

function drmc() {
	docker ps -aq --filter "status=created" | xargs -n 1 docker rm
}

function dstopa() {
	docker ps -aq | xargs -n 1 docker stop
}

function drmf() {
    CONTAINER_ID=$1
    echo "Stop Container $CONTAINER_ID"
    docker stop $CONTAINER_ID
    echo "remove Container $CONTAINER_ID"
    docker rm $CONTAINER_ID
}


function dud() {
    du -h -d 1 | sort -hr
}

function convpy() {
	sed -e ':a' -e 'N' -e '$!ba' -e 's/\n\n# In\[[0-9\]*]:\n\n/ /g' $1 | sed -n '2,$'p
}

function iconvbu() {
    RAW_FILE=$1
    NEW_FILE=$2
    NEW_FILE=${NEW_FILE:-$RAW_FILE.utf8}
    iconv -f BIG-5 -t UTF-8 $RAW_FILE > $RAW_FILE.tmp
    mv $RAW_FILE.tmp $NEW_FILE
}

function load_env() {
    ENV_FILE=$1
    ENV_FILE=${NEW_FILE:-.env}
    export $(grep -v '^#' .env | xargs )
}

function jupyter_serve() {
    FILE=$1
    jupyter nbconvert $FILE --to slides --post serve
}

function lf(){
    while [[ "$#" -gt 0 ]]
    do
        case $1 in
        -f|--file)
            local want_type="file"
            ;;
        -d|--directory)
            local want_type="directory"
            ;;
        -a|--all)
            local want_type="all"
            ;;
        esac
        shift
    done

    if [[ "$want_type" -eq "directory" ]]; then
        ls -lh | grep -v '^d' | awk 'BEGIN{}{print $9}' | sed -n '2,$'p
    elif [[ "$want_type" -eq "file" ]]; then
        ls -alh | grep -v '^d' | awk 'BEGIN{}{print $9}' | sed -n '2,$'p
    elif [[ "$want_type" -eq "directory" ]]; then
        ls -alh | grep '^d' | awk 'BEGIN{}{print $9}' | sed -n '2,$'p
    else;
        ls -lh | grep -v '^d' | awk 'BEGIN{}{print $9}' | sed -n '2,$'p
    fi
}
