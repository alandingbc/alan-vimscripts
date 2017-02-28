" | ================  Vundle Configuration ================ | 
filetype off	" required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/path/to/here')

" Let Vundle manage itself.
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'Tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/cscope.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
Plugin 'scrooloose/nerdcommenter'
" Plugin 'DeleteTrailingWhitespace'
" Plugin 'ShowTrailingWhitespace'
" Plugin 'Siver/ultisnips'
" Plugin 'honza/vim-snippets'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'Valloric/ListToggle'
Plugin 'wesleyche/SrcExpl'

" Color schemes
Plugin 'antlypls/vim-colors-codeschool'
Plugin 'Solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" All of Plugins must be added before the following line
call vundle#end()			" required

" To ignore plugin indent changes, instead use:
filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" ColorScheme
set background=dark " Background
set t_Co=256        " enable color_256
colorscheme codeschool

" | ===============  PLUGIN SETTING  ============== |

" set tags= "ctags database path changed to owner's path
set tags=tags
if filereadable("tags")
    set tags+=./tags
elseif filereadable("/home/alan/github/linux-torvald-linus/tags")
    set tag+=/home/alan/github/linux-torvald-linus/tags
endif


" -----  Tagbar  -----  [- Inused -]

let g:tagbar_ctags_bin = '/usr/bin/ctags'
let g:tagbar_width = 30
let g:tagbar_left = 1
nmap <F7> :TagbarToggle<CR>


" -----  Taglist  -----  [- Unused -]

" let Tlist_Ctags_Cmd = "/usr/bin/ctags"
" let Tlist_Auto_Open=0
" let g:Tlist_Auto_Update=1
" let g:Tlist_Process_File_Always=1
" let g:Tlist_Exit_OnlyWindow=1
" let g:Tlist_Show_One_File=1
" let g:Tlist_WinWidth=40
" let g:Tlist_Enable_Fold_Column=0
" let g:Tlist_Auto_Highlight_Tag=1


" -----  NERDTree  -----  [- Inused -]

let g:NERDTreeWinPos="right"
let g:NERDTreeWinSize=30
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeQuitOnOpen=1
nmap <F9> :NERDTreeToggle<CR>


" -----  Cscope  -----  [- Inused -]

if has("cscope")
    set csprg=/usr/bin/cscope       "cscope path
    set csto=0                      "cscope DB search first
    set cst                         "cscope DB tag DB search
    set nocsverb                    "verbose off
    " add any database in current directory
    if filereadable("cscope.out")
        cs add ./cscope.out
        " else add database pointed to by environment
    else
        cs add /work/source-code/torvalds_linux_kernel/cscope.out \
    endif
    set csverb						"verbose on
endif

" let g:cscope_open_location = 0
" let g:cscope_auto_update = 0
" let g:cscope_silent = 1
" let g:cscope_ignore_files = '\.Z$\|\.zip$\|\.zipx$\|\.lib'
" let g:cscope_preload_path="/usr/include/;"

let Tlist_Show_One_File=0

" map g<C-]> :cs find 3 <C-R>=expand("<cword>")<CR><CR>
" map g<C-\> :cs find 0 <C-R>=expand("<cword>")<CR><CR>

nmap <leader>sa :cs add cscope.out<CR>
" s: Find this C symbol
nnoremap  <leader>ss :cs find s <C-R>=expand("<cword>")<CR><CR>
" g: Find this definition
nnoremap  <leader>sg :cs find g <C-R>=expand("<cword>")<CR><CR>
" d: Find functions called by this function
nnoremap  <leader>sd :cs find d <C-R>=expand("<cword>")<CR><CR>
" c: Find functions calling this function
nnoremap  <leader>sc :cs find c <C-R>=expand("<cword>")<CR><CR>
" t: Find this text string
nnoremap  <leader>st :cs find t <C-R>=expand("<cword>")<CR><CR>
" e: Find this egrep pattern
nnoremap  <leader>se :cs find e <C-R>=expand("<cword>")<CR><CR>
" f: Find this file
nnoremap  <leader>sf :cs find f <C-R>=expand("<cfile>")<CR><CR>
" i: Find files #including this file
nnoremap  <leader>si :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>

" Using 'CTRL-spacebar' then a search type makes the vim window
" split horizontally, with search result displayed in
" the new window.
" nmap <C-Space>s :scs find s <C-R>=expand("<cword>")<CR><CR>
" nmap <C-Space>g :scs find g <C-R>=expand("<cword>")<CR><CR>
" nmap <C-Space>c :scs find c <C-R>=expand("<cword>")<CR><CR>
" nmap <C-Space>t :scs find t <C-R>=expand("<cword>")<CR><CR>
" nmap <C-Space>e :scs find e <C-R>=expand("<cword>")<CR><CR>
" nmap <C-Space>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
" nmap <C-Space>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
" nmap <C-Space>d :scs find d <C-R>=expand("<cword>")<CR><CR>

" -----  IndentLine -----  [- Unused -]

let g:indentLine_enabled = 1        " default off
let g:indentLine_setColors = 1      " set 0 highlihgt conceal
let g:indentLine_indentLevel = 3    " only show 2 indent line enough.
let g:indentLine_color_term = 248
let g:indentLine_color_tty_light = 4    " default 4
let g:indentLine_color_tty_dark = 2     " default 2
let g:indentLine_fileType = ['c', 'cpp', 'sh']
let g:indentLine_fileTypeExclude = ['text']
nnoremap <leader>ie :IndentLinesEnable<CR>
nnoremap <leader>id :IndentLinesDisable<CR>
nnoremap <leader>il :IndentLinesToggle<CR>


