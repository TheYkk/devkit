export ZSH=$HOME/.oh-my-zsh

# export UPDATE_ZSH_DAYS=14
# export DISABLE_UPDATE_PROMPT=true

ZSH_THEME="spaceship"
SPACESHIP_KUBECTL_SHOW="true"
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
source ~/.kaan.sh

export PATH="$PATH:$HOME/.fzf/:$HOME/.config/composer/vendor/bin"
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$HOME/.wasme/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/scripts
export PATH=$PATH:$HOME/scripts/bashs
export PATH=$PATH:$HOME/scripts/pythons
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/usr/local/include
export PATH=$PATH:$(go env GOPATH)/bin
export PATH=$PATH:$HOME/.cargo/bin
export DENO_INSTALL="/home/kaan/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"


export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export REACT_EDITOR="code --wait"
export EDITOR="code --wait"
export GOSUMDB=off
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH=$PATH:/home/kaan/.linkerd2/bin
HEIGHT=$(tput lines)
alias cp="cp -iv" 
alias mv="mv -iv" 
alias rm="rm -vI" 
alias apt="sudo apt" 
alias mkdir="mkdir -pv" 
alias ..='cd ..'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias ...='cd ../..'
alias c='clear'
alias h='cd ~'
alias kbuild="kubectl build -c . -d"
alias cm='chmod +x *.sh'
alias dc='docker-compose '
function dbuild(){
  DOCKER_BUILDKIT=1 docker build . -t $@
  docker push $1
}
alias d='docker'
alias dr='docker run --rm -it'
alias drb='docker run --rm -it --entrypoint sh'
alias dx='docker exec -i -t'

#APTpo
alias api="sudo apt install -y "
alias apr="sudo apt remove -y "
alias apa="sudo apt autoremove -y "

# git aliases
alias gc='_git_dbg commit -S -v -s'
alias gdc='_git_dbg diff --cached'
alias git='hub'
function gitnew (){
  _git_dbg remote add theykk git@github.com:theykk/$1.git
}
alias gpp='_git_dbg push theykk HEAD hub pull-request --browse'
alias gpah='_git_dbg push theykk HEAD'
alias gpall='_git_dbg push theykk --tags && _git_dbg push theykk --all'
alias gpll='_git_dbg push origin --tags && _git_dbg push origin --all'
alias glah='_git_dbg pull theykk HEAD'
alias gfah='_git_dbg fetch theykk'
alias glom='_git_dbg pull origin master --tags'
alias gloh='_git_dbg pull origin HEAD --tags'
alias grom='_git_dbg rebase origin/master'
alias gpoh='_git_dbg push origin HEAD'
alias gbv="git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'"
unalias grv

# Vs Code Alias
alias zhr='code ~/.zshrc'
alias kaan='code ~/.kaan.sh'
alias devkit='code ~/devkit'
alias loc='code ~/.local'
alias scs="code ~/scripts"
alias scode='sudo code --user-data-dir="/home/kaan/.config/Code" --extensions-dir="/home/kaan/.vscode/extensions"'
alias ac='code .'
alias zhh='code ~/.zsh_history'


#Password tools
alias genpass='tr -cd "[:alnum:]" < /dev/urandom | fold -w16 | head -n1'
alias genpass2='</dev/urandom tr -dc "'"12345\!@#$%qwertQWERTasdfgASDFGzxcvbZXCVB"'" | head -c16; echo ""'
alias genpass4='</dev/urandom tr -dc "'"A-Za-z0-9!#$%&'()*+,-./:;<=>?@[\]^_{|}~"'" | head -c 24  ; echo'
alias genpass3='tr -cd "[:alnum:]" < /dev/urandom | fold -w32 | head -n1'
alias mkcd='{ IFS= read -r d && mkdir "$d" && cd "$_"; } <<<'
alias l='ls -lF'
alias dir='ls'
alias ll='ls -lah'
alias j='jobs'
alias vi='vim'
alias lg="lazygit"
alias grep='grep -E --color'
alias ping='ping -c 3'
alias pc='pbcopy'
alias pp='pbpaste'
alias cat="batcat"
alias t='tee'
alias pg='ps ax | grep -v "grep" | grep'
alias py3='python3'
alias open='xdg-open'
alias fs='du -h --max-depth=1 | sort -hr'
# ? Kubernetes
alias kcex='_kubectl_dbg explain'
alias pka='pbpaste | _kubectl_dbg apply -f-'
alias pkr='pbpaste | _kubectl_dbg delete -f-'
alias pkd='pbpaste | _kubectl_dbg describe -f-'
alias kx="kubectx"
alias kn="kubens"
alias goci="golangci-lint run -v"
alias kca='f(){ _kubectl_dbg "$@" -A -o wide;  unset -f f; }; f'
function kmerge() {
  KUBECONFIG=~/.kube/config:$1 kubectl config view --flatten > ~/.kube/mergedkub && mv ~/.kube/mergedkub ~/.kube/config
}

function pse(){
  ps -aux | grep $1
}

# ? Docker shortcuts
alias pgadmin="docker run --rm --network host  -e 'PGADMIN_DEFAULT_EMAIL=ykk@ykk.ykk' -e 'PGADMIN_DEFAULT_PASSWORD=ykk' -d dpage/pgadmin4&& echo http://localhost:8084"
alias http='docker run -ti --rm --network host alpine/httpie'
alias alpp='docker run -ti --rm alpine:3.12'
alias ubb='docker run -ti --rm -v "${PWD}:/app" ubuntu'
alias htpasswd='docker run -ti --rm theykk/htpasswd'
alias noded='docker run -ti --rm --network host  -v "${PWD}:/app"  mhart/alpine-node:12 sh'
alias goa='docker run -ti --rm --network host  -v "${PWD}:/app"  golang:1.16-alpine sh'
alias noded12='docker run -ti --rm --network host  -v "${PWD}:/app"  node:12-alpine sh'
alias phpim='docker run -ti --rm --network host  -v "$PWD:/usr/share/nginx/html" theykk.com/php:v1 bash'
alias porta='docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data --rm portainer/portainer-ce && echo "http://localhost:9000"'
alias drm='docker rm -f $(docker ps -aq) >/dev/null 2>&1 || true'

