# Set Alias in Terminal
alias ll='ls -lah'
alias loadenv='load_env'
alias pe="poetry export | grep '==' | grep -v 'pypiwin32' | grep -v 'pywin32' | sed 's/;.*//g' | sed 's/ .*//g'"
alias grepem='grep -v "^\s*$"'

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
alias dst='docker stats --no-stream'
alias dr='docker run'
alias dlf='docker logs -f'
alias dn='docker network'
alias dc='docker-compose'
alias gitfp='git fetch --prune'
alias gitst='git status'
alias gitcom='git checkout master'
alias gitpu='git push --set-upstream origin `git rev-parse --abbrev-ref HEAD`'

# K8S
alias ku='kubectl'
alias kupo='kubectl get pod | grep -v Completed'
alias kuap='kubectl apply -f'
alias kulog='kubectl logs'
alias kugetres='kubectl describe nodes | grep -A 4 Resource'

# alias for shortcut
alias clean_known_hosts='rm ~/.ssh/known_hosts'
alias clean_ipynb_checkpoints='find . -type d | grep "\.ipynb_checkpoints/\?" | xargs -n1 rm -rf'
alias clean_ds_store='find . | grep "\.DS_Store$" | xargs -n1 rm'
alias get_ip='curl http://checkip.amazonaws.com'
alias getip='curl http://checkip.amazonaws.com'
alias pingdns='ping 8.8.8.8'

# Set NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion


if [[ "$OSTYPE" == "linux-gnu" ]]; then
    [[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

    # Set pyenv
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    if which pyenv >/dev/null; then eval "$(pyenv init -)"; fi
    alias ip4='ip -4 addr'
elif [[ "$OSTYPE" == "darwin"* ]]; then

    # Set Alias in Terminal
    alias rm='trash'
    alias macunzip='ditto -V -x -k --sequesterRsrc'

    function convertheic() {
        for i in *.HEIC ; sips -s format jpeg "$i" --out "$i.jpg"
    }

    # Set R locale
    export LANG=en_US.UTF-8
    export LC_ALL=en_US.UTF-8

    # JAVA_HOME
    if [ -f "/usr/libexec/java_home" ]; then
        export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"
    fi

    # Set pyenv
    export PYENV_ROOT=/usr/local/var/pyenv
    export PATH="/usr/local/var/pyenv/shims:$PATH"
    if which pyenv >/dev/null; then eval "$(pyenv init -)"; fi

    # GVM
    [[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
    export VSCODE_CONFIG_DIR="$HOME/Library/Application Support/Code - Insiders/User"
    export VSCODE_EXTENSIONS_DIR="$HOME/.vscode-insiders/extensions"

    # Export variables for pyenv install 3.7
    export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/openssl/lib"
    export CPPFLAGS="-I/usr/local/opt/zlib/include"
    export CFLAGS="-I$(xcrun --show-sdk-path)/usr/include"

    # Allow multithreading applications
    export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

    # Add PATH
    export PATH=~/bin:$PATH

    # Set Spark PATH
    # export SPARK_HOME=~/Spark
    # export PATH=$PATH:$SPARK_HOME/bin
    # export PYSPARK_DRIVER_PYTHON=jupyter
    # export PYSPARK_DRIVER_PYTHON_OPTS='notebook'

    # flutter
    export PATH=$PATH:~/flutter/bin

fi

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
	docker images | awk '{if ( $1 == "<none>" || $2 == "<none>" ) print $3}' | xargs -n 1 docker rmi
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

function getintip() {
    if [[ "$OSTYPE" == "linux-gnu" ]]; then
        ip -4 addr | grep eth0 | grep inet | sed -e "s/inet//g" -e "s/brd.*//g" -e "s/ // g" -e "s/\/24//g"
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        ifconfig | grep "inet " | grep "broadcast" | sed -e "s/inet//g" -e "s/netmask.*//g" -e $'s/\t//g' -e "s/ //g"
    fi
}

function dud() {
    du -h -d 1 | sort -hr
}

function dis(){
    docker images | awk 'NR<2{print $0;next}{print $0| "sort -k7 -hr"}'
}

function digr(){
     docker images | grep $1
 }

function poetryfreeze(){
    poetry export | grep "==" | sed -e 's/;.*//g'
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
    PORT=$2
    PORT=${PORT:-8000}
    rm -f ${FILE:0:-5}slides.html
    jupyter nbconvert $FILE --to slides --post serve --ServePostProcessor.port=$PORT
}

function range() {
    START=$1
    END=$2
    START=${START:-0}
    END=${END:-9}
    for i in {$START..$END};do echo $i; done
}

# K8S

function kudel() {
     POD_NAME=$1
     NAMESPACE=$2
     NAMESPACE=${NAMESPACE:--A}
     kubectl get pod $NAME | grep $POD_NAME | awk '{print $1}' | xargs -n1 kubectl delete pod
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

    if [[ "$want_type" -eq "directory" ]]
    then
        ls -lh | grep -v '^d' | awk 'BEGIN{}{print $9}' | sed -n '2,$'p
    elif [[ "$want_type" -eq "file" ]]
    then
        ls -alh | grep -v '^d' | awk 'BEGIN{}{print $9}' | sed -n '2,$'p
    elif [[ "$want_type" -eq "directory" ]]
    then
        ls -alh | grep '^d' | awk 'BEGIN{}{print $9}' | sed -n '2,$'p
    else
        ls -lh | grep -v '^d' | awk 'BEGIN{}{print $9}' | sed -n '2,$'p
    fi
}
