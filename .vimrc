setlocal path=.,,src/**,public/**
set number
set wildmenu
set wildcharm=<C-z>
set wildignore=*/node_modules/*
set wildignorecase
set noshowmode
set colorcolumn=85
set hlsearch
set number
set relativenumber
set tabstop=2 shiftwidth=2 expandtab
set autoindent
" sets foreground color (ANSI, true-color mode)
let &t_8f = "\e[38;2;%lu;%lu;%lum"

" sets background color (ANSI, true-color mode)
let &t_8b = "\e[48;2;%lu;%lu;%lum"

set termguicolors

let g:netrw_banner=0
let g:netrw_browser_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
let g:dracula_colorterm = 0
packadd! dracula
syntax enable
colorscheme dracula

" this is for emmet
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key=','
autocmd FileType html,css,sass,scss EmmetInstall

" mappings
" non-recursive
noremap <C-p> :find *
noremap nt :tabn<cr>
noremap pt :tabp<cr>
noremap <C-n> :edit .<cr>
nnoremap <leader>b :b <C-d>
" to get in some directories
nnoremap <leader>fp  :edit ~/.web/**/*
nnoremap <leader>fh  :edit ~/**
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
" easier way to navigate in command mode
inoremap <C-A> <C-O>^<C-g>u
inoremap <expr> <C-B> getline('.')=~'^\s*$'&&col('.')>
      \strlen(getline('.'))?"0\<Lt>C-D>\<Lt>Esc>kJs":"\<Lt>Left>"
inoremap <expr> <C-E> col('.')>strlen(getline('.'))<bar><bar>pumvisible()?"\<Lt>C-E>":"\<Lt>End>"
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

if has('vim-8.2')
  cnoremap <expr> / wildmenumode() ? "\<C-Y>" : "/"
else
  cnoremap <expr> / wildmenumode() ? "\<C-E>" : "/"
endif

if exists('##CmdLineEnter')
  augroup dynamic_smartcase
    autocmd!
    autocmd CmdLineEnter : set nosmartcase
    autocmd CmdLineLeave : set smartcase
  augroup END
endif

" statusline
set laststatus=2
set statusline=
set statusline+=%2*
set statusline+=%{StatuslineMode()}
set statusline+=%1*
set statusline+=\ 
set statusline+=<
set statusline+=<
set statusline+=\ 
set statusline+=%f
set statusline+=\ 
set statusline+=>
set statusline+=>
set statusline+=%=
set statusline+=%m
set statusline+=%h
set statusline+=%r
set statusline+=\ 
set statusline+=%3*
set statusline+=%{b:gitbranch}
set statusline+=%1*
set statusline+=\ 
set statusline+=%4*
set statusline+=%F
set statusline+=:
set statusline+=:
set statusline+=%5*
set statusline+=%l
set statusline+=/
set statusline+=%L
set statusline+=%1*
set statusline+=|
set statusline+=%y
hi User2 ctermbg=lightgreen ctermfg=black guibg=lightgreen guifg=black
hi User1 ctermbg=black ctermfg=white guibg=black guifg=white
hi User3 ctermbg=black ctermfg=lightblue guibg=black guifg=lightblue
hi User4 ctermbg=black ctermfg=lightgreen guibg=black guifg=lightgreen
hi User5 ctermbg=black ctermfg=magenta guibg=black guifg=magenta

function! StatuslineMode()
  let l:mode=mode()
  if l:mode==#"n"
    return "NORMAL"
  elseif l:mode==?"v"
    return "VISUAL"
  elseif l:mode==#"i"
    return "INSERT"
  elseif l:mode==#"R"
    return "REPLACE"
  elseif l:mode==?"s"
    return "SELECT"
  elseif l:mode==#"t"
    return "TERMINAL"
  elseif l:mode==#"c"
    return "COMMAND"
  elseif l:mode==#"!"
    return "SHELL"
  endif
endfunction

function! StatuslineGitBranch()
  let b:gitbranch=""
  if &modifiable
    try
      let l:dir=expand('%:p:h')
      let l:gitrevparse = system("git -C ".l:dir." rev-parse --abbrev-ref HEAD")
      if !v:shell_error
        let b:gitbranch="(".substitute(l:gitrevparse, '\n', '', 'g').") "
      endif
    catch
    endtry
  endif
endfunction

augroup GetGitBranch
  autocmd!
  autocmd VimEnter,WinEnter,BufEnter * call StatuslineGitBranch()
augroup END
