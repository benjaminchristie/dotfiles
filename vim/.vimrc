
" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2017 Sep 20
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim
set hlsearch
set incsearch
set showcmd
set relativenumber
set number
set nofoldenable
set ts=4 sw=4
" Search down subfolders
" Provides tab-completion for all file-related tasks
set path+=**
set wrap " set word wrap, good for markdown files
" Display all matching files when we tab complete
set wildmenu
" Various remappings for width and other
" imap kj <Esc>
" imap jk <Esc>
" Remap arrow keys
nnoremap <Up> <C-b>
nnoremap <Down> <C-f>
nnoremap <Left> gT
nnoremap <Right> gt
nnoremap <Right> gt
" Make seperated windows easier to change size
nnoremap `1 :1winc<<CR>
nnoremap `4 :1winc><CR>
nnoremap `2 :1winc+<CR>
nnoremap `3 :1winc-<CR>
" Adding functionality to making a pdf in a new view
nnoremap <C-k> :!mkpdf %<CR><CR>
" New tab
nnoremap ,t <Esc>:tabnew<CR> 
" Make Y behave like the rest of the capital letters
nnoremap Y y$
if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

" Adding wombat theme to startup
let g:airline_theme='raven'
" change runtime to accomadate ctrl-p package
set runtimepath^=~/.vim/pack/dist/start/ctrlp.vim
let g:ctrlp_map = '<c-p>'
autocmd BufEnter *.launch :setlocal filetype=xml
