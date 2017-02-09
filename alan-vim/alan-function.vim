" | ===============  Functions & Key-Map Settings  =============== |

" Set mapleader
let mapleader=";"

" 1. ESC to command mode
inoremap <C-c> <ESC>

" Start
noremap <leader>b 0
" End
noremap <leader>e $

" Switching between windows.
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
inoremap <C-h> <Esc><C-W>h
inoremap <C-j> <Esc><C-W>j
inoremap <C-k> <Esc><C-W>k
inoremap <C-l> <Esc><C-W>l

" Similar as Windows, good or bad?
" inoremap <c-c> "+y
" inoremap <c-v> "+p
" inoremap <c-x> "+d
noremap <c-a> ggvGG

set pastetoggle=<F12>

" Auto Complete {}, <>, (), [], "", '', ``
" inoremap { {<CR>}<ESC>O
" inoremap " ""<ESC>i
" inoremap < <><ESC>i
" inoremap ( ()<ESC>i
" inoremap [ []<ESC>i
" inoremap ' ''<ESC>i
" inoremap ` ``<ESC>i

" Auto switch into insert mode when Vim start.
" exe \"startinsert"

" Make for complie and debug.
nmap <leader>mk :call Compile()<CR>
function! Compile()
	if &filetype!="c" || &filetype!="cc" || &filetype!="cpp" ||
				\&filetype!="h"
		w
		if filereadable("Makefile") | filereadable("makefile")
			silent make
		else
			set makeprg=gcc\ %\ -o\ %<
			silent make
		endif
		copen 30
	endif
endfunc

" Quickfix
" Too many prefix '<leader>c', it's easy to type this in command line.
nmap <leader>qc :cc<CR>
nmap <C-p> :cp<CR>
nmap <C-n> :cn<CR>
nmap <leader>ql :cl<CR>
nmap <leader>qw :cw 20<CR>
nmap <leader>qf :copen 20<CR>
nmap <leader>qc :cclose<CR>

" Location list
nmap <leader>ql :ll<CR>
nmap <C-p> :lp<CR>
nmap <C-n> :lne<CR>


" Higlight the 81th-column
set cc+=81
let s:cursorcolumn81 = 1
nnoremap <leader>rc :call CursorColumnToggle()<CR>
function CursorColumnToggle()
	if s:cursorcolumn81
		set cc-=81
		let s:cursorcolumn81 = 0
	else
		set cc+=81
		let s:cursorcolumn81 = 1
	endif
endfunction


" Show cursor current line & column with highlight.
set nocursorcolumn
let s:current_cursorcolumn = 0
nnoremap <leader>nc :call CurrentCursorColumnToggle()<CR>
function CurrentCursorColumnToggle()
	if s:current_cursorcolumn
		set nocuc
		let s:current_cursorcolumn = 0
	else
		set cuc
		let s:current_cursorcolumn = 1
	endif
endfunction


" Show red Error line or Underline when type over the 80th-column.
" autocmd BufRead,BufNewFile *.c,*.cpp,*.h,*.java,*.py match Error /\%80v.\%81v./
autocmd BufRead,BufNewFile *.c,*.cpp,*.h,*.java,*.py match Underlined /.\%81v/

" Locate in last closed postions when reopen the file.
if has("autocmd")
	autocmd BufReadPost * if line("'\"") > 0 | if line("'\"") <= line("$")
				\ |exe("normal '\"") | else |exe "norm $"|endif|endif
endif
