# ? Core
apt -y update
apt install -y curl cmake 

# ? Install Git
apt install -y git

# ? Install Zsh
apt install -y zsh
chsh -s $(which zsh)

# ? Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# ? Spaceship Prompt | Spaceship docs
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# ? Zsh Autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo "bindkey '^ ' autosuggest-accept" >> $ZSH_CUSTOM/autosuggestion-settings.zsh
source $ZSH_CUSTOM/autosuggestion-settings.zsh

# ? Zsh Syntax Highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# ? Install fzf
apt install fzf

# ? Configure .zshrc
curl -o ~/.zshrc https://github.com/TheYkk/devkit/raw/master/.zshrc
source ~/.zshrc

# ? Install Docker
curl https://get.docker.com | sh
usermod -aG docker $(whoami)
curl -L "https://github.com/docker/compose/releases/download/1.28.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose


# ? Install Snap
apt install -y snapd

snap install code --classic

# ? Install Kubectl
snap install kubectl --classic

# ? Install Kubectx
apt install -y kubectx

# ? Install Kube-alias
curl https://raw.githubusercontent.com/ahmetb/kubectl-alias/master/.kubectl_aliases > ~/.kubectl_aliases

# ? Install Helm
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

# ? Install Golang
snap install go --classic


# ? Install Git flow
apt install git-flow

# ? Install Tilix
apt install -y tilix

# ? Install fd-find
apt install fd-find

# ? Install fonts
wget https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/SourceCodePro/Regular/complete/Sauce%20Code%20Pro%20Nerd%20Font%20Complete.ttf?raw=true
fc-cache -f -v ~/
apt install -y fonts-firacode

curl https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy > /usr/local/bin/diff-so-fancy
chmod +x /usr/local/bin/*

apt install aws

apt install flameshot