fish_vi_key_bindings
set -gx EDITOR nvim
set -x MANPAGER 'sh -c "col -bx | bat -l man -p"' 
set -U fish_greeting ""
 # Start X at login
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx /usr/bin/qtile start
    end
end
# aliases

# translate-shell
alias t='trans -sp -brief en:pt-br'
alias tb='trans -p -brief pt-br:en'

# pip
alias pi='pip install'
alias pr='pip uninstall'

# installing
alias i='sudo paru -S'
alias r='sudo paru -R'
alias up='sudo paru -Syu'

# installing aur
alias ia='paru'
alias sa='paru -Ss'

# builtin
alias cl='clear'
alias ls='exa'
alias srm='sudo rm -rf'
alias ll='ls -la'
alias fuck='killall -9'

# vim
alias v='nvim'
alias vi='nvim'
abbr -a sv sudo -e
alias vim='nvim'

# fish
alias sc='$EDITOR ~/.config/fish/config.fish'

# de/wm
#
# qtile
alias qc='emacs ~/.config/qtile/README.org'

# arch
alias gm='sudo grub-mkconfig -o /boot/grub/grub.cfg'
