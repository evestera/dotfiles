set nocompatible
set encoding=utf-8

syntax on
set number

set tabstop=4
set shiftwidth=4
filetype plugin indent on

set backspace=2
set whichwrap+=<,>,h,l,[,]

set showcmd

set mouse=a

let mapleader = "ø"
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>

set incsearch
set hlsearch
:nnoremap <leader>c :let @/ = ""<CR>

set term=screen-256color
set background=dark
colorscheme neodark

set laststatus=2

" no timeout for escape
set timeoutlen=1000 ttimeoutlen=0

set statusline=\             "initial spacing
set statusline+=%{&ff}       "file format
set statusline+=%y           "file type
set statusline+=\ %{&enc}    "encoding
set statusline+=\ %<%F       "full path
set statusline+=\ %#error#   "switch to error-colors
set statusline+=%m           "modified flag
set statusline+=%*           "switch back to normal colors
set statusline+=%=           "right align stuff after this
set statusline+=%c           "cursor column
set statusline+=\ %l/%L      "cursor line/total lines
set statusline+=\            "final spacing

map <leader>r :call RunCode()<CR>
func! RunCode()
	exec "w"
	if &filetype == 'java'
		echo "Compiling..."
		let debug = system('javac '.expand('%'))
		let error = match(debug, ": error:")
		if error > 0
			let errorline = eval(debug[match(debug, ":")+1:error-1])
			call cursor(errorline, 0)
			echo debug
		else
			echo "Running..."
			echo system('java '.expand('%:t:r'))
		endif
	elseif &filetype == 'python'
		echo "Running..."
		echo system('python '.expand('%'))
	endif
endfunc

au BufNewFile,BufRead *.repl set filetype=java
