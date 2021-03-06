# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="terminalparty"

# Autocomplete .. to ../
zstyle ':completion:*' special-dirs true

# 
# zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="false"

# Uncomment the following line to change how often to auto-update (in days).
 export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(archlinux sudo git zsh-syntax-highlighting sublime fancy-ctrl-z cp)
# User configuration

export PATH="/bin:/usr/local/bin:/usr/bin"
#Ruby
export PATH="$PATH:$HOME/.gem/ruby/2.3.0/bin:$HOME/.rbenv/bin/"
#Perl
export PATH="$PATH:/usr/bin/core_perl/"
#Rust
export PATH="$PATH:$HOME/.cargo/bin"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

if [[ -n "$DISPLAY" ]]; then
    export BROWSER=chromium
else
    export BROWSER=w3m
fi

setopt no_share_history

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias irkk="ssh -t cantina irkk"
alias gspp="git stash && git pull --rebase && git stash pop"
alias digitvpn="sudo openvpn /etc/openvpn/digit.conf"
alias pbuf="xclip -selection c"
alias cb="cargo build"
alias cr="cargo run"
alias pacupg="yay -Syu --noconfirm"
alias eduroam="sudo nmcli con up id eduroam || (sudo systemctl restart NetworkManager.service && sudo nmcli con up id eduroam &)"
alias wifi="sudo nmcli con up id"
alias lunch="curl https://chalmers.it/lunch/feed\?filter=Johanneberg | less"
alias ls="exa --git -hH"
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

function haste() { a=$(cat); curl -X POST -s -d "$a" https://paste.kerp.se/documents | awk -F '"' '{print "https://paste.kerp.se/"$4}'; }

function path() {echo $PATH | tr ':' '\n'}

eval "$(rbenv init -)"

source $HOME/.dotfiles/bin/z/z.sh

function do_enter() {
    if [ -n "$BUFFER" ]; then
        zle accept-line
        return 0
    fi
    echo
    ls
    if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = 'true' ]; then
        echo
        echo -e "\e[0;33m--- git status ---\e[0m"
        git status -sb
    fi
    zle reset-prompt
    return 0
}
zle -N do_enter
bindkey '^m' do_enter
export GOPATH=/home/kerp/projects/go 

