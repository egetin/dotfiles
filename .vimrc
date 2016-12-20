" Required:
" https://github.com/gmarik/Vundle.vim
" Also read this: https://github.com/itchyny/lightline.vim
" Get these fonts:
" https://github.com/powerline/fonts
" And Tmuxline
" https://github.com/edkolev/tmuxline.vim
" After installing powerline fonts, change terminal font to Powerline font
"
" Install goimports https://godoc.org/golang.org/x/tools/cmd/goimports

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'vim-scripts/L9'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}
" Lightline
Plugin 'itchyny/lightline.vim'
" TmuxLine
Plugin 'edkolev/tmuxline.vim'
" Vim CSS color
Plugin 'hail2u/vim-css3-syntax'
" NerdTREE
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
" Go
Plugin 'fatih/vim-go'
" Faster YAML syntax
Plugin 'stephpy/vim-yaml'
" Javascript highlighting
Plugin 'pangloss/vim-javascript'
" JSX syntax
Plugin 'mxw/vim-jsx'
" SCSS
Plugin 'cakebaker/scss-syntax.vim'
" ES7 syntax
Plugin 'othree/yajs.vim'
" EditorConfig
Plugin 'editorconfig/editorconfig-vim'
" CtrlP
Plugin 'ctrlpvim/ctrlp.vim'
" Quick scope
Plugin 'unblevable/quick-scope'
" Rails.vim
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Line numbers
set number
set relativenumber
" Syntax highlighting
syntax on
" Cursor highlighting
set cursorline
hi CursorLine ctermbg=black cterm=bold

set modeline
set background=dark

" UTF-8
set encoding=utf-8
set fileencoding=utf-8

" Automatic indent
set autoindent
set smartindent
set expandtab
set shiftwidth=2
set softtabstop=2

" Lightline config
set laststatus=2
set noshowmode
if !has('gui_running')
    set t_Co=256
endif

" Configure moving across lines
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Set mouse support
" set mouse=a

let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'component': {
    \   'readonly': '%{&readonly?"":""}',
    \ },
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '', 'right': '' }
    \ }

" Configure NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-n> :NERDTreeToggle<CR>

" Special indentation for Go
autocmd FileType go setlocal noexpandtab
autocmd FileType go setlocal shiftwidth=8
autocmd FileType go setlocal softtabstop=8

" Goimport instead of gofmt
let g:go_fmt_command = "goimports"

" Disable search highlight
set nohlsearch

" CtrlP configs
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*/tmp/*,*.so,*.swp,*.swo,*.zip     " MacOSX/Linux

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux

" Quick scope configs
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
