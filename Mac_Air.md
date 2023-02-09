# dotfile
config file for my Mac Air

## Install Homebrew
+ [Homebrew Introduction](https://brew.sh/)
```sh
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

```sh
brew install tmux trash telnet parallel wget xz jq p7zip

brew list
# ==> Formulae
# ca-certificates	jq		libidn2		ncurses		openssl@1.1	p7zip		telnet		trash		wget
# gettext		libevent	libunistring	oniguruma	openssl@3	parallel	tmux		utf8proc	xz
```

## Bash
```sh
$ cp ./bash/.bash_profile ~/
```

## Git config
```sh
$ cp ./git/.gitconfig ~/ && cp ./git/.gitignore_global ~/
```

## Tmux
+ config file copy from [https://github.com/gpakosz/.tmux](https://github.com/gpakosz/.tmux)
```
$ cp ./tmux/.tmux.conf ~/ &&
    ./tmux/.tmux.conf.local ~/
```