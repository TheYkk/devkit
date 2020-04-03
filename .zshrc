export ZSH=$HOME/.oh-my-zsh

export UPDATE_ZSH_DAYS=14
export DISABLE_UPDATE_PROMPT=true

ZSH_THEME="spaceship"
ZSH_DISABLE_COMPFIX="true"
plugins=(  git
  node
  npm
  gem
  vscode
  gulp
  extract
  go 
  fzf
  golang
  git-extras 
  git-flow
  docker 
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
export REACT_EDITOR=code
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

alias ..='cd ..'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias ...='cd ../..'
alias c='clear'
alias h='cd ~'
alias dc='docker-compose '
alias dbuild='DOCKER_BUILDKIT=1 docker build . '
alias d='docker'
alias dr='docker run --rm -i -t'
alias dx='docker exec -i -t'

# git aliases
alias gc='_git_dbg commit -S -v -s'
alias gdc='_git_dbg diff --cached'
alias git='hub'
alias gpp='_git_dbg push theykk HEAD && hub pull-request --browse'
alias gpah='_git_dbg push theykk HEAD'
alias glah='_git_dbg pull theykk HEAD'
alias gfah='_git_dbg fetch theykk'
alias glom='_git_dbg pull origin master --tags'
alias gloh='_git_dbg pull origin HEAD --tags'
alias grom='_git_dbg rebase origin/master'
alias gpoh='_git_dbg push origin HEAD'
alias gbv="git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'"
unalias grv

alias zhr='code ~/.zshrc'
alias ac='code .'
alias zhh='code ~/.zsh_history'
alias hm='code ~/Homestead/Homestead.yaml'
alias pret='yarn add -D eslint-plugin-import eslint-config-airbnb eslint-config-prettier eslint eslint-plugin-jsx-a11y eslint-plugin-prettier eslint-plugin-react eslint-plugin-react-hooks prettier'

alias genpass='tr -cd "[:alnum:]" < /dev/urandom | fold -w16 | head -n1'
alias genpass2='</dev/urandom tr -dc "'"12345\!@#$%qwertQWERTasdfgASDFGzxcvbZXCVB"'" | head -c16; echo ""'
alias mkcd='{ IFS= read -r d && mkdir "$d" && cd "$_"; } <<<'
alias gco="git config --global"
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
alias pstree='pstree -w'
alias c='pbcopy'
alias p='pbpaste'
alias pt='pbpaste | tee'
alias t='tee'
alias pg='ps ax | grep -v "grep" | grep'

alias RNT='cd ~/Projects/Rentover/'

# ? Kubernetes
alias kcex='kubectl explain'
alias pka='pbpaste | kubectl apply -f-'
alias pkr='pbpaste | kubectl delete -f-'
alias pkd='pbpaste | kubectl describe -f-'
alias kpl='kubectl plugin'
alias krew_install_clipboard='kubectl krew install --manifest <(pbpaste)'
alias kk='kubectl krew'
alias kx="kubectx"
alias kn="kubens"
alias kca='f(){ kubectl "$@" -A -o wide;  unset -f f; }; f'
function kmerge() {
  KUBECONFIG=~/.kube/config:$1 kubectl config view --flatten > ~/.kube/mergedkub && mv ~/.kube/mergedkub ~/.kube/config
}

# ? Docker shortcuts
alias pgadmin="docker run --rm --network host -p 8084:80 -e 'PGADMIN_DEFAULT_EMAIL=user@domain.com' -e 'PGADMIN_DEFAULT_PASSWORD=SuperSecret' -d dpage/pgadmin4"
alias http='docker run -ti --rm --network host alpine/httpie'
alias noded='docker run -ti --rm --network host  -v "${PWD}:/app"  mhart/alpine-node:12 sh'
alias noded12='docker run -ti --rm --network host  -v "${PWD}:/app"  node:12-alpine sh'
alias noded8='docker run -ti --rm --network host  -v "${PWD}:/app"  node:8 sh'
alias phpim='docker run -ti --rm --network host  -v "$PWD:/usr/share/nginx/html" wyveo/nginx-php-fpm:latest bash'
alias porta='docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data --rm portainer/portainer && echo "http://localhost:9000"'
alias drm="docker rm -f $(docker ps -aq)"
alias notary="notary -s https://notary.theykk.com -d ~/.docker/trust"
# ? Install programs
alias install_helm='curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash'

# ? Vmware 
alias dev_mount='sudo vmhgfs-fuse .host:/Dev_ubuntu /home/ykk/Dev -o allow_other -o uid=1000'
alias civo="docker run -it --rm -v $HOME/.civo.json:/home/user/.civo.json civo/cli:latest"

# ? Functions
dive(){
    docker run --rm -it  -v /var/run/docker.sock:/var/run/docker.sock  -e DOCKER_API_VERSION=1.37    wagoodman/dive:latest "$1"
}
codem() {
    if [ -z "$1" ]
    then
        echo "No argument supplied"
        docker run -d -p 8443:8443 -v "${PWD}:/home/coder/project" --rm codercom/code-server --allow-http --no-auth
    elif [ "$2" ] 
    then
        docker run -d -p 8443:8443 -v "$1:/home/coder/project" --rm codercom/code-server --allow-http --no-auth
    else
        docker run -d -p 8443:8443 -v "${PWD}/$1:/home/coder/project" --rm codercom/code-server --allow-http --no-auth
    fi
}

kr() {
    set -x;
    image="$1"
    shift
    kubectl run --rm --restart=Never --image-pull-policy=IfNotPresent -i -t \
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
transfer() { 
    curl --version 2>&1 > /dev/null
    if [ $? -ne 0 ]; then
    echo "Could not find curl."
    return 1
    fi
    # check arguments
    if [ $# -eq 0 ]; 
    then 
        echo "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"
        return 1
    fi

    # get temporarily filename, output is written to this file show progress can be showed
    tmpfile=$( mktemp -t transferXXX )
    
    # upload stdin or file
    file=$1

    if tty -s; 
    then 
        basefile=$(basename "$file" | sed -e 's/[^a-zA-Z0-9._-]/-/g') 

        if [ ! -e $file ];
        then
            echo "File $file doesn't exists."
            return 1
        fi
        
        if [ -d $file ];
        then
            # zip directory and transfer
            zipfile=$( mktemp -t transferXXX.zip )
            cd $(dirname $file) && zip -r -q - $(basename $file) >> $zipfile
            curl --progress-bar --upload-file "$zipfile" "https://transfer.sh/$basefile.zip" >> $tmpfile
            rm -f $zipfile
        else
            # transfer file
            curl --progress-bar --upload-file "$file" "https://transfer.sh/$basefile" >> $tmpfile
        fi
    else 
        # transfer pipe
        curl --progress-bar --upload-file "-" "https://transfer.sh/$file" >> $tmpfile
    fi
   
    # cat output link
    cat $tmpfile

    # cleanup
    rm -f $tmpfile
}
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases
function k() { echo "+ kubectl $@"; command kubectl $@; }
source =$HOME/gitflow/git-flow-completion.zsh
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
source <(kubectl completion zsh)  # setup autocomplete in zsh into the current shell
setopt HIST_IGNORE_SPACE
