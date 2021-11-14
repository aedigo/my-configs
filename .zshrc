export NNN_BMS='d:~/Documents;u:/home/user/Cam Uploads;D:~/Downloads/'
export NNN_SSHFS="sshfs -o follow_symlinks"        # make sshfs follow symlinks on the remote
export NNN_COLORS="2136"                           # use a different color for each context
export NNN_TRASH=1                                 # trash (needs trash-cli) instead of delete
export ZSH="/home/aedigo/.oh-my-zsh"
export PATH=/home/aedigo/.local/bin:$PATH
export MOZ_X11_EGL=1
export VIMTO_COLOR_NORMAL_TEXT=#282828
export VIMTO_COLOR_NORMAL_BACKGROUND=#f1fbc7

# Editor
export EDITOR="/usr/bin/emacs"
export VISUAL="/usr/bin/emacs"

ZSH_THEME="zhann"

CASE_SENSITIVE="false"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(zsh-vi-mode git pip command-not-found zsh-autosuggestions fast-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
source $ZSH/aliases.zsh

# Only changing the escape key to `jk` in insert mode, we still
# keep using the default keybindings `^[` in other modes
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

# Setting vim keybindgs on the terminal.
bindkey -M viins 'jk' vi-cmd-mode '^ ' autosuggest-accept

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=980'
if [ -z "${DISPLAY}" ] && [ "$(tty)" = "/dev/tty1" ]; then
   exec sway-custom
fi

