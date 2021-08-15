git clone https://github.com/Jhengsh/dotfiles.git
cd dotfiles/
cp ./bash/.bash_profile ~/.bash_profile.local
cp ./git/.gitconfig ~/ && cp ./git/.gitignore_global ~/

# Remove alias
# sed -i -e "s/alias rm='trash'//g" ~/.bash_profile.local

# Remove Mac pyenv Setting
# sed -i -e "s/export PYENV_ROOT/# export PYENV_ROOT/g" ~/.bash_profile.local
# sed -i -e "s/if which pyenv/# if which pyenv/g" ~/.bash_profile.local

echo -e "\nsource ~/.bash_profile.local # load my config" >> ~/.bashrc
