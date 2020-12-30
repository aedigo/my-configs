# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
export ZSH="/home/aedigo/.oh-my-zsh"

# Editor
export EDITOR="/usr/bin/nvim"
export VISUAL="/usr/bin/nvim"

# Alias

# Task Warrior
ta() {
  task add "$@"; nohup gitTask &
}

td() {
  task done "$@"; nohup gitTask &
}

tdel() {
  task delete "$@"; nohup gitTask &
}
alias tn="task next"
alias tw="task waiting"

alias habit="task rc.data.location=~/.habit"
alias habitCreate="task add rc.data.location=~/.habit"
alias habitDone="task done rc.data.location=~/.habit"
alias habitDelete="task delete rc.data.location=~/.habit"
alias habitWait="task waiting rc.data.location=~/.habit"

habitProject() {
  task $1 $2 project:$3 rc.data.location=~/.habit
}

habitProjectW() {
  task $1 project:$2 $3 "$@" rc.data.location=~/.habit
}

# Markmap
alias fmap="markmap ~/vimwiki/"
Markmap() {
  markmap ~/Documents/MindMaps/$1/.sources/$2.md; mv ~/Documents/MindMaps/$1/.sources/$2.html ~/Documents/MindMaps/$1/$2.html 
}

Mindir() {
  mkdir ~/Documents/MindMaps/$1
}
alias files="~/Documents/MindMaps/"

# Anki
alias ave="anki-vim English"
alias avp="anki-vim Portuguese"

# System related 
alias cl="clear"
alias spi="sudo pacman -S"
alias spr="sudo pacman -R"
alias yi="yay -S"
alias svim="sudo -e"
alias n="nnn"
alias zc="nvim ~/.zshrc"
alias sz="source ~/.zshrc"
alias qc="$EDITOR ~/.config/qtile/config.py"
alias spu="sudo pacman -Syu; gopreload-batch-refresh.sh"
alias dc="nvim ~/dwm/config.h"
alias smci="sudo rm config.h; make; sudo make install"
alias v="nvim"
alias st="nohup st &"
alias reddit="ttrv --enable-media"

RenameExt() {
  # rename ts mp4 *.ts
  rename $1 $2 *.$1
}

# Git
alias ga="git add"
alias gc="git commit -m"

# Vim
alias nvc="nvim ~/config/nvim/init.vim"

# Changing CPU governor to performance
alias boost="sudo cpupower frequency-set -g performance"
alias powersave="sudo cpupower frequency-set -g powersave"

# Shortcut for Translate Shell. This will translate from any language to portuguese only. -brief is to show only the translation and nothing more. To translate a phrase, put it between quotation marks.
alias t="trans -brief en:pt-br"
alias tb="trans -brief pt-br:en"
translate() {
  trans -brief $1:$2 $3
}

# Youtube-dl
alias ytdw="youtube-dl -f 22"
alias ytvf="youtube-dl -F"

# Suffix aliases
alias -s txt=nvim
alias -s md=nvim
alias -s html=nvim

# Global aliases
alias -g L="| less"

#function t () {
#if [[ -v $2 ]];
#  then 
#    trans --brief en:pt-br $2
##J  else
  #trans --brief $1:pt-br $2
  #fi
#}

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="fino-time"
ZSH_THEME="theunraveler"


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.


### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk
zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions

echo 'To-Do'
# Setting vim keybindgs on the terminal.
bindkey -v
bindkey -M viins 'jj' vi-cmd-mode
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=180'
