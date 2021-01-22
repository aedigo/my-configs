source ~/.config/nvim/configs/Plugins.vim
source ~/.config/nvim/configs/Zfz.vim
source ~/.config/nvim/configs/Commands.vim
source ~/.config/nvim/configs/SetOrLet.vim
source ~/.config/nvim/configs/Snippets.vim

set termguicolors
let g:airline_theme = 'simple'
set background=dark
colorscheme solarized8

augroup vimrc
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END
let g:user_emmet_leader_key='<C-E>'

" This is used to change vimwiki default folder location.
let g:vimwiki_list = [{'path': '~/.vimwki/'}]
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END
