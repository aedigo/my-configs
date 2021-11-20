export NNN_BMS='d:~/Documents;u:/home/user/Cam Uploads;D:~/Downloads/'
export LC_CTYPE=en_US.UTF-8
export NNN_SSHFS="sshfs -o follow_symlinks"        # make sshfs follow symlinks on the remote
export NNN_COLORS="2136"                           # use a different color for each context
export NNN_TRASH=1                                 # trash (needs trash-cli) instead of delete
export MANPAGER='sh -c "col -bx | bat -l man -p"'
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
   startx qtile start
fi

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

[[ $(fgconsole 2>/dev/null) == 1 ]] && exec startx -- vt1 &> /dev/null
eval "$(starship init zsh)"
