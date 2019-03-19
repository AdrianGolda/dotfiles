" no arrows
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
"jj to esc
inoremap jj <Esc>

" remapings
imap <C-q> <Esc>
nnoremap YY :%y+<CR>

nnoremap <space><cr> :set hlsearch! hlsearch?<cr>

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

inoremap <s-tab> <c-d>

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
vnoremap <C-a> <C-a>gv
vnoremap <C-x> <C-x>gv

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

" tab navigation
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tc  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>


inoremap <expr> <c-k> pumvisible() ? "\<C-p>" : "\<Tab>"
inoremap <expr> <c-j> pumvisible() ? "\<C-n>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"

" Jump to middle of the line
nnoremap gm :call cursor(0, len(getline('.'))/2)<cr>

