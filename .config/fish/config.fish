fish_vi_key_bindings
set -gx EDITOR nvim
set -U fish_greeting ""
 # Start X at login
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx /usr/bin/qtile start
    end
end
# aliases

# aura
alias ai='sudo aura -S'
alias aia='sudo aura -A'
alias ar='sudo aura -R'
alias ao='aura -O'
alias aor='aura -O -j'
alias au='sudo aura -Syu'

# builtin
alias cl='clear'
alias ls='exa'

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
