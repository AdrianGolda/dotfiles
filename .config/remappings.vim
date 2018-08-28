" no arrows
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
"jj to esc
inoremap jj <Esc>

set completeopt=longest,menuone

" remapings
imap <C-q> <Esc>
nnoremap YY :%y+<CR>

nnoremap <space><cr> :nohlsearch<cr>

noremap <space>y "*y
noremap <space>Y "*Y
noremap <space>p "*p
noremap <space>P "*P

noremap <leader>y "+y
noremap <leader>Y "+Y
noremap <leader>p "+p
noremap <leader>P "+P

nnoremap <c-s-tab> gT
nnoremap <c-tab> gt

nnoremap <space>a ggVG

vnoremap > >gv
vnoremap < <gv
nnoremap > >>
nnoremap < <<

command! SetCwd :cd %:p:h

nnoremap <F6> :SetCwd<CR>

map <F5> :set rnu!<CR>
map <C-F5> :source ~/.vimrc<CR>

vnoremap gO "py<Esc>:e <C-R>p<CR>
vnoremap gT "py<Esc>:tabe <C-R>p<CR>

nmap \\ :CtrlP<CR>

" swap lines with Alt+j/Alt+k
" fix to make arrows work
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw
set timeout ttimeoutlen=50
" actual mappings
nnoremap <silent><A-j> :m .+1<CR>==
nnoremap <silent><A-k> :m .-2<CR>==
inoremap <silent><A-j> <Esc>:m .+1<CR>==gi
inoremap <silent><A-k> <Esc>:m .-2<CR>==gi
vnoremap <silent><A-j> :m '>+1<CR>gv=gv
vnoremap <silent><A-k> :m '<-2<CR>gv=gv
