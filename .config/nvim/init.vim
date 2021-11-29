" all the plugins I use
call plug#begin('~/.config/nvim/plugged')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'preservim/nerdcommenter'
  Plug 'Mofiqul/dracula.nvim'
  Plug 'vimwiki/vimwiki'
  Plug 'mattn/emmet-vim'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'pangloss/vim-javascript'
  Plug 'maxmellon/vim-jsx-pretty'
call plug#end()
" this is for lualine. Its the default configuration 
lua << END
require'lualine'.setup()
END

" With this when I, for example, open a file without being inside the
" directory of the file it will, basically, cd to that directory so I, now,
" have an easy acess to those files.
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
set foldmethod=expr

" all my lets
let g:coc_global_extensions = [ 'coc-json', 'coc-git', 'coc-html', 'coc-css', 'coc-prettier']
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

map <C-P> :FZF<Return>

" this will auto complete the signs
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" copy to clipboard
nnoremap yy  "+yy
nnoremap y  "+y
vnoremap y "+y

" paste from clipboard
nnoremap p "+p
nnoremap P "+P

filetype indent on

" this will allow me to search for everything inside the current directory
nnoremap <C-f> :find 

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

au BufWinLeave *.c mkview
au BufWinEnter *.c silent! loadview

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-b': 'split',
  \ 'ctrl-x': 'vsplit' }

" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

" Default fzf layout
" - Popup window (center of the screen)
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" - Popup window (center of the current window)
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true } }

" - Popup window (anchored to the bottom of the current window)
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true, 'yoffset': 1.0 } }

" - down / up / left / right
let g:fzf_layout = { 'up': '40%' }

" - Window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10new' }

" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
let g:fzf_history_dir = '~/.local/share/fzf-history'

let g:vimwiki_list = [{'path': '~/.vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" This is for vim-javascript plugin
set conceallevel=1
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif
