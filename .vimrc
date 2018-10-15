"set nocompatible              " be iMproved, required
"filetype off                  " required

" set the runtime path to include Vundle and initialize
call plug#begin()
" Generic
    Plug 'sirver/UltiSnips'
    Plug 'honza/vim-snippets'
    Plug 'vim-syntastic/syntastic'
    Plug 'scrooloose/nerdcommenter'
    Plug 'craigemery/vim-autotag'
    Plug 'severin-lemaignan/vim-minimap'
    Plug 'tpope/vim-abolish'
    Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-surround'
    Plug 'terryma/vim-expand-region'
    Plug 'jiangmiao/auto-pairs'
    Plug 'maralla/completor.vim'
    Plug 'Raimondi/delimitMate'
    "Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
    Plug 'ervandew/supertab'

" Python
    Plug 'tell-k/vim-autopep8'
    Plug 'Vimjas/vim-python-pep8-indent'
    Plug 'vim-scripts/django.vim'
    Plug 'python-rope/ropevim'

" C/C++
    Plug 'rhysd/vim-clang-format', {'for': ['cpp'] }
    Plug 'uplus/vim-clang-rename', {'for': ['cpp'] }
    Plug 'vim-scripts/Conque-GDB', {'for': ['cpp'] }

" HTML
    Plug 'ap/vim-css-color'
    Plug 'gregsexton/MatchTag'

" Django
    Plug 'tweekmonster/django-plus.vim'

" Misc
    Plug 'vim-airline/vim-airline'
    Plug 'morhetz/gruvbox'
    Plug 'Yggdroot/indentLine'

call plug#end()            " required

filetype plugin indent on    " required

" Other
set number
set relativenumber
set incsearch
set hlsearch

set autoindent
set noexpandtab
set sw=4

hi CursorLine cterm=underline

" Uncategorized
au BufNewFile,BufRead *.html set filetype=htmldjango
map <s-k> <Plug>(expand_region_expand)
map <s-j> <Plug>(expand_region_shrink)

set list
set cursorline

match ErrorMsg '\%>120v.\+'
match ErrorMsg '\s\+$'

set path+=**
set wildmenu
command! MakeTags !ctags -R .
let g:deoplete#enable_at_startup = 1

let g:indentLine_char='|'

imap <C-q> <Esc>

" For local replace
nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>
" For global replace
nnoremap gR gD:%s/<C-R>///gc<left><left><left>

" switch between .cpp and .h
nnoremap <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

"theme source
colorscheme gruvbox
set background=dark
set completeopt-=preview

source ~/.vim/.config/autocomplete.vim
source ~/.vim/.config/autopep.vim
source ~/.vim/.config/clang.vim
source ~/.vim/.config/conquegdb.vim
source ~/.vim/.config/indent.vim
source ~/.vim/.config/nerdcommenter.vim
source ~/.vim/.config/nerdtree.vim
source ~/.vim/.config/remappings.vim
source ~/.vim/.config/hexmode.vim
source ~/.vim/.config/folds.vim
source ~/.vim/.config/delimitmate.vim
source ~/.vim/.config/minimap.vim

let g:UltiSnipsSnippetDirectories=["~/.vim/plugins/vim-snippets/snippets","~/.vim/plugins/vim-snippets/UltiSnips"]
