" VIM Configuration File
" Description: Optimized for C/C++ development, but useful also for other things.

" disable vi compatibility (emulation of old bugs)
set nocompatible

filetype plugin off
"call pathogen#infect()
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

set background=dark
colorscheme solarized

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
syntax on
set hlsearch

" open NERDTree automatically if no files were specified
"autocmd vimenter * if !argc() | NERDTree | endif

" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

set ruler					" show the cursor position all the time

set bs=indent,eol,start		" allow backspacing over everything in insert mode
"set ai						" always set autoindenting on

" use indentation of previous line
"set autoindent
" use intelligent indentation for C
"set smartindent

" configure tabwidth and insert spaces instead of tabs
set tabstop=4
set shiftwidth=4
"set expandtab        " expand tabs to spaces

" wrap lines at 120 chars. 80 is somewaht antiquated with nowadays displays.
set textwidth=120
" turn syntax highlighting on
set t_Co=256
" turn line numbers on
set number
" highlight matching braces
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */


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

" Load standard tag files
set tags+=~/.tags/cpptags,tags
"set tags+=~/.vim/tags/gl
"set tags+=~/.vim/tags/sdl
"set tags+=~/.vim/tags/qt4

" Install DoxygenToolkit from http://www.vim.org/scripts/script.php?script_id=987
"let g:DoxygenToolkit_authorName=“Gerhard Gappmeier <gerhard.gappmeier@ascolab.com>”


"---------------------------------------------------------------------------------------------------
" tagbar
"---------------------------------------------------------------------------------------------------
" Показывать окно слева
let g:tagbar_left = 1
" Ширина окна
let g:tagbar_width = 30
" Не сортировать
let g:tagbar_sort = 0


"---------------------------------------------------------------------------------------------------
" Enhanced keyboard mappings
"---------------------------------------------------------------------------------------------------
" in normal mode F2 will save the file
nmap <F2> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i
" switch between header/source with F4
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
" recreate tags file with F5
map <F5> :!ctags -R –c++-kinds=+p –fields=+iaS –extra=+q .<CR>
" create doxygen comment
"map <F6> :Dox<CR>
" build using makeprg with <F7>
map <F7> :make<CR>
" build using makeprg with <S-F7>
map <S-F7> :make clean all<CR>

" open Tagbar window
nmap <F8> :TagbarToggle<CR> 

" goto definition with F12
map <F12> <Esc>:bn<CR>


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


" Enter toggles highlighting for the current word on and off
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

" C-c - copy to the system clipboard
vnoremap <C-c> "*y

"map <M-c>	:call ferraltogglecommentify#FtcTc()<CR>j 
"imap <M-c>	<ESC>:call ferraltogglecommentify#FtcTc()<CR>j 

" Comment this line at ^
function! CommentLineToEnd(commentLeader)
   	let save_cpo   = &cpoptions
   	let save_paste = &paste
   	set cpo&vim
    set paste
    let escCommentLeader = escape(a:commentLeader, '^[.*\~]$')
    if getline(".") =~ '^\s*' . escCommentLeader
        execute "normal ^" . strlen(a:commentLeader) . "x"
    else
        execute "normal I" . a:commentLeader . "\<ESC>"
    endif
   	let &cpo   = save_cpo
   	let &paste = save_paste
endfunction
map <M-c> :call CommentLineToEnd('//')<CR> 
imap <M-c> <ESC>:call CommentLineToEnd('//')<CR> 

" Autoformat
noremap <F3> :Autoformat<CR><CR>
