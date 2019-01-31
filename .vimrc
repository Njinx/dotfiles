" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'git://github.com/vim-airline/vim-airline.git'
Plugin 'git://github.com/Valloric/YouCompleteMe.git'
Plugin 'git://github.com/scrooloose/nerdtree.git'
Plugin 'git://github.com/junegunn/fzf.vim.git'
Plugin 'git://github.com/tpope/vim-ragtag.git'
Plugin 'git://github.com/joshhartigan/vim-reddit.git'
" All of your Plugins must be added before the following line

call vundle#end()            " required
filetype plugin indent on    " required
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Display Settings
set encoding=utf-8
set ruler
set showmatch
set showmode
set number
set lazyredraw
set cursorline
set foldenable
set foldlevelstart=10 " Only nested code blocks are folded
nnoremap <space> za " Sets space to toggle folds

" Write Settings
set fileencoding=utf-8
set confirm
set nobackup
command W w "!sudo tee %" " Maps :W to sudo save

" Edit Settings
set shiftwidth=4
set tabstop=4
nnoremap B ^ " Binds be to jump to beginning of line
nnoremap E $ " Binds E to jump to end of line
nnoremap $ <nop> " Nullifies $
nnoremap ^ <nop> " Nullifies ^
nnoremap gV `[v`] " Highlights last inserted text
nnoremap <leader>ev :vsplit ~/.vimrc<cr>
nnoremap <leader>as :set ft=nasm<cr>

" Search Settings
set hlsearch
set ignorecase
set incsearch
set smartcase
set magic " Regex
map q :NERDTreeToggle<CR>
map ; :Files<CR>

" File Type Settings
filetype off
" filetype plugin on
" filetype indent on

" Syntax Highlighting
colo default
syntax on

" Keymapping Settings
noremap n nzz
noremap N Nzz
set notimeout ttimeout ttimeoutlen=200 " Set keycode timeout
nnoremap <leader><space> :nohlsearch<CR> " Turn off search highlighting after complete

" Command Line Settings
set wildmenu
set showcmd
map ss :shell<CR>

" Misc Settings
set listchars=eol:$,tab:>-,trail:.,nbsp:_,extends:+,precedes:+ " Disables printing of non-printable characters
set visualbell " Shows bell instead of beeping
set t_vb= " Required for visual bell
set nocompatible " Use Vim instead of Vi
nnoremap j gj " Tells Vim to move by vertical lines and not skip over wrapped lines
nnoremap k gk " Same as above
set directory=/tmp
