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
"
" ESLint for Vim requires some config, look here:
" https://github.com/facebookincubator/create-react-app/blob/master/packages/react-scripts/template/README.md#displaying-lint-output-in-the-editor
" TSLint and Typescript are also required to be installed globally for
" automatic linting purposes

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
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" Lightline
Plugin 'itchyny/lightline.vim'
" TmuxLine
Plugin 'edkolev/tmuxline.vim'
" SCSS
Plugin 'cakebaker/scss-syntax.vim'
" Vim CSS color (also recommended for scss plugin)
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
" ES7 syntax
Plugin 'othree/yajs.vim'
" Coffeescript
Plugin 'kchmck/vim-coffee-script'
" Typescript
Plugin 'leafgarland/typescript-vim'
Plugin 'ianks/vim-tsx'
" EditorConfig
Plugin 'editorconfig/editorconfig-vim'
" Quick scope
Plugin 'unblevable/quick-scope'
" Rails.vim
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
" Syntastic for linting
Plugin 'vim-syntastic/syntastic'
" CtrlP
Plugin 'ctrlpvim/ctrlp.vim'
" Terraform plugin
Plugin 'hashivim/vim-terraform'
" Terraform HCL format
Plugin 'fatih/vim-hclfmt'
" Rust support
Plugin 'rust-lang/rust.vim'
" Prettier plugin
Plugin 'prettier/vim-prettier'
" Remember last position in file
Plugin 'farmergreg/vim-lastplace'

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

" Make Vundle work with fish shell by forcing it use bash
set shell=bash

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
set cindent
set expandtab
set shiftwidth=2
set softtabstop=2

" Search selected text with //
vnoremap // y/\V<C-r>=escape(@",'/\')<CR><CR>

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

" Go coloring
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1

" Detect .gohtml as a Go HTML template
au BufRead,BufNewFile *.gohtml set filetype=gohtmltmpl

" Disable search highlight
set nohlsearch

" Quick scope configs
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Save policy to get Webpack Dev Server recognize file changes
"set backupcopy=yes

" Syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_typescript_checkers = ['tslint']
let g:syntastic_python_checkers = ['flake8']

let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

" CtrlP config
let g:ctrlp_max_files = 0

" Terraform config
let g:terraform_align=1
let g:terraform_commentstring='//%s'

" Rust config
let g:rustfmt_autosave = 1

" Prettier config
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
