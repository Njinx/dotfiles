" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'git://github.com/junegunn/limelight.vim.git'
Plugin 'git://github.com/vim-pandoc/vim-pandoc.git'
Plugin 'git://github.com/vim-airline/vim-airline-themes.git'
Plugin 'git://github.com/vim-pandoc/vim-pandoc-syntax.git'
Plugin 'git://github.com/tpope/vim-eunuch.git'
Plugin 'git://github.com/junegunn/seoul256.vim.git'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'git://github.com/junegunn/goyo.vim.git'
Plugin 'git://github.com/vim-airline/vim-airline.git'
Plugin 'git://github.com/scrooloose/nerdtree.git'
Plugin 'git://github.com/junegunn/fzf.vim.git'
Plugin 'git://github.com/tpope/vim-ragtag.git'
Plugin 'git://github.com/dense-analysis/ale.git'
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
" set foldenable
" set foldlevelstart=10 " Only nested code blocks are folded
" nnoremap <space> za " Sets space to toggle folds

" View Settings
autocmd! User GoyoEnter Limelight " Toggle Limelight when in Goyo mode
autocmd! User GoyoLeave Limelight!
map <leader>l :Limelight!!0.3<CR> " Toggles Limelight plugin
colo seoul256
let g:seoul256_background = 235 " Set background to dark
let g:airline_theme = 'bubblegum'
map <leader>e :ALEDetail<CR>

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
nnoremap gV `[v`] " Highlights last inserted text
nnoremap <leader>ev :vsplit ~/.vimrc<cr>
nnoremap <leader>as :set ft=nasm<cr>

" Search Settings
set hlsearch
set ignorecase
set incsearch
set smartcase
set magic " Regex
map q :NERDTreeToggle<CR> " Toggle directory tree
map ;; :Files<CR> " Toggles fuzzy searching
map <leader>go :Goyo 300x150<CR> " Toggles Non-distracting writing (Goyo) width: 150, height: 40

" File Type Settings
filetype on
" filetype plugin on
" filetype indent on

" Syntax Highlighting
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

" MD to PDF Settings
" map <leader>p :! clear ; pandoc % -t html5 --css=/home/ben-allen/Notes/tufte.css -o /home/ben-allen/Notes/PDF/%.pdf<CR><CR>
map <leader>pp :! clear ; pandoc % -t html5 --css=/home/ben-allen/Notes/tufte.css -o %.pdf<CR><CR>

" Misc Settings
set listchars=eol:$,tab:>-,trail:.,nbsp:_,extends:+,precedes:+ " Disables printing of non-printable characters
set visualbell " Shows bell instead of beeping
set t_vb= " Required for visual bell
set nocompatible " Use Vim instead of Vi
noremap j gj " Tells Vim to move by vertical lines and not skip over wrapped lines
noremap k gk " Same as above
noremap <Up> gk
noremap <Down> gj
set directory=/tmp
noremap <leader>di :digraphs<CR>
noremap <leader>la i<C-k>l*

" Support Unicode
if has("multi_byte")
	if &termencoding == ""
		let &termencoding = &encoding
	endif
	set encoding=utf-8
	setglobal fileencoding=utf-8
	" Uncomment to have 'bomb' on by default for new files.
	" Note, this will not apply to the first, empty buffer created at Vim startup.
	"setglobal bomb
	set fileencodings=ucs-bom,utf-8,latin1
endif
