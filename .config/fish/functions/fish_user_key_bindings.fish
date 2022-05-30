function fish_user_key_bindings
    bind -M insert jk "if commandline -P; commandline -f cancel; else; set fish_bind_mode default; commandline -f backward-char force-repaint; end"
    bind -k nul accept-autosuggestion
    bind -M insert -k nul accept-autosuggestion
end
