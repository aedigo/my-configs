# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

export XDG_RUNTIME_DIR=/run/user/$(id -u)
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
setopt autocd beep extendedglob nomatch
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/aedigo/.zshrc'

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

bindkey -M viins 'jk' vi-cmd-mode

zstyle ':completion:*'  matcher-list 'm:{a-z}={A-Z}'

# variables
browser=qutebrowser

# Global aliases
alias -g l="| less"

# git
alias gc='git clone'

# qutebrowser
alias qutec='nvim ~/.config/qutebrowser/config.py'

# sway
alias swac='nvim ~/.config/sway/config'
alias swaco='nvim ~/.config/sway/config.d/'
alias getId='swaymsg -t get_tree'

# arch
alias search='pacman -Ss'
alias sss='sudo systemctl start'
alias sse='sudo systemctl enable'
alias sgmc='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias lsm="exa -al --color=always --group-directories-first"
alias ls="exa"
alias up='sudo xbps-install -Su'
alias im='yay -S'
alias i='sudo xbps-install'
alias r='sudo xbps-remove'
alias orphans='sudo xbps-remove -o'

# python
alias pyi='pip install'
alias pyr='pip uninstall'

# steam
alias steamApp='xinit /usr/bin/steam -- :1 vt$XDG_VTNR'

# qtile
alias qtest='pytest ~/.config/qtile/config.py -s'
alias qc='nvim ~/.config/qtile/config.py'
alias qck='nvim ~/.config/qtile/keys.py'
alias qs='nvim ~/.config/qtile/autostart.sh'

# dunst
alias duc='nvim ~/.config/dunst/dunstrc'

# yarn
alias ya='yarn add'
alias yad='yarn add -D'

# simple commands
alias cl='clear'

# make
alias smi='sudo rm config.h; make; sudo make install'

# xclip
alias pbcopy='xclip -selection clipboard'

# firefox
alias fds='firefox-developer-edition --search '

# zsh
alias sc='vim ~/.zshrc'
alias sz='source ~/.zshrc'

# cpupower
alias boost="sudo cpupower frequency-set -g performance"
alias powersave="sudo cpupower frequency-set -g powersave"

# terminal apps
alias n='nnn'
alias reddit='ttrv --enable-media'
alias sv='sudo -e'
alias go='googler'
alias v='nvim'
alias vimwiki='nvim ~/.vimwki/index.wiki'

# Anki
alias ae='canki.sh English'
alias ap='canki.sh Portuguese'
alias am='canki.sh Math'
alias aa='canki.sh Pixel'
alias ag='canki.sh Godot'

# task warrior
alias tn='task next'
alias tw='task waiting'

# translate shell
alias t="trans -sp -brief en:pt-br"
alias tb="trans -p -brief pt-br:en"
alias ytvf="youtube-dl -F"

# youtube-dl
ytdw() {
  youtube-dl -f $@ 
}

# translate shell
translate() {
  trans -brief $1:$2 $3
}

# task warrior
ta() {
  task add '$@'; nh gitTask; 
}

td() {
  task done '$@'; nh gitTask;
}

tdel() {
  task delete '$@'; nh gitTask; 
}

nh() {
  nohup $1 >/dev/null 2>&1& 
}

# markmap
Markmap() {
  markmap ~/Documents/Mindmaps/$1/.sources/$2.md; mv ~/Documents/Mindmaps/$1/.sources/$2.html ~/Documents/Mindmaps/$1/$2.html 
}

openMap() {
  $browser ~/Docuents/Mindmaps/$1/$2.html 
}

Mindir() {
  mkdir -p ~/Documents/Mindmaps/$1/.sources 
}

# file
srm() {
  sudo rm -r "$@"
}

# st
std() {
  nh st;
}

RenameExt() {
  # rename ts mp4 *.ts
  rename $1 $2 *.$1
}

# copy file name
fName() {
  ls $1 | xclip -selection clipboard
}

bindkey '^ ' autosuggest-accept

# Find and set branch name var if in git repository.
function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo '('$branch')'
  fi
}

# Enable substitution in the prompt.
setopt prompt_subst

# Config for prompt. PS1 synonym.
autoload -U colors && colors
#PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%% "


PROMPT='%{$fg[red]%}%~ %{$fg[white]%}$(git_branch_name) 
'

 if [ "$TERM" = "linux" ]; then
     printf %b '\e[40m' '\e[8]' # set default background to color 0 'dracula-bg'
     printf %b '\e[37m' '\e[8]' # set default foreground to color 7 'dracula-fg'
     printf %b '\e]P0282a36'    # redefine 'black'          as 'dracula-bg'
     printf %b '\e]P86272a4'    # redefine 'bright-black'   as 'dracula-comment'
     printf %b '\e]P1ff5555'    # redefine 'red'            as 'dracula-red'
     printf %b '\e]P9ff7777'    # redefine 'bright-red'     as '#ff7777'
     printf %b '\e]P250fa7b'    # redefine 'green'          as 'dracula-green'
     printf %b '\e]PA70fa9b'    # redefine 'bright-green'   as '#70fa9b'
     printf %b '\e]P3f1fa8c'    # redefine 'brown'          as 'dracula-yellow'
     printf %b '\e]PBffb86c'    # redefine 'bright-brown'   as 'dracula-orange'
     printf %b '\e]P4bd93f9'    # redefine 'blue'           as 'dracula-purple'
     printf %b '\e]PCcfa9ff'    # redefine 'bright-blue'    as '#cfa9ff'
     printf %b '\e]P5ff79c6'    # redefine 'magenta'        as 'dracula-pink'
     printf %b '\e]PDff88e8'    # redefine 'bright-magenta' as '#ff88e8'
     printf %b '\e]P68be9fd'    # redefine 'cyan'           as 'dracula-cyan'
     printf %b '\e]PE97e2ff'    # redefine 'bright-cyan'    as '#97e2ff'
     printf %b '\e]P7f8f8f2'    # redefine 'white'          as 'dracula-fg'
     printf %b '\e]PFffffff'    # redefine 'bright-white'   as '#ffffff'
     clear
 fi

autoload -Uz compinit

compinit
# End of lines added by compinstall


