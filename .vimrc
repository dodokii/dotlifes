" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim

" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
" call vundle#begin()

" let Vundle manage Vundle, required
" Plugin 'VundleVim/Vundle.vim'
" Plugin 'preservim/nerdtree'
" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'

" call vundle#end()

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'christoomey/vim-tmux-navigator'
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim',

" Using a non-default branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
" Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

" Initialize plugin system
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Sets how many lines of history VIM has to remember
" set history=500

" Set to auto read when a file is changed from the outside
set autoread
" au FocusGained,BufEnter * checktime


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 3 lines to the cursor - when moving vertically using j/k
set so=3

" Add numbers to each line on the left-hand side.
set number

" Show relative line number
set relativenumber

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
" set cursorcolumn

" Add a bit extra margin to the left
" set foldcolumn=1

" Highlight 80 column
set colorcolumn=80
highlight ColorColumn ctermbg=darkgrey

" Always show current position
" set ruler

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" Height of the command bar
set cmdheight=1

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Avoid garbled characters in Chinese language windows OS
" let $LANG='en' 
" set langmenu=en
" source $VIMRUNTIME/delmenu.vim
" source $VIMRUNTIME/menu.vim

" Ignore compiled files
" set wildignore=*.o,*~,*.pyc
" if has("win16") || has("win32")
"     set wildignore+=.git\*,.hg\*,.svn\*
" else
"     set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
" endif

" A buffer becomes hidden when it is abandoned
" set hid

" 修正 vim 删除/退格键行为
" 原生的 vim 行为有点怪：
" 如果你在一行的开头切换到插入模式，这时按退格无法退到上一行
" 如果你在一行的某一列切换到插入模式，这时按退格无法退删除这一列之前的字符
" 如果你开启了 autoindent，按回车时 vim 会根据上一行自动缩进，这时按退格无法删除缩进字符
" 通过设置 eol, start 和 indent 可以修正上述行为
set backspace=eol,start,indent
" set whichwrap+=<,>,h,l

" 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set ignorecase smartcase

" Use highlighting when doing a search.
set hlsearch

" 输入搜索内容时就显示搜索结果
set incsearch

" Show matching words during a search.
set showmatch

" 插入括号时，短暂地跳转到匹配的对应括号
" How many tenths of a second to blink when matching brackets
" set mat=2

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
" set magic

" No annoying sound on errors
set noerrorbells
" set novisualbell
" set t_vb=
" set tm=500


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Turn syntax highlighting on.
syntax on

" Enable 256 colors palette in Gnome Terminal
" if $COLORTERM == 'gnome-terminal'
"     set t_Co=256
" endif

" try
"     colorscheme desert
" catch
" endtry

" set background=dark

" vim 内部使用的编码，默认使用 latin1，改成通用的 utf8 编码，避免乱码
set encoding=utf-8

" 文件编码探测列表
" vim 启动的时候会依次使用本配置中的编码对文件内容进行解码
" 如果遇到解码失败，则尝试使用下一个编码
" 常见的乱码基本都是 windows 下的 gb2312, gbk, gb18030 等编码导致的
" 所以探测一下 utf8 和 gbk 足以应付大多数情况了
set fileencodings=utf-8,gb18030


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim 默认使用单行显示状态，但有些插件需要使用双行展示，不妨直接设成 2
set laststatus=2

" Format the status line
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
" 禁止生成 swap 恢复文件
" 早期计算机经常崩溃，vim 会自动创建一个 .swp 结尾的文件
" 崩溃重启后可以从 .swap 文件恢复
" 现在计算机鲜少崩溃了，可以禁用此功能
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" 1 tab == 4 spaces
" Set shift/tab width to 4 spaces.
set shiftwidth=4
set tabstop=4

" Be smart when using tabs ;)
" set smarttab

" 显示窗口比较小的时候折行展示，不然需要水平翻页，推荐
set linebreak
" Linebreak on 500 characters
set tw=500

" 在插入模式按回车时 vim 会自动根据上一行的缩进级别缩进
set autoindent
" set si "Smart indent
" set wrap "Wrap lines


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = "\<space>"

" :W sudo saves the file 
" (useful for handling the permission-denied error)
" command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Visual mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Insert mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Exit insert mode quickly.
inoremap jk <Esc>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Normal mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
" map <space> /
" map <C-space> ?

" Fast saving
nnoremap <leader>w :w!<cr>

" Fast saving
nnoremap <leader>wq :wq!<cr>

" Turn off search highlighting
nnoremap <leader>\ :nohlsearch<CR>
" Disable highlight when <leader><cr> is pressed
" map <silent> <leader><cr> :noh<cr>

" Center the cursor vertically when moving to the next word during a search.
nnoremap n nzz
nnoremap N Nzz

" Yank from cursor to the end of line.
nnoremap Y y$

" Exit insert mode after creating a new line above or below the current line.
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>

" Jump back to the last cursor position.
nnoremap <leader>- ``

" Map the F5 key to run a Python script inside Vim.
" I map F5 to a chain of commands here.
" :w saves the file.
" <CR> (carriage return) is like pressing the enter key.
" !clear runs the external clear screen command.
" !python3 % executes the current file with Python.
" nnoremap <f5> :w <CR>:!clear <CR>:!python3 % <CR>

" Split the window
nnoremap <leader>sv :vsplit<CR>
nnoremap <leader>sh :split<CR>

" Close the window
nnoremap <leader>sx :quit<CR>
nnoremap <leader>so :only<CR>

" Smart way to move between windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Resize split windows
nnoremap <c-a><c-k> <c-w>+
nnoremap <c-a><c-j> <c-w>-
nnoremap <c-a><c-l> <c-w>>
nnoremap <c-a><c-h> <c-w><

" Close the current buffer
" map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
" map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
nnoremap <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
" map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
" try
"   set switchbuf=useopen,usetab,newtab
"   set stal=2
" catch
" endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Command+[jk] on mac
" nmap <M-j> mz:m+<cr>`z
" nmap <M-k> mz:m-2<cr>`z
" vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
" vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" if has("mac") || has("macunix")
"   nmap <D-j> <M-j>
"   nmap <D-k> <M-k>
"   vmap <D-j> <M-j>
"   vmap <D-k> <M-k>
" endif

" Delete trailing white space on save, useful for some filetypes ;)
" fun! CleanExtraSpaces()
"     let save_cursor = getpos(".")
"     let old_query = getreg('/')
"     silent! %s/\s\+$//e
"     call setpos('.', save_cursor)
"     call setreg('/', old_query)
" endfun

" if has("autocmd")
"     autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
" endif
