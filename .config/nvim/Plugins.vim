call plug#begin('~/.config/nvim/plugged')
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'vim-airline/vim-airline-themes'
  Plug 'preservim/nerdcommenter'
  Plug 'Mofiqul/dracula.nvim'
  Plug 'vimwiki/vimwiki'
  Plug 'mattn/emmet-vim'
  Plug 'editorconfig/editorconfig-vim'
call plug#end()


