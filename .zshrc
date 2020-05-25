export ZSH=$HOME/.oh-my-zsh

# export UPDATE_ZSH_DAYS=14
# export DISABLE_UPDATE_PROMPT=true

ZSH_THEME="spaceship"
ZSH_DISABLE_COMPFIX="true"
plugins=(  git
  # node
  extract
  # go 
  fzf
  golang
  gitignore
  git-extras 
  git-flow
  # docker 
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

export GOROOT=/snap/go/current
export GOPATH=$HOME/go:$HOME/dev
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
export PATH="$PATH:$(yarn global bin):$HOME/.fzf/:$HOME/.config/composer/vendor/bin"
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:/usr/local/bin/istio-1.5.0/bin
export PATH=$PATH:$HOME/.wasme/bin

export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export REACT_EDITOR="code --wait"
export EDITOR="code --wait"

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

alias ..='cd ..'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias ...='cd ../..'
alias c='clear'
alias h='cd ~'
alias dc='docker-compose '
function dbuild(){
  DOCKER_BUILDKIT=1 docker build . -t $1
  docker push $1
}
alias d='docker'
alias dr='docker run --rm -i -t'
alias dx='docker exec -i -t'

# git aliases
alias gc='_git_dbg commit -S -v -s'
alias gdc='_git_dbg diff --cached'
alias git='hub'
function gitnew (){
  _git_dbg remote add theykk git@github.com:theykk/$1.git
}
alias gpp='_git_dbg push theykk HEAD && hub pull-request --browse'
alias gpah='_git_dbg push theykk HEAD'
alias gpall='_git_dbg push theykk --tags && _git_dbg push theykk --all'
alias glah='_git_dbg pull theykk HEAD'
alias gfah='_git_dbg fetch theykk'
alias glom='_git_dbg pull origin master --tags'
alias gloh='_git_dbg pull origin HEAD --tags'
alias grom='_git_dbg rebase origin/master'
alias gpoh='_git_dbg push origin HEAD'
alias gbv="git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'"
unalias grv

alias zhr='code ~/.zshrc'
alias tool='code ~/TOOL'
alias scode='sudo code --user-data-dir="/home/ykk/.config/Code" --extensions-dir="/home/ykk/.vscode/extensions"'
alias ac='code .'
alias zhh='code ~/.zsh_history'
alias hm='code ~/Homestead/Homestead.yaml'
alias pret='yarn add -D eslint-plugin-import eslint-config-airbnb eslint-config-prettier eslint eslint-plugin-jsx-a11y eslint-plugin-prettier eslint-plugin-react eslint-plugin-react-hooks prettier'

alias genpass='tr -cd "[:alnum:]" < /dev/urandom | fold -w16 | head -n1'
alias genpass2='</dev/urandom tr -dc "'"12345\!@#$%qwertQWERTasdfgASDFGzxcvbZXCVB"'" | head -c16; echo ""'
alias genpass4='</dev/urandom tr -dc "'"A-Za-z0-9!#$%&'()*+,-./:;<=>?@[\]^_{|}~"'" | head -c 24  ; echo'
alias genpass3='tr -cd "[:alnum:]" < /dev/urandom | fold -w32 | head -n1'
alias mkcd='{ IFS= read -r d && mkdir "$d" && cd "$_"; } <<<'
alias l='ls -lF'
alias dir='ls'
alias la='ls -lah'
alias ll='ls -l'
alias ls-l='ls -l'
alias j='jobs'
alias time='gtime --format "$(tput setab 255)$(tput setaf 160)took %es.$(tput sgr0)"'
alias vi='vim'
alias grep='grep -E --color'
alias ping='ping -c 3'
alias pstree='pstree'
alias pc='pbcopy'
alias pp='pbpaste'
alias pt='pbpaste | tee'
alias t='tee'
alias pg='ps ax | grep -v "grep" | grep'

alias RNT='cd ~/Projects/Rentover/'

# ? Kubernetes
alias kcex='_kubectl_dbg explain'
alias pka='pbpaste | _kubectl_dbg apply -f-'
alias pkr='pbpaste | _kubectl_dbg delete -f-'
alias pkd='pbpaste | _kubectl_dbg describe -f-'
alias kpl='_kubectl_dbg plugin'
alias krew_install_clipboard='_kubectl_dbg krew install --manifest <(pbpaste)'
alias kk='_kubectl_dbg krew'
alias kx="kubectx"
alias kn="kubens"
alias kca='f(){ _kubectl_dbg "$@" -A -o wide;  unset -f f; }; f'
function kmerge() {
  KUBECONFIG=~/.kube/config:$1 kubectl config view --flatten > ~/.kube/mergedkub && mv ~/.kube/mergedkub ~/.kube/config
}

# ? Docker shortcuts
alias pgadmin="docker run --rm --network host -p 8084:80 -e 'PGADMIN_DEFAULT_EMAIL=user@domain.com' -e 'PGADMIN_DEFAULT_PASSWORD=SuperSecret' -d dpage/pgadmin4"
alias http='docker run -ti --rm --network host alpine/httpie'
alias noded='docker run -ti --rm --network host  -v "${PWD}:/app"  mhart/alpine-node:12 sh'
alias noded12='docker run -ti --rm --network host  -v "${PWD}:/app"  node:12-alpine sh'
alias noded8='docker run -ti --rm --network host  -v "${PWD}:/app"  node:8 sh'
alias phpim='docker run -ti --rm --network host  -v "$PWD:/usr/share/nginx/html" theykk.com/php:v1 bash'
alias porta='docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data --rm portainer/portainer && echo "http://localhost:9000"'
# alias drm="docker rm -f $(docker ps -aq)"
alias notary="notary -s https://notary.theykk.com -d ~/.docker/trust"

# ? Vmware 
alias dev_mount='sudo vmhgfs-fuse .host:/DEV /home/ykk/DEV -o allow_other -o uid=1000'
alias dev_mount2='sudo vmhgfs-fuse .host:/Dev_ubuntu /home/ykk/Dev2 -o allow_other -o uid=1000'
alias civo="docker run -it --rm -v $HOME/.civo.json:/home/user/.civo.json civo/cli:latest"

# ? Functions
dive(){
    docker run --rm -it  -v /var/run/docker.sock:/var/run/docker.sock  -e DOCKER_API_VERSION=1.37    wagoodman/dive:latest "$1"
}

kr() {
    set -x;
    image="$1"
    shift
    kubectl run --rm --restart=Never --image-pull-policy=IfNotPresent -it \
    	--image="${image}" tmp-"${RANDOM}" $@
}

portkill() {
  ps="$(lsof -t -i:"$1")"
  if [[ -z "$ps" ]]; then
    echo "no processes found"
  else
    kill -9 "$ps" && echo "$ps"
  fi
}

measure() {
  local ts=$(date +%s%N)
  $@
  local tt=$((($(date +%s%N) - $ts)/1000000))
  echo "time took: $tt ms." >&2
}

_git_dbg() {
  echo >&2 "$(tput setaf 1)+ git $@$(tput sgr0)"
  git "$@"
}

_kubectl_dbg() {
  echo >&2 "$(tput setaf 1)+ kubectl $@$(tput sgr0)"
  kubectl "$@"
}

function gittest(){
  _git_dbg clone --depth=1 $0 $HOME/Projects/testes/
}
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases
function k() { echo "+ kubectl $@"; command kubectl $@; }
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
source $HOME/gitflow/git-flow-completion.zsh
source <(kubectl completion zsh)  # setup autocomplete in zsh into the current shell
export KUBECONFIG=$HOME"/.kube/config"
# for i in $(find . -type f -name $HOME"/.kube/configs/*.yaml"); do
#   export KUBECONFIG=$KUBECONFIG:$HOME"/.kube/configs/$(basename $i)"
# done
export KUBECONFIG=$KUBECONFIG:$HOME"/.kube/configs/net.trylang.yaml"
