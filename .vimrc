syntax on

" set path+=**
setlocal path=.,,src/**,public/**
set number
set wildmenu
set wildcharm=<C-z>
set wildignore=*/node_modules/*,*/target/*,*/tmp/*
set noshowmode
" this is for lightline plugin
set laststatus=2

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
noremap dt :tabd<cr>
noremap <C-n> :edit .<cr>
nnoremap ,html :-1read $HOME/.vim/.boilerplate.html<CR>6jwf>a

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
