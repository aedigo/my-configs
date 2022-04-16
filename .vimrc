set nocompatible
set hidden hls showcmd ruler incsearch laststatus=2
set softtabstop=0 noexpandtab
set shiftwidth=2
set tabstop=2 softtabstop=2 expandtab shiftwidth=2 smarttab
let g:dracula_colorterm = 0
filetype plugin on
syntax on
packadd! dracula
syntax enable
colorscheme dracula

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<cr> {<cr>}<esc>o
inoremap {;<cr> {<cr>};<esc>o

" this allows me to have both relative and absolute numbers when moving around in visual mode
set number
augroup numbertoggle
autocmd!
autocmd bufenter,focusgained,insertleave,winenter * if &nu && mode() != "i" | set rnu   | endif
autocmd bufleave,focuslost,insertenter,winleave   * if &nu                  | set nornu | endif
augroup end


vnoremap <c-c> :w !xclip -i -sel c<cr><cr>
" this will let me go back/foward or delete a buffer
map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>

" this will make 'jj' act like esc
imap jk <Esc>
