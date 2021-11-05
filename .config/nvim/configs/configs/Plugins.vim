call plug#begin('~/.config/nvim/plugged')
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'preservim/nerdcommenter'
  Plug 'vimwiki/vimwiki'
  Plug 'vim-airline/vim-airline'
  Plug 'terminalnode/sway-vim-syntax'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'mattn/emmet-vim'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'morhetz/gruvbox'
  Plug 'romainl/vim-cool'
  Plug 'preservim/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'tridactyl/vim-tridactyl'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
call plug#end()


