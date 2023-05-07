# alias系
alias x86='arch -x86_64 zsh'
alias arm64='arch -arm64 zsh'
alias pod="arch -x86_64 pod"
alias brew="arch -arm64 brew"
alias gem="arch -x86_64 sudo gem"
alias 2work='cd /Users/takumi/Documents/src/work/azure'
alias 2pri='cd /Users/takumi/Documents/src/private/azure'
alias 2docker='cd ~/Documents/Docker'
alias python='python3'
alias pip='pip3'
alias zshrc='code ~/.zshrc'
alias rezshrc='source ~/.zshrc'

alias tree_js="tree -I 'node_modules|dist'"
export CH_DIR='/Users/takumi/Documents/src/private/sheet'
alias sheet-zsh="code $CH_DIR/zsh.md"
alias sheet-docker="code $CH_DIR/docker.md"
alias sheet-mysql-name="chrome https://qiita.com/genzouw/items/35022fa96c120e67c637"

# WebStormで開く設定
alias ws='open -na "WebStorm.app" --args "$@"'
alias pycharm='open -na "PyCharm.app" --args "$@"'
alias docker_rm_container='docker rm -f $(docker ps -a -q)'

# mysql
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/mysql-client/lib"
export CPPFLAGS="-I/usr/local/opt/mysql-client/include"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# poetry
export PATH="/Users/takumi/.local/bin:$PATH"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# java
export PATH="$PATH:/Users/takumi/Library/Java/JavaVirtualMachines/corretto-18.0.2/Contents/Home/bin"


# zlib
export LDFLAGS="-L/opt/homebrew/opt/zlib/lib"
export CPPFLAGS="-I/opt/homebrew/opt/zlib/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/zlib/lib/pkgconfig"

# other
export LDFLAGS="-L/opt/homebrew/lib -L/opt/homebrew/bin"
export PYTHON_CONFIGURE_OPTS="--enable-shared --prefix=/opt/homebrew"
export LDFLAGS="-L/opt/homebrew/opt/gettext/lib"

# zsh-completions(補完機能)の設定
if [ -e /usr/local/share/zsh-completions ]; then
    fpath=(/usr/local/share/zsh-completions $fpath)
fi
autoload -U compinit
compinit -u

# prompt
PROMPT='%n@ %F{1}%~%f$ '

# 同時に起動しているzshの間でhistoryを共有する
setopt share_history

# 同じコマンドをhistoryに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンドをhistoryに残さない
setopt hist_ignore_space

# historyに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 高機能なワイルドカード展開を使用する
setopt extended_glob

# コマンドのスペルミスを指摘
setopt correct

# nvmの設定
  export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# nodebrewの設定
# /export PATH=$HOME/.nodebrew/current/bin:$PATH

# 最新のLTSをインストールして、現在利用しているNode.jsのパッケージもインストール
# function setLatestLtsNode(){
#   nvm install "lts/*" --reinstall-packages-from=current
# }

# githubアカウント切り替え
function gitWork() {
  git config --global user.name "bp-oda"
  git config --global user.email bp-oda@kdl.co.jp
}

function gitPri() {
  git config --global user.name "TakumiOda"
  git config --global user.email xiaotiantakumi@gmail.com
}

# chromeで開く
function chrome() {
  # echo $PWD"/"$1
  if [[ $1 =~ "^http" ]] then
  open -na "Google Chrome" --args $1
  else
    open -na "Google Chrome" --args $PWD"/"$1
  fi
}

# chromeで開く
function pullBenicDev() {
  cd /Users/takumi/Documents/src/work/azure/mems/int-khi-mems-backend-api-devenv/
  git pull origin main
}
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/takumi/.pyenv/versions/miniforge3-22.9.0-3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/takumi/.pyenv/versions/miniforge3-22.9.0-3/etc/profile.d/conda.sh" ]; then
        . "/Users/takumi/.pyenv/versions/miniforge3-22.9.0-3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/takumi/.pyenv/versions/miniforge3-22.9.0-3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# define a function called "docker-enter"
docker-enter-latest() {
  # get the id of the most recently created container that is currently running
  container_id=$(docker ps -a --filter status=running --format "{{.ID}}" | head -n 1)

  # if container_id is empty, print an error message and exit
  if [ -z "$container_id" ]
  then
    echo "No running containers found"
    return 1
  fi

  # execute the docker exec command to enter the container
  docker exec -it "$container_id" /bin/bash
}