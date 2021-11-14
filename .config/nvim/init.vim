set mouse=a
set relativenumber
set number

set tabstop=4
set shiftwidth=4
set encoding=utf-8

" Cursor
autocmd InsertEnter,InsertLeave * set cul!

syntax on
colorscheme desert

set smartindent
set showmatch
set foldmethod=indent

" Add to .vimrc to enable project-specific vimrc
set exrc
set secure

" exrc allows loading local executing local rc files.
" secure disallows the use of :autocmd, shell and write commands in local .vimrc files.

" Ctags
set tags=tags
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR> 
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"----------------------------------------
" Cscope
" F5: find C symbol
" F6: find text string
" F7: find which function called this function
"----------------------------------------
if has("cscope")
	"set csprg=/home/linuxbrew/.linuxbrew/bin/cscope
	set csto=1
	set cst
	set nocsverb
	" add any database in current directory
	if filereadable("cscope.out")
		cs add cscope.out
	endif
	set csverb
endif
if has('quickfix')
	set cscopequickfix=s-,c-,d-,i-,t-,e-
endif

"nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <silent> <F5> : cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <silent> <F6> : cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <silent> <F7> : cs find c <C-R>=expand("<cword>")<CR><CR>

"----------------------------------------
" Tagbar
"----------------------------------------
let g:tagbar_width=25
"autocmd BufReadPost *.cpp,*.c,*.h,*.cc,*.cxx, call tagbar#autoopen()
nmap <silent> <F8> : TagbarToggle<CR>

"----------------------------------------
" Ale: Asynchronization Lint Engine
"----------------------------------------
set signcolumn=auto:1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>'
let g:ale_sign_warning = 'w'
let g:ale_statusline_format = ['  %d', '   %d', '  OK']
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

let g:ale_c_parse_compile_commands = 1
let g:ale_c_parse_makefile = 1

" Undo History
set undofile

" Quick Save and Quit
"inoremap <C-s> <Esc>:update<CR>i
noremap <Leader>s :update<CR>
noremap <Leader>a :wa<CR>

" Match 
inoremap {<Leader>	{<CR>}<Esc>O
inoremap {<CR>	{}<Esc>i
inoremap {<Tab>	{};<Esc>o
inoremap [<Leader>	[];<Esc><Left>i
inoremap [<CR>	[]<Esc>i
inoremap [<Tab>	[];<Esc>o
inoremap (<Leader>	();<Esc><Left>i
inoremap (<CR>	()<Esc>i
inoremap (<Tab>	();<Esc>o
inoremap <<Leader>	<>;<Esc><Left>i
inoremap <<CR>	<><Esc>i
inoremap <<Tab>	<>;<Esc>o
inoremap "<Leader>	""
inoremap "<CR>	""<Esc>i
inoremap '<Leader>	''
inoremap '<CR>	''<Esc>i

" Scrolling
inoremap <C-E> <C-X><C-E>
inoremap <C-Y> <C-X><C-Y>
set scrolloff=3				

" Switch Tabs
function MoveToPrevTab()
	"there is only one window
	if tabpagenr('$') == 1 && winnr('$') == 1
		return
	endif
	"preparing new window
	let l:tab_nr = tabpagenr('$')
	let l:cur_buf = bufnr('%')
	if tabpagenr() != 1
		close!
		if l:tab_nr == tabpagenr('$')
			tabprev
		endif
		sp
	else
		close!
		exe "0tabnew"
	endif
	"opening current buffer in new window
	exe "b".l:cur_buf
endfunc
function MoveToNextTab()
	"there is only one window
	if tabpagenr('$') == 1 && winnr('$') == 1
		return
	endif
	"preparing new window
	let l:tab_nr = tabpagenr('$')
	let l:cur_buf = bufnr('%')
	if tabpagenr() < tab_nr
		close!
		if l:tab_nr == tabpagenr('$')
			tabnext
		endif
		sp
	else
		close!
		tabnew
	endif
	"openin current buffer in new window
	exe "b".l:cur_buf
endfunc
nnoremap <A-h> :tabprevious<CR>
nnoremap <A-l> :tabnext<CR>
nnoremap <A-Left> :call MoveToPrevTab()<CR>
nnoremap <A-Right> :call MoveToNextTab()<CR>
nnoremap <A-t> :tabnew<CR>
noremap <C-Left>  :-tabmove<cr>
noremap <C-Right> :+tabmove<cr>
noremap <C-h>  :-tabmove<cr>
noremap <C-l> :+tabmove<cr>
noremap <Leader>h <C-W>h
noremap <Leader>j <C-W>j
noremap <Leader>k <C-W>k
noremap <Leader>l <C-W>l

" Disable Arrow Key excpet insert mode
"noremap <Left> <Nop>
"noremap <Right> <Nop>
"noremap <Up> <Nop>
"noremap <Down> <Nop>

" In insert or command mode, move normally by using Ctrl
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>

" NERDtree File 
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" NeoMake
let g:neomake_echo_current_error=1
let g:neomake_verbose=0
autocmd! BufWritePost *.rs NeomakeProject cargo 

" Write Annoation Quickly
iabbrev /*! 
			\/**************  **************
			\<CR>*****************************/ <Up>
iabbrev /** 
			\/**/
			\<Left><Left>
iabbrev #i #include ""<Left>
iabbrev #d #define
iabbrev #s struct
iabbrev #t typedef
"------------------------------------------------------------



"---------- Vundle ----------  
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'vhda/verilog_systemverilog.vim'

Plugin 'davidhalter/jedi-vim'

Plugin 'neoclide/coc.nvim'

" Code Annotation
Plugin 'preservim/nerdcommenter'

" File System
Plugin 'The-NERD-tree'

" Generate Outline
Plugin 'majutsushi/tagbar'

" Automatic Syntax Checking
Plugin 'dense-analysis/ale'

"File detection, syntax highlighting, formatting, Syntastic integration, and more
Plugin 'rust-lang/rust.vim'

" Rust Make
Plugin 'neomake/neomake'

"Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
