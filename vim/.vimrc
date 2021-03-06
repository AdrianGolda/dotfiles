"set nocompatible              " be iMproved, required
"filetype off                  " required

" set the runtime path to include Vundle and initialize
call plug#begin()
" Generic
    Plug 'sirver/UltiSnips'
    Plug 'honza/vim-snippets'
    Plug 'scrooloose/nerdcommenter'
    Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'airblade/vim-gitgutter'

    Plug 'severin-lemaignan/vim-minimap'
    Plug 'terryma/vim-expand-region'
    Plug 'tpope/vim-abolish'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-obsession'

    Plug 'machakann/vim-swap'
    Plug 'tpope/vim-surround'
    Plug 'jiangmiao/auto-pairs'

" Completor
    Plug 'maralla/completor.vim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
    Plug 'davidhalter/jedi-vim'


" Search
    Plug 'kien/ctrlp.vim'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'

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
    Plug 'chrisbra/Colorizer'
    Plug 'gregsexton/MatchTag'
    Plug 'alvan/vim-closetag'

" JS
    Plug 'pangloss/vim-javascript'
    Plug 'maxmellon/vim-jsx-pretty'
    Plug 'ternjs/tern_for_vim'
    Plug 'vim-scripts/matchit.zip'

" Django
    Plug 'tweekmonster/django-plus.vim'

" Misc
    Plug 'vim-airline/vim-airline'
    Plug 'morhetz/gruvbox'
    Plug 'Yggdroot/indentLine'
    Plug 'yegappan/mru'
    Plug 'nelstrom/vim-visual-star-search'

call plug#end()            " required

filetype plugin indent on    " required

" Other
set number
set relativenumber
set incsearch
set hlsearch

hi CursorLine cterm=underline

""""""""""""""" Uncategorized
if &filetype==""
    setfiletype conf
endif
au BufNewFile,BufRead *.html set filetype=htmldjango
map <s-k> <Plug>(expand_region_expand)
map <s-j> <Plug>(expand_region_shrink)

set list
set cursorline
set mouse=a

match ErrorMsg '\%>120v.\+'
match ErrorMsg '\s\+$'

"set path+=**
set wildmenu
command! MakeTags !ctags -R --exclude=node_modules --exclude=tags .

let g:indentLine_char='|'

imap <C-q> <Esc>

"theme source
colorscheme gruvbox
set background=dark

for f in split(glob('~/.vim/.config/*.vim'), '\n')
    exe 'source' f
endfor

function! RemoveTrailingWhitespaces()
    :%s/\s\+$//e
endfunction

command! RemoveTrailing :call RemoveTrailingWhitespaces()

fu! MyTabLabel(n)
let buflist = tabpagebuflist(a:n)
let winnr = tabpagewinnr(a:n)
let string = fnamemodify(bufname(buflist[winnr - 1]), ':t')
return empty(string) ? '[unnamed]' : string
endfu

fu! MyTabLine()
let s = ''
for i in range(tabpagenr('$'))
" select the highlighting
    if i + 1 == tabpagenr()
    let s .= '%#TabLineSel#'
    else
    let s .= '%#TabLine#'
    endif

    " set the tab page number (for mouse clicks)
    "let s .= '%' . (i + 1) . 'T'
    " display tabnumber (for use with <count>gt, etc)
    let s .= ' '. (i+1) . ' '

    " the label is made by MyTabLabel()
    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '

    if i+1 < tabpagenr('$')
        let s .= ' |'
    endif
endfor
return s
endfu
set tabline=%!MyTabLine()

let g:ctrlp_custom_ignore = 'node_modules$\|DS_Store$\|\.git$'

set completeopt=menuone
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
set smartcase
set ignorecase
set shell=/bin/bash
