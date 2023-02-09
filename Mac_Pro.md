# dotfile
config file for my Mac Pro

## Install Homebrew
+ [Homebrew Introduction](https://brew.sh/)
```sh
# Install Homebrew
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

+ Install plugin
```sh
$ brew install bash \
    bash-completion \
    git \
    node \
    parallel \
    zlib \
    cmake \
    htop \
    vim \
    pyenv \
    telnet \
    wget \
    tmux \
    trash \
    nmap \
    p7zip \
    tree \
    bat \
    fd \
    rg \
    dos2unix \
    postgresql \
    convmv

$ brew cast install iina sourcetree
$ brew info zlib # find header files
```

## Bash
```sh
$ cp ./bash/.bash_profile ~/
```

## Git config
```sh
$ cp ./git/.gitconfig ~/ && cp ./git/.gitignore_global ~/
```

## vim
```sh
$ cp ./vim/.vimrc ~/ &&
    curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh &&
    sh ./install.sh &&
    rm ./install.sh
$ vim +NeoBundleInstall +qall
```

## Tmux
+ config file copy from [https://github.com/gpakosz/.tmux](https://github.com/gpakosz/.tmux)
```
$ cp ./tmux/.tmux.conf ~/ &&
    ./tmux/.tmux.conf.local ~/
```

## Change Mac config
```sh
sudo defaults write bluetoothaudiod "Enable AptX codec" -bool true
```

## Jupyter-Notebook
```
pip install jupyter_contrib_nbextensions
jupyter nbextension enable execute_time/ExecuteTime
jupyter nbextension enable varInspector/main
```
