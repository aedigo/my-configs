call plug#begin()
	Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'scrooloose/nerdtree'
  Plug 'itchyny/lightline.vim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'pangloss/vim-javascript'
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'vimwiki/vimwiki'
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
  Plug 'jparise/vim-graphql'
call plug#end()

let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

syntax enable
let g:dracula_colorterm = 0
colors dracula
set nocompatible
set hidden hls showcmd ruler incsearch laststatus=2
set softtabstop=0 noexpandtab
set shiftwidth=2
set tabstop=2 softtabstop=2 expandtab shiftwidth=2 smarttab
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

" vimwiki configuration
let g:vimwiki_list = [{'path': '~/.vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

nnoremap <C-Space> :NERDTreeToggle<CR>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
