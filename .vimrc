" ~/.vimrc

"
" Global Settings
"

" Map the <Leader> to <space>
let mapleader="\<space>"

" Use semicolon for commands instead
nnoremap ; :
nnoremap : ;

" Map <F1> key to <Esc>
map <F1> <Esc>
imap <F1> <Esc>

" Right handed splitting
set splitright
set splitbelow

" Map 0 to HOME-like behavior
map 0 ^

" Easier window navigation
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Paste Settings
set pastetoggle=<F2>





"
" Vundle
"

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/html5.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'flazz/vim-colorschemes'
Plugin 'bling/vim-airline'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-endwise'
Plugin 'justincampbell/vim-eighties'
Plugin 'mxw/vim-jsx'
Plugin 'gabrielelana/vim-markdown'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
filetype plugin on           " required





"
" Plugin Settings
"

" Theme
set background=dark
colorscheme solarized

" Vim Ruby
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection

" Ctrl P Settings
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_user_command = 'ag %s -l -i --nocolor -g ""'
let g:ctrlp_match_window = 'results:20'

" Airline Settings
set laststatus=2
let g:airline#extensions#branch#enabled = 1
let g:airline_powerline_fonts = 1

" Indent Guides Settings
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=DarkGray
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=Black
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" Nerd Commenter Settings
let NERDSpaceDelims=1

" Nerd Tree Settings
noremap <C-n> :NERDTreeToggle<CR>

"
" EasyMotion Settings
"
" Set default search as EasyMotion Search
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
" Set quicker EasyMotion bi-directional motion
map <Leader>f <Plug>(easymotion-s)
" Set quicker EasyMotion motion
map <Leader>w <Plug>(easymotion-w)
map <Leader>b <Plug>(easymotion-b)

" Ack Settings
let g:ackprg = 'ag --vimgrep'

" Eighties Settings
let g:eighties_enabled = 1





"
" Misc Settings
"

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50	" keep 50 lines of command line history
set ruler		    " show the cursor position all the time
set scrolloff=5
set showcmd		  " display incomplete commands
set incsearch		" do incremental searching
set ignorecase  " case insensitive searching
set smartcase   " smarter case searching
set number      " line numbers
set cc=80       " Character length indicator
set nowrap      " Don't wrap files
set cul         " Highlight current line

" Proper tabbing (\t)
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Don't create swap files
set noswapfile

" Make buffers hidden
set hidden

" Turn of annoying bell
set noerrorbells
set visualbell
set t_vb=

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Remap jj/jk to escape in insert mode!
inoremap jj <Esc>
inoremap jk <Esc>

" Unmap K (used for instantly "man"-ing commands)
map K <Nop>





"
" Leader Commands
"
" Currently used letters:
"   EasyMotion: j,k,f
"

" Resize(+) split
nnoremap <silent> <Leader>= :vertical resize +5<CR>

" Resize(-) split
nnoremap <silent> <Leader>- :vertical resize -5<CR>

" Toggle indent guides with <Leader>ig
nnoremap <silent> <Leader>ig :IndentGuidesToggle<CR>

" Quickly edit vimrc with <Leader>rc
nnoremap <silent> <Leader>rc :tabnew<CR>:e ~/.vimrc<CR>





" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

  " Remove auto comment insertion
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

endif " has("autocmd")





"
" Auxilliary Functions
"

if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
    \ | wincmd p | diffthis
endif

" Todo List Function
function! TodoList()
  tabnew ~/.todo.otl
endfunction

nnoremap <silent> <Leader>todo :execute TodoList()<CR>