# ? Vmware
alias civo="docker run -it --rm -v $HOME/.civo.json:/home/user/.civo.json civo/cli:latest"

# ? Functions

upload(){
  gpg -ac -o- $1  |curl -X PUT --upload-file "-" https://transfer.sh/encrypted.txt
}

download(){
  timestamp=$(date +%s)

  curl $1 | gpg -d -o decrypted_${timestamp}.txt

}

dive(){
    docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock wagoodman/dive:latest "$1"
}

kr() {
    set -x;
    image="$1"
    shift
    kubectl run --rm --restart=Never --image-pull-policy=IfNotPresent -it \
    	--image="${image}" tmp-"${RANDOM}" $@
}
delete_ns() {
  kubectl get namespace "$@" -o json \
            | tr -d "\n" | sed "s/\"finalizers\": \[[^]]\+\]/\"finalizers\": []/" \
            | kubectl replace --raw /api/v1/namespaces/$@/finalize -f -
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
pt() {
  pp > $1
}
_git_dbg() {
  echo >&2 "$(tput setaf 1)+ git $@$(tput sgr0)"
  git "$@"
}

_kubectl_dbg() {
  echo >&2 "$(tput setaf 1)+ kubectl $@$(tput sgr0)"
  kubectl "$@"
}


b64d(){
  echo -n "$1" | base64 -d ; echo
}

b64(){
  echo -n "$1" | base64 -w 0 ; echo
}
FZF_LINES=`expr $HEIGHT - 1`
function del () {
	clear; tput cup $(($(tput lines)/3)); tput bold
	set -f
	clear; printf "%s\n\t" "$@"
  tput sgr0
	printf "delete?[y/N]: "
	read ans
	[ $ans = "y" ] && rm -rf $@
}

function mov() {
	clear; tput cup $(($(tput lines)/3)); tput bold
	set -f
	clear; echo "Move to where?"
	dest="$(find ~/* -type d | grep -v '.git' |grep -v '.cache'| fzf --height $FZF_LINES)" &&
	for x in $@; do
		eval mv -iv \"$x\" \"$dest\"
	done &&
	notify "🚚 File(s) moved." "File(s) moved to $dest." 5000  > /dev/null
}

function cop() {
	clear; tput cup $(($(tput lines)/3)); tput bold
	set -f
	clear; echo "Copy to where?"
	dest="$(find * -type d | grep -v '.git' |grep -v '.cache'| fzf --height $FZF_LINES)" &&
	for x in $@; do
		eval cp -ivr \"$x\" \"$dest\"
	done &&
	notify "📋 File(s) copied." "File(s) copies to $dest." 5000  > /dev/null
}

function gt(){
  _git_dbg clone --depth=1 $1
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases
function k() { echo "+ kubectl $@"; command kubectl $@; }
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
# source $HOME/gitflow/git-flow-completion.zsh
# source <(kubectl completion zsh)  # setup autocomplete in zsh into the current shell
# source <(k3d completion zsh)  # setup autocomplete in zsh into the current shell
function kload(){
  unset KUBECONFIG
  for i in ~/.kube/configs/*.yaml; do
    export KUBECONFIG=$KUBECONFIG:$i
  done
}
# export KUBECONFIG=$KUBECONFIG:$HOME":/.kube/configs/net.trylang.yaml:/.kube/configs/com.theykk.yaml"
function gi() { wget -O .gitignore https://www.gitignore.io/api/$@}
watch () {
    IN=2
    case $1 in
        -n)
            IN=$2
            shift 2
            ;;
    esac
    printf '\033c' # clear
    CM="$*"
    LEFT="$(printf 'Every %.1f: %s' $IN $CM)"
    ((PAD = COLUMNS - ${#LEFT}))
    while :
    do
        DT=$(date)
        printf "$LEFT%${PAD}s\n" "$HOST $(date)"
        eval "$CM"
        sleep $IN
        printf '\033c'
    done
}

gotest(){
  go test -v ./... | sed ''/PASS/s//$(printf "\033[32mPASS\033[0m")/'' | sed ''/FAIL/s//$(printf "\033[31mFAIL\033[0m")/''
}
# scripts

alias weather="py3 /home/kaan/scripts/pythons/weather.py"
alias net="py3 /home/kaan/scripts/pythons/net.py"
# SSH_ENV="$HOME/.ssh/agent-environment"

# function start_agent {
#     echo "Initialising new SSH agent..."
#     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
#     echo succeeded
#     chmod 600 "${SSH_ENV}"
#     . "${SSH_ENV}" > /dev/null
#     /usr/bin/ssh-add;
# }

# # Source SSH settings, if applicable

# if [ -f "${SSH_ENV}" ]; then
#     . "${SSH_ENV}" > /dev/null
#     #ps ${SSH_AGENT_PID} doesn't work under cywgin
#     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
#         start_agent;
#     }
# else
#     start_agent;
# fi
export FZF_CTRL_T_COMMAND='fdfind --type d --hidden --follow --exclude ".git" . ~/Work'
