source ~/.config/nvim/configs/Plugins.vim
source ~/.config/nvim/configs/Commands.vim
source ~/.config/nvim/configs/SetOrLet.vim
source ~/.config/nvim/configs/Snippets.vim

colorscheme dracula
let g:airline_theme='dracula'

augroup vimrc
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END

