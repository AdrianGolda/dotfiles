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
" Indent
"nnoremap <S-Tab> <<
inoremap <S-Tab> <C-d>
" Autocomplete
Bundle 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'
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
" Nerd tree
Plugin 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
Plugin 'Xuyuanp/nerdtree-git-plugin'


call vundle#end()            " required
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
map <ALT+Enter> :YcmCompleter FixIt<CR>

" Otherwise ClangFormat looks bad
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
" folding
set foldmethod=indent
set foldlevel=1
set foldclose=all

" For local replace
nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>
" For global replace
nnoremap gR gD:%s/<C-R>///gc<left><left><left>

highlight YcmWarningLine guibg=#ffffcc
highlight YcmWarningSign guibg=#ffffcc
highlight YcmWarningSection guibg=#ffffcc
