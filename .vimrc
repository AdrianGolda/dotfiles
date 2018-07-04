"set nocompatible              " be iMproved, required
"filetype off                  " required

" set the runtime path to include Vundle and initialize
call plug#begin()
Plug 'VundleVim/Vundle.vim'

" Autoformat
    "Plug 'Chiel92/vim-autoformat'
    Plug 'rhysd/vim-clang-format'
        noremap <F3> :ClangFormat<CR>
        noremap <c-k><c-d> :ClangFormat<CR>
        if !executable('clang-format') && executable('clang-format-6.0')
          let g:clang_format#command = 'clang-format-6.0'
        endif
    Plug 'tell-k/vim-autopep8'
        autocmd FileType python nnoremap <c-k><c-d> :Autopep8<CR>
        let g:autopep8_disable_show_diff=1
" Indent
    "nnoremap <S-Tab> <<
    inoremap <S-Tab> <C-d>
" Autocomplete
    Plug 'ervandew/supertab'
    Plug 'Valloric/YouCompleteMe'
    let g:ycm_always_populate_location_list = 1
" Snippets
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    " Autocomplete and snippets
    " YouCompleteMe and UltiSnips compatibility, with the helper of supertab
    " (via http://stackoverflow.com/a/22253548/1626737)
    let g:SuperTabDefaultCompletionType    = '<C-n>'
    let g:SuperTabCrMapping                = 0
    let g:UltiSnipsExpandTrigger           = '<tab>'
    let g:UltiSnipsJumpForwardTrigger      = '<tab>'
    let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
    let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
    let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']
    inoremap <c-l> <tab>
" Surround
    Plug 'tpope/vim-surround'
" Pair brackets
    Plug 'jiangmiao/auto-pairs'
" Comments
    Plug 'scrooloose/nerdcommenter'
" show css colours
    Plug 'shmargum/vim-sass-colors'
" colour schemes
    Plug 'tomasiser/vim-code-dark'
    Plug 'xolox/vim-misc'
    Plug 'xolox/vim-colorscheme-switcher'
    Plug 'w0ng/vim-hybrid'
    Plug 'termNinja/vim-vstudio-theme'

    Plug 'junegunn/seoul256.vim'
    Plug 'ChrisKempson/Tomorrow-Theme'
    Plug 'nanotech/jellybeans.vim'
    Plug 'morhetz/gruvbox'
    Plug 'romainl/Apprentice'

" Status
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
" c++ enhanced highlighting
    Plug 'octol/vim-cpp-enhanced-highlight'
" Clang rename
    Plug 'uplus/vim-clang-rename'
" GDB
    Plug 'vim-scripts/Conque-GDB'
" ctags
    Plug 'craigemery/vim-autotag'
" minimap
    Plug 'severin-lemaignan/vim-minimap'
" html
    "Plug 'othree/html5.vim'
" Subvert
    Plug 'tpope/vim-abolish'


call plug#end()            " required

let g:ConqueTerm_Color = 2         " 1: strip color after 200 lines, 2: always with color
let g:ConqueTerm_CloseOnEnd = 1    " close conque when program ends running
let g:ConqueTerm_StartMessages = 0 " display warning messages if conqueTerm is configured incorrectly
filetype plugin indent on    " required

" Other
set number
set relativenumber
set incsearch
set hlsearch

set autoindent
set noexpandtab


let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
imap <C-q> <Esc>
" Apply YCM FixIt
map <a-cr> :YcmCompleter FixIt<CR>
map <F9> :YcmCompleter FixIt<CR>
map <C-r><C-r> :ClangRenameCurrent<CR>


" Default: c++
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
autocmd FileType python :setlocal sw=4 ts=4 sts=4 " Two spaces for HTML files "

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

try
    source '.clang-format.vim'
catch
    " Couldn't open file
endtry

let g:ycm_enable_diagnostic_signs=1
let g:ycm_enable_diagnostic_highlighting=1
highlight YcmWarningLine guibg=#fff000
highlight YcmWarningSign guibg=#fff000
highlight YcmWarningSection guibg=#fff000

nmap <c-k><c-c> <Plug>NERDCommenterComment
nmap <c-k><c-u> <Plug>NERDCommenterUncomment

nnoremap <silent><A-j> :m .+1<CR>==
nnoremap <silent><A-k> :m .-2<CR>==
inoremap <silent><A-j> <Esc>:m .+1<CR>==gi
inoremap <silent><A-k> <Esc>:m .-2<CR>==gi
vnoremap <silent><A-j> :m '>+1<CR>gv=gv
vnoremap <silent><A-k> :m '<-2<CR>gv=gv

let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

set timeout ttimeoutlen=50