" -----  YouCompleteMe -----  [- Inused -]

set completeopt=longest,menu
autocmd InsertLeave * if pumvisible() == 0 |pclose|endif
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
let g:ycm_global_ycm_extra_conf = '/home/alan/.vim/bundle/YouCompleteMe/
            \third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" let g:ycm_global_ycm_extra_conf = '/home/alan/.ycm_confirm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 1 " 0 Disable Syntastic
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_max_diagnostics_to_display = 1000
let g:ycm_open_loclist_on_ycm_diags = 1
let g:ycm_always_populate_location_list = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1 "syntax keyword completion
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_cache_omnifunc = 1
let g:ycm_confirm_extra_conf = 0 "Don't ask when open Vim

" let g:ycm_key_detailed_dianostics = '<leader>d' " :YcmShowDetailedDignostic
nnoremap <leader>gd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>fi :YcmCompleter FixIt<CR>
highlight YcmErrorLine guibg=#3f0000

let g:ycm_filetype_blacklist = {
            \ 'tagbar' : 1,
            \ 'qf' : 1,
            \ 'notes' : 1,
            \ 'markdown' : 1,
            \ 'unite' : 1,
            \ 'text' : 1,
            \ 'vimwiki' : 1,
            \ 'pandoc' : 1,
            \ 'infolog' : 1,
            \ 'mail' : 1
            \}

let g:ycm_filetype_specific_completion_to_disable = {
            \ 'gitcommit': 1
            \}

" NOTE:
" YouCompleteMe has stopped using Synstastic for diagnostics display !!
" so I deprecated Syntastic too.
"
" -----  Syntastic -----  [- Unused -]
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0


" -----  nerdcommenter -----  [- Inused -]

let NERDSpaceDelims = 1 " Add white space before left & after right commenter.
" <leader>ci " Add/Remove commment in lines. - Trigger
" <leader>cm " Add comment for whole selected contents.
" <leader>cs " Add comment in front of like function or code block.
" <leader>cc " Add comment in lines, retry it will do repeated comments.
" <leader>cu " Undo comment selected or in line. If no comment, do nothing.
" <leader>ca " Switch comment format between '\\' and '\* *\'.
" <leader>cA " Add comment in line tail.
" <leader>cb " Add comment in line with both aligned.
" <leader>cl " Add comment in line with left aligned.


" -----  DeleteTrailingWhitespace ----- [- Inused -]
" let g:DeleteTrailingWhitespace = 1
" let g:DeleteTrailingWhitespace_Action = 'delete'


" -----  Airline ----- [- Inused -]

let g:airline_theme='molokai'
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
else
    let g:airline_symbols = "\ua0"
endif

" Airline Command
" Turn off/on Airline
nnoremap <leader>al :AirlineToggle<CR>
" AirlineTheme
" AirlineToggleWhitespace
" AirlineRefresh
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#buffer_nr_show = 1

let g:airline#extensions#tabline#whitespace#enable = 1
let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing', 'long', 'mixed-indent-file' ]
let g:airline#extensions#tabline#whitespace#symbol = '!'
let airline#extensions#c_like_langs = ['c', 'cpp', 'cuda', 'go', 'javascript', 'ld', 'php']

" Switch buffers
noremap <TAB> :bn<CR>
noremap <leader>bn :bn<CR>
noremap <leader>bp :bp<CR>
" Delete current buffer
noremap <leader>bd :bd<CR>

let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

let g:airline#extensions#tabline#buffer_idx_format = {
            \ '0': '0 ',
            \ '1': '1 ',
            \ '2': '2 ',
            \ '3': '3 ',
            \ '4': '4 ',
            \ '5': '5 ',
            \ '6': '6 ',
            \ '7': '7 ',
            \ '8': '8 ',
            \ '9': '9 '
            \}



" -----  SrcExpl ----- [- Inused -]
" // The switch of the Source Explorer
nmap <F8> :SrcExplToggle<CR>
" // Set the height of Source Explorer window
let g:SrcExpl_winHeight = 10
" // Set 100 ms for refreshing the Source Explorer
let g:SrcExpl_refreshTime = 100
" // Set "Enter" key to jump into the exact definition context
let g:SrcExpl_jumpKey = "<ENTER>"
" // Set "Space" key for back from the definition context
let g:SrcExpl_gobackKey = "<SPACE>"
" // In order to avoid conflicts, the Source Explorer should know what plugins
" // except itself are using buffers. And you need add their buffer names into
" // below listaccording to the command ":buffers!"
let g:SrcExpl_pluginList = [
            \ "tagbar",
            \ "Tagbar",
            \ "_NERD_tree_",
            \ ]
" // Enable/Disable the local definition searching, and note that this is not
" // guaranteed to work, the Source Explorer doesn't check the syntax for now.
" // It only searches for a match with the keyword according to command 'gd'
let g:SrcExpl_searchLocalDef = 1
" // Do not let the Source Explorer update the tags file when opening
let g:SrcExpl_isUpdateTags = 0
" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to
" // create/update the tags file
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ."
" // Set "<F12>" key for updating the tags file artificially
let g:SrcExpl_updateTagsKey = "<F12>"
" // Set "<F3>" key for displaying the previous definition in the jump list
let g:SrcExpl_prevDefKey = "<F3>"
" // Set "<F4>" key for displaying the next definition in the jump list
let g:SrcExpl_nextDefKey = "<F4>"
