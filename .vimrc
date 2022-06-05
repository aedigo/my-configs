syntax on

setlocal path=.,,src/**,public/**
set number
set wildmenu
set wildcharm=<C-z>
set wildignore=*/node_modules/*
set noshowmode
" this is for lightline plugin
set laststatus=2
set colorcolumn=85
set hlsearch
set number
set relativenumber
set tabstop=2 shiftwidth=2 expandtab

let g:netrw_banner=0
let g:netrw_browser_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ }

" mappings
" non-recursive
noremap <C-p> :find *
noremap nt :tabn<cr>
noremap pt :tabp<cr>
noremap <C-n> :edit .<cr>
" this will 'dehighlight' the search
nnoremap <CR> :noh<CR>
nnoremap ,html :-1read $HOME/.vim/.boilerplate.html<CR>6jwf>a
" insert mode mappings
inoremap <silent> ,f <C-x><C-f>
inoremap <silent> ,i <C-x><C-i>
inoremap <silent> ,l <C-x><C-l>
inoremap <silent> ,n <C-x><C-n>
inoremap <silent> ,o <C-x><C-o>
inoremap <silent> ,t <C-x><C-]>
inoremap <silent> ,u <C-x><C-u>
noremap <C-L> <C-W><C-L>

" this will let me go back/foward or delete a buffer
noremap gn :bn<cr>
noremap gp :bp<cr>
noremap gd :bd<cr>

" this set the line number to be both relative and absolute
augroup numbertoggle
autocmd!
autocmd bufenter,focusgained,insertleave,winenter * if &nu && mode() != "i" | set rnu   | endif
autocmd bufleave,focuslost,insertenter,winleave   * if &nu                  | set nornu | endif
augroup end
