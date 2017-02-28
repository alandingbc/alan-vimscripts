" | ================  General Configuration ================ |

" Enable file type probe(or detction).
filetype plugin indent on 	" reguired

" Syntax highlighting.
syntax enable
syntax on

" VIMRUNTIME
" set runtiempath+=~/

set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,ucs-bom,gb2312,gbk,gb18030
set fileformat=unix
set autoread
set autowrite
set nobackup
set noswapfile
set confirm " Remind when handle unsaved or only-read file.
" set hidden

" Hidden toolbar and so forth.
set guioptions-=T   " Hidden tool bar.
set guioptions-=m   " Hidden menu bar.
set guioptions-=r   " Hidden right scroll bar.
set guioptions-=l   " Hidden left scroll bar.
set guioptions-=R   " Hidden right scroll bar.
set guioptions-=L   " Hidden left scroll bar.

set showcmd	        " Show the command input.
set showmode        " Show Vim current mode.
set showmatch       " Show bracket macthed.
set cursorline      " Line where cursor on ,highlight.
" set cursorcolumn    " Column where cursor on ,highlight.
set ruler           " Show ruler(Cursor Position).
set number          " Line number.
" set cursorline     " Show cursor line in bottom.
set hlsearch   	    " Highlight you searched in the cmdline mode or you marked.
set incsearch	    " Auto Match input when searching.
set ignorecase	    " Ignore case (case unsensitive).
" set smartcase       " When upper character in search.

set autoindent
set smartindent
set cindent         " C language auto indent.
" set cinkeys=0{,0},0),:,0#,!^F,o,O, " Default setting.
" set cinkeys=0{,0},0),:,0#,!^F,!<Tab>, " Default setting.
" set cinkeys=0{,0},:,0#,!<Tab>,!^F " Recommend setting.
" set cinoptions=>s,e0,n0,f0,{0,}0,^0,L-1,:s,=s,l0,b0,gs,hs,N0,ps,ts,is,+0,
            " \c3,C0,/0,(1s,us,U0,w0,W0,k0,m0,j0,J0,)20,*70,#0
set backspace=indent,eol,start
set smarttab	    " a <TAB> insert shiftwidth position.
set tabstop=4	    " a <TAB> takes tabstop width space.
set shiftwidth=4    " When smarttab on, indent 4 spaces.
set expandtab       " Use whitespace instead of tab.

set laststatus=2	" Enable status bar, and always do.
" set statusline=%F%m%r%h%w\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\-\%H:%M\")}
set scrolloff=3     " 光标移动到buffer的顶部和底部时保持3行距离  .
set history=256	" Records history
set textwidth=80
set nowrap

" set whichwrap=h,l " Not recommanded
set whichwrap=<,>
set wildmode=longest,list,full
set wildmenu
set wildignore=*.bak,*.o,*.e,*~,*.swp ",*.zip,*.bz,*.tar,*.gz
set fillchars=vert:\ ,stl:\ ,stlnc:\
set pumheight=10

" Use mouse anywhere in buffer.
set mouse=a
set selection=exclusive
set selectmode=mouse,key

set nofoldenable           " disable fold when open vim.
set foldmethod=syntax	" fold based on syntax.
set foldmethod=manual	" 手动折叠.
" set foldmethod=marker	" 折叠类型.

set helplang=cn	" Language help with Chinese.
set langmenu=zh_CN.UTF-8

set timeoutlen=500 " Default 1000, too long.

