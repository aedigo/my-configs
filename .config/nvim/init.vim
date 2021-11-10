source ~/.config/nvim/configs/Plugins.vim
source ~/.config/nvim/configs/Zfz.vim
source ~/.config/nvim/configs/Commands.vim
source ~/.config/nvim/configs/SetOrLet.vim
source ~/.config/nvim/configs/Snippets.vim

colorscheme gruvbox

augroup vimrc
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END

