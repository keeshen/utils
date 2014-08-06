set nocompatible "Turn off all the vi compatible crap
"view settings
syntax enable
set bg=dark
colorscheme ir_black
set nowrap
set number
set ruler
set scrolloff=4
set laststatus=2
"set langmap='q,\,w,.e,pr,yt,fy,gu,ci,ro,lp,/[,=],aa,os,ed,uf,ig,dh,hj,tk,nl,s\\;,-',\\;z,qx,jc,kv,xb,bn,mm,w\,,v.,z/,[-,]=,\"Q,<W,>E,PR,YT,FY,GU,CI,RO,LP,?{,+},AA,OS,ED,UF,IG,DH,HJ,TK,NL,S:,_\",:Z,QX,JC,KV,XB,BN,MM,W<,V>,Z?

"auto-formatting
set textwidth=80
set comments=sr:/*,mb:*,ex:*/
set formatoptions+=rnocq
set ff=unix

"editing
set bs=2
set foldmethod=marker

"undo info
set undofile
set undodir=~/.vim/undo

"backups
set backup
set backupdir=~/.vim/backup
set backupext=~
set directory=~/.vim/swp
set viewdir=~/.vim/view

silent execute '!mkdir -p ~/.vim/backup'
silent execute '!mkdir -p ~/.vim/swp'
silent execute '!mkdir -p ~/.vim/view'
silent execute '!mkdir -p ~/.vim/undo'
au BufWinLeave * silent! mkview 
au BufWinEnter * silent! loadview

"indenting
set autoindent
set smartindent

"searching
set nohlsearch
set noincsearch
set ignorecase
set smartcase
set gdefault

"tabbing
set splitbelow
set noexpandtab
set tabstop=2
set shiftwidth=2

"misc
set encoding=utf-8
set noerrorbells
set wildignore=*.o,*.obj,*.bak,*.exe,*.bup,*.class
set showmode
set showcmd

"dictionary
set dictionary+=/usr/share/dict/words

"abbreviations
iab sop System.out.print
iab sol System.out.println
iab sep System.err.print
iab sel System.err.println
iab pritn print
iab ut   uint32_t
iab ut32 uint32_t
iab ut16 uint16_t
iab ut8  uint8_t
iab it32 int32_t
iab it16 int16_t
iab it8  int8_t
" working on it... iab tc:\([ a-zA-Z_.0-9()\[\]\"\'\r\n]\+\):\([a-zA-Z]\+\):\([a-zA-Z]\+\):\([ a-zA-Z_.0-9()\[\]\"\';]\+\) try\ {\ \1\ }\ catch(\2\ \3)\ {\ \4\ } 
iab #i #include
iab #d #define
iab laod load
iab teh the
iab tihs this
ca maek make
ca amek make
ca amke make
ca amk mak
ca mka mak

"language specific
let java_highlight_java_lang_ids=1
let java_highlight_java_io=1
let java_highlight_debug=1

"auto functions
"autocmd BufRead,BufNewFile *.py setlocal expandtab tabstop=4 shiftwidth=4 foldmethod=indent foldnestmax=3

if !exists("autocommands_loaded")
	let autocommands_loaded=1
	autocmd BufRead,BufNewFile,FileReadPost *.py source ~/.vim/python 
endif
autocmd BufRead,BufNewFile *.sql setlocal expandtab foldmethod=indent
autocmd BufRead,BufNewFile Makefile,makefile setlocal noexpandtab
autocmd BufRead,BufNewFile *.c,*.C,*.cpp,*.h,*.cc setlocal cindent
autocmd BufRead,BufNewFile *.java setlocal expandtab tabstop=4 shiftwidth=4 cindent
autocmd BufRead,BufNewFile *.tex setlocal autoindent textwidth=70 foldmethod=indent foldnestmax=4 complete-=k complete+=k
autocmd BufRead,BufNewFile *.s,*.as,*.asm,*.S setlocal expandtab

nnoremap Y y$
vnoremap jk <esc>
inoremap jk <esc>
inoremap <esc> <NOP>
inoremap <left> <NOP>
inoremap <right> <NOP>
inoremap <up> <NOP>
inoremap <down> <NOP>
nmap ,v :tabnew ~/.vimrc<return>
nmap ,c :source ~/.vimrc<return>
nmap gp mp{v}gq`p
map <f5> :w<CR>:!gdb %<CR>
map <f8> :w<CR>:make<CR>:!gdb %<CR>
map <f6> :w<CR>:make<CR>:!./a.out
map <f7> :w<CR>:make<CR>:!./%<<CR>
map <f2> :w<CR>:! g++ %<CR>:! ./a.out<CR>
noremap <silent> <f1> :w!<CR>:! python %<CR>
map <S-h> gT
map <S-l> gt
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Commenting blocks of code.
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

nmap <space> i jkr
nmap <tab> a jkr
nmap ,d a/*{{{*/<ESC>
nmap ,f a/*}}}*/<ESC>
nmap ,D o/*{{{*/<ESC>
nmap ,F o/*}}}*/<ESC>
"nmap ,s :w<CR>

vnoremap > >gv
vnoremap < <gv

