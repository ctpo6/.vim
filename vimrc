" Use vim, not vi api
set nocompatible

filetype plugin off
call pathogen#infect()
filetype plugin indent on

" Change leader to a comma because the backslash is too far away
" " That means all \x commands turn into ,x
" " The mapleader has to be set before vundle starts loading all 
" " the plugins.
let mapleader=","

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim

" " This makes vim act like all other editors, buffers can
" " exist in the background without being in a window.
" " http://items.sjbach.com/319/configuring-vim-right
set hidden

" Switch syntax highlighting on, when the terminal has colors
syntax on

" No backup files
set nobackup
" No write backup
set nowritebackup
" No swap file
set noswapfile

" Command history
set history=100

" Always show cursor
set ruler

" Show incomplete commands
set showcmd

" Incremental searching (search as you type)
set incsearch
" Highlight search matches
set hlsearch
" Ignore case in search
set smartcase

" Make sure any searches /searchPhrase doesn't need the \c escape character
set ignorecase

" Turn word wrap off
set nowrap

set textwidth=0
set wrapmargin=0

" Convert tabs to spaces
set expandtab
" Set tab size in spaces (this is for manual indenting)
set tabstop=2
" The number of spaces inserted for a tab (used for auto indenting)
set shiftwidth=2

" Highlight tailing whitespace
set list listchars=tab:\ \ ,trail:·

" Get rid of the delay when pressing O (for example)
" http://stackoverflow.com/questions/2158516/vim-delay-before-o-opens-a-new-line
set timeout timeoutlen=1000 ttimeoutlen=100

" Always show status bar
set laststatus=2

" Set the status line to something useful
set statusline=%f\ %=L:%l/%L\ %c\ (%p%%)

" Hide the toolbar
set guioptions-=T

" UTF encoding
set encoding=utf-8
set fenc=utf-8
set termencoding=utf-8

" Use system clipboard
" http://stackoverflow.com/questions/8134647/copy-and-paste-in-vim-via-keyboard-between-different-mac-terminals
set clipboard+=unnamed

" Don't show intro
set shortmess+=I

" Better splits (new windows appear below and to the right)
set splitbelow
set splitright

" Highlight the current line
set cursorline

" Visual autocomplete for command menu (e.g. :e ~/path/to/file)
set wildmenu

" redraw only when we need to (i.e. don't redraw when executing a macro)
set lazyredraw

" highlight a matching [{()}] when cursor is placed on start/end character
set showmatch

" Set built-in file system explorer to use layout similar to the NERDTree plugin
let g:netrw_liststyle=3

" Always highlight column 100 so it's easier to see where
" cutoff appears on longer screens
autocmd BufWinEnter * highlight ColorColumn ctermbg=darkblue
set colorcolumn=80

" always set autoindenting on
set ai						
" use indentation of previous line
set autoindent
" use intelligent indentation for C
set smartindent

" }}}


set background=dark
colorscheme solarized

" open NERDTree automatically if no files were specified
"autocmd vimenter * if !argc() | NERDTree | endif

" turn syntax highlighting on
set t_Co=256

" intelligent comments
"set comments=sl:/*,mb:\ *,elx:\ */


if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   "    if filereadable("cscope.out")
   "          cs add cscope.out
   "             " else add database pointed to by environment
   "                elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   "endif
   set csverb
	nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

	nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>

	nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>
endif


" Install OmniCppComplete like described on http://vim.wikia.com/wiki/C++_code_completion
" This offers intelligent C++ completion when typing ‘.’ ‘->’ or <C-o>

"-------------------------------------------------------------------------------
" ctags
"-------------------------------------------------------------------------------
" search
set tags=./tags,tags

" Load standard tag files
set tags+=~/.tags/include
set tags+=~/.tags/cpp;

" boost tags file is HUGE (((
"set tags+=~/.tags/boost;

" ctpp2 library headers
set tags+=~/.tags/ctpp2

" Rambler's CAS
set tags+=~/.tags/cas



" Install DoxygenToolkit from http://www.vim.org/scripts/script.php?script_id=987
"let g:DoxygenToolkit_authorName=“Gerhard Gappmeier <gerhard.gappmeier@ascolab.com>”


"---------------------------------------------------------------------------------------------------
" tagbar
"---------------------------------------------------------------------------------------------------
" Ширина окна
let g:tagbar_width = 40
let g:tagbar_sort = 1
let g:tagbar_usearrows = 1

"---------------------------------------------------------------------------------------------------
" Enhanced keyboard mappings
"---------------------------------------------------------------------------------------------------
" Press i to enter insert mode, and ii to exit.
:imap ii <Esc>

" in normal mode F2 will save the file
nmap <F2> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i

" Autoformat
map <F3> :Autoformat<CR><CR>

" switch between header/source with F4
"map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" recreate tags file with F5
map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" create doxygen comment
"map <F6> :Dox<CR>

map <F4> :cn<Cr>zvzz:cc<Cr>
map <S-F4> :cp<Cr>zvzz:cc<Cr>

" build using makeprg with <F7>
map <F7> :make<CR>

" build using makeprg with <S-F7>
map <S-F7> :make clean all<CR>

" open Tagbar window; jump to it if already exists
"map <F8> :TagbarOpen('j')<CR>
" toggle Tagbar window
nnoremap <F8> :TagbarToggle<CR>

" goto definition with F12
"map <F12> <Esc>:bn<CR>

" switch tabs
"nnoremap <C-Tab> <Esc>:tabn<CR>

" in diff mode we use the spell check keys for merging
"if &diff
"  ” diff settings
"  map <M-Down> ]c
"  map <M-Up> [c
"  map <M-Left> do
"  map <M-Right> dp
"  map <F9> :new<CR>:read !svn diff<CR>:set syntax=diff buftype=nofile<CR>gg
"else
"  " spell settings
"  :setlocal spell spelllang=en
"  " set the spellfile - folders must exist
"  set spellfile=~/.vim/spellfile.add
"  map <M-Down> ]s
"  map <M-Up> [s
"endif

" ENTER toggles highlighting for the current word on and off
let g:highlighting = 0
function! Highlighting()
  if g:highlighting == 1 && @/ =~ '^\\<'.expand('<cword>').'\\>$'
    let g:highlighting = 0
    return ":silent nohlsearch\<CR>"
  endif
  let @/ = '\<'.expand('<cword>').'\>'
  let g:highlighting = 1
  return ":silent set hlsearch\<CR>"
endfunction
nnoremap <silent> <expr> <CR> Highlighting()

" copy, cut, paste
vnoremap <C-c> "+y
vnoremap <C-x> "+x
map <C-v> "+gP

" open the definition in a new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" open the definition in a vertical split
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" astyle for CPP
autocmd BufNewFile,BufRead *.cpp set formatprg=astyle\ --mode=c\ --style=ansi\ -t4bJUp

" nerdtree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" autosource .vimrc
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END
