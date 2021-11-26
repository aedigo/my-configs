" all the plugins I use
call plug#begin('~/.config/nvim/plugged')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'preservim/nerdcommenter'
  Plug 'Mofiqul/dracula.nvim'
  Plug 'vimwiki/vimwiki'
  Plug 'mattn/emmet-vim'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
call plug#end()

" this is for lualine. Its the default configuration 
lua << END
require'lualine'.setup()
END

set autochdir

" this make so that after folded, quiting and reopening, will still have the lines folded
" all my sets
set tabstop=2
set shiftwidth=2
set nocompatible
set path+=**
set wildmenu
set expandtab
set smartindent
set autoindent
set smartindent
set nonu nornu
set number relativenumber
set wildignorecase
set wildignore=\*.git/\node_modules/

" all my lets
let g:coc_global_extensions = [ 'coc-json', 'coc-git', 'coc-html', 'coc-css', 'coc-prettier' ]
let g:user_emmet_leader_key='<C-e>'
let g:airline_theme='dracula'

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
colorscheme dracula

" some snippets
nnoremap ,html :-1read $HOME/.config/nvim/snippets/html.snippet<CR>14jf>a
nnoremap ,mdc :-1read $HOME/.config/nvim/snippets/mdc.snippet<CR>2f-a<Space>

" this will let me go back/foward or delete a buffer
map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>

" this will auto complete the signs
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

filetype indent on

" this will allow me to search for everything inside the current directory
nnoremap <C-f> :find 
nnoremap <C-p> :e<space>

" this will make 'jj' act like Esc 
imap jk <Esc>

" prettier 
command! -nargs=0 Pret :CocCommand prettier.formatFile
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

if has('nvim')
  cnoremap <expr> / wildmenumode() ? "\<C-Y>" : "/"
else
  cnoremap <expr> / wildmenumode() ? "\<C-E>" : "/"
endif

nnoremap <leader>fp :edit ~/.projects/**/*
nnoremap <leader>fv :edit ~/.nvim/**/*
nnoremap <leader>fc :edit ~/.config/**/*
nnoremap <leader>fh :edit ~/**

" Some Readline Keybindings When In Insertmode {{{
inoremap <C-A> <C-O>^<C-g>u
inoremap <expr> <C-B> getline('.')=~'^\s*$'&&col('.')>
			\strlen(getline('.'))?"0\<Lt>C-D>\<Lt>Esc>kJs":"\<Lt>Left>"
inoremap <expr> <C-E> col('.')>strlen(getline('.'))<bar><bar>pumvisible()?"\<Lt>C-E>":"\<Lt>End>"

