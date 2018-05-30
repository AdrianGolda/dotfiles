set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" Autoformat
"Plugin 'Chiel92/vim-autoformat'
Plugin 'rhysd/vim-clang-format'
noremap <F3> :ClangFormat<CR>
noremap <c-k><c-d> :ClangFormat<CR>
if !executable('clang-format') && executable('clang-format-6.0')
  let g:clang_format#command = 'clang-format-6.0'
endif
autocmd FileType python nnoremap <c-k><c-d> :Autopep8<CR>
Plugin 'tell-k/vim-autopep8'
let g:autopep8_disable_show_diff=1
" Indent
"nnoremap <S-Tab> <<
inoremap <S-Tab> <C-d>
" Autocomplete
Bundle 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'
let g:ycm_always_populate_location_list = 1
" Snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
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
" Surround
Plugin 'tpope/vim-surround'
" Pair brackets
Plugin 'jiangmiao/auto-pairs'
" Skip over parentheses
"inoremap <expr> <Tab> stridx('])}', getline('.')[col('.')-1])==-1 ? "\t" :
""\<Right>" doesn't work temporarily
" Colours
Plugin 'chriskempson/base16-vim'
set background=dark
" Comments
Plugin 'scrooloose/nerdcommenter'
" show css colours
Plugin 'shmargum/vim-sass-colors'
" VS color scheme
Plugin 'tomasiser/vim-code-dark'
" Status
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" c++ enhanced highlighting
Plugin 'octol/vim-cpp-enhanced-highlight'
" GDB
Plugin 'vim-scripts/Conque-GDB'
" ctags
Plugin 'craigemery/vim-autotag'

" minimap
Plugin 'severin-lemaignan/vim-minimap'


call vundle#end()            " required
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
set tabstop=4
set shiftwidth=4

colorscheme codedark

let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
imap <C-q> <Esc>
" Apply YCM FixIt
map <a-cr> :YcmCompleter FixIt<CR>
map <F9> :YcmCompleter FixIt<CR>


" Otherwise ClangFormat looks bad
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
" folding
"set foldmethod=indent
"set foldlevel=1
"set foldclose=all

" For local replace
nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>
" For global replace
nnoremap gR gD:%s/<C-R>///gc<left><left><left>

" ycm highlighting
highlight YcmWarningLine guibg=#ffffcc
highlight YcmWarningSign guibg=#ffffcc
highlight YcmWarningSection guibg=#ffffcc
nnoremap <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
