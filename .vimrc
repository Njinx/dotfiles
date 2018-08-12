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

" File Type Settings
filetype on
filetype plugin on
filetype indent on

" Syntax Highlighting
colo slate
syntax on

" Keymapping Settings
noremap n nzz
noremap N Nzz
set notimeout ttimeout ttimeoutlen=200 " Set keycode timeout
nnoremap <leader><space> :nohlsearch<CR> " Turn off search highlighting after complete

" Command Line Settings
set wildmenu
set showcmd

" Misc Settings
set listchars=eol:$,tab:>-,trail:.,nbsp:_,extends:+,precedes:+ " Disables printing of non-printable characters
set visualbell " Shows bell instead of beeping
set t_vb= " Required for visual bell
set nocompatible " Use Vim instead of Vi
nnoremap j gj " Tells Vim to move by vertical lines and not skip over wrapped lines
nnoremap k gk " Same as above
