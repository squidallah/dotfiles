" .vimrc
" Marcus Larsen

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif


" ----- BASICS -----
set nocompatible

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  set undofile		" keep an undo file (undo changes after closing)
endif

if has('mouse')
  set mouse=a
endif

" syntax highlighting. brug måske 'syntax enable' i stedet? se ':help syntax'.
syntax on

" filetype recognition
filetype on
filetype indent on
filetype plugin on

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
	\ if line("'\"") >= 1 && line("'\"") <= line("$") |
	\   exe "normal! g`\"" |
	\ endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif


" ----- PACKAGES -----
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
packadd matchit


" ----- FILETYPE SPECIFIC CONFIGS -----
" See the following files:
"   Text:	~/.vim/ftplugin/text.vim
"   Vim:	~/.vim/ftplugin/vim.vim
"   Bash:	~/.vim/ftplugin/sh.vim
"   Python:	~/.vim/ftplugin/python.vim
"   HTML:	~/.vim/ftplugin/html.vim


" ----- OPTIONS -----
set history=50
set backspace=indent,eol,start

set showcmd
set ruler
set number
set relativenumber

set hlsearch
set incsearch
set ignorecase
set smartcase

set path+=**
set wildmenu


" ----- COMMANDS -----
" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif


" ----- MAPPINGS -----
" Configure <Leader> as <Space>.
let mapleader = " "
nnoremap <Space> <NOP>
vnoremap <Space> <NOP>

" I don't want no Ex mode
noremap Q <NOP>

" :nohl
nnoremap Q :nohl<CR>

"" CTRL-Q for Escape
"nnoremap <C-Q> <Esc>
"inoremap <C-Q> <Esc>
"vnoremap <C-Q> <Esc>
"cnoremap <C-Q> <Esc>

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Disable arrow keys in normal and visual mode.
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
vnoremap <Left> <NOP>
vnoremap <Right> <NOP>
vnoremap <Up> <NOP>
vnoremap <Down> <NOP>

" Hardmode: h and l doesn't work in normal mode.
nnoremap <Leader>hardmode :nnoremap h oFY! <CR>:nnoremap l oFY! <CR>

" List open buffers and write ':b '
" Why does this work With <Esc> instead of <CR> ????
" 	nnoremap gb :ls<Esc>:b 
nnoremap gb :ls<CR>:b 

" Shortcuts for editing files
nnoremap <Leader>ev :e ~/.vimrc<CR>
nnoremap <Leader>eb :e ~/.bashrc<CR>
nnoremap <Leader>eh :e ~/Desktop/huskeliste.txt<CR>

" Surround selection in '', "", (), [], {} or <>
vnoremap <Leader>' <Esc><Esc>`<i'<Esc>`>la'<Esc>
vnoremap <Leader>" <Esc><Esc>`<i"<Esc>`>la"<Esc>
vnoremap <Leader>( <Esc><Esc>`<i(<Esc>`>la)<Esc>
vnoremap <Leader>[ <Esc><Esc>`<i[<Esc>`>la]<Esc>
vnoremap <Leader>{ <Esc><Esc>`<i{<Esc>`>la}<Esc>
vnoremap <Leader>< <Esc><Esc>`<i<<Esc>`>la><Esc>

"" Substitute word under cursor with current date
"nnoremap <Leader>wdate viw"=strftime('%c')<CR>p
"" Insert the current date at cursor (normal mode)
"nnoremap <Leader>date "=strftime('%c')<CR>p
"" Insert the current date at cursor (insert mode)
"inoremap <F2><Leader>date <Esc>"=strftime('%c')<CR>pa


" ----- ABBREVIATIONS -----
" Usage:
" 	*abbrev [keyword] [substitute]
" * is the char that defines what mode the abbrev works in, e.g. i for insert
" mode. keyword is the word typed, and after pressing a char not in iskeyword (check
" with [:set iskeyword?]), it is substituted with substitute.
iabbrev fuvk fuck
