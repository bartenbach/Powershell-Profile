set nocompatible
set tabstop=2
set showmatch
set mousehide
set number
set bg=dark
" with the colors in windows these look absolutely horrid
"set cursorcolumn
"set cursorline
set scrolloff=0
set nospell
set helplang=en
set spelllang=en
set spellsuggest=best
set winheight=50
set winwidth=50
set title
set showmode
set ruler
set noerrorbells
" annoying as shit
"set visualbell
set undolevels=50
set shiftwidth=2
set smarttab
set softtabstop=2
set expandtab
set smartindent
set cindent
set modeline
set write
set noautowrite
set noautoread
set fsync
set backup
set backupdir=$HOME\.vim\backup
set backupext=.bak
set swapfile
set dir=$HOME\.vim\swap
set updatecount=200
set updatetime=300000
set history=20
set errorfile=$HOME\.vim\error.log
set encoding=utf-8
set formatoptions=qt  " remove obnoxious auto-insert comment 'feature'
set shell=powershell
syntax on
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
if (has("termguicolors"))
  set termguicolors
endif
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

