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
apt-get install fzf

# ? Configure .zshrc
curl -o ~/.zshrc https://github.com/TheYkk/devkit/raw/master/.zshrc
source ~/.zshrc

# ? Install Docker
curl https://get.docker.com | sh
usermod -aG docker $(whoami)
curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose


# ? Install Snap
apt install -y snapd

# ? Install Nodejs 12
snap install node --channel=12/stable --classic

# ? Install yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
apt update && apt install -y yarn

# ? Yarn packages
yarn global add nodemon 
yarn global add pino-pretty
yarn global add @vue/cli 
yarn global add eslint

# ? Install VS CODE
snap install code --classic

# ? Install Postman
snap install postman

# ? Install Insomnia
snap install insomnia

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

# ? Install DataGrip
snap install datagrip --classic

# ? Install Git flow
apt-get install git-flow

# ? Install hey
curl https://storage.googleapis.com/hey-release/hey_linux_amd64 > /usr/local/bin

# ? Install k3sup
curl -sLS https://get.k3sup.dev | sh
install k3sup /usr/local/bin/

# ? Install Chrome
snap install chromium

# ? Install Brave
snap install brave

# ? Install Tilix
apt install -y tilix

# ? Install fonts
wget https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/SourceCodePro/Regular/complete/Sauce%20Code%20Pro%20Nerd%20Font%20Complete.ttf?raw=true
fc-cache -f -v ~/
apt install -y fonts-firacode

# ? Install Kleopatra
apt-get install -y kleopatra

# ? Install SKM
wget https://github.com/TimothyYe/skm/releases/download/V0.8/skm-linux64-0.8.tar.gz
tar -zxf skm-linux64-0.8.tar.gz
mv ./skm /usr/local/bin

# ? Generate ssh key
skm c new_dev -b 4096 -C yusufkaan142@gmail.com

curl -Lo skaffold https://storage.googleapis.com/skaffold/releases/latest/skaffold-linux-amd64
chmod +x skaffold
sudo mv skaffold /usr/local/bin

curl https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy > /usr/local/bin/diff-so-fancy
chmod +x /usr/local/bin/*