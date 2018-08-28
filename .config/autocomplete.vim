let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsListSnippets="<c-l>"
"
let g:jedi#popup_select_first=0

" C++: Completor
inoremap <expr> <c-k> pumvisible() ? "\<C-p>" : "\<Tab>"
inoremap <expr> <c-j> pumvisible() ? "\<C-n>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"

let g:UltiSnipsSnippetDirectories = [$HOME.'/.vim/UltiSnips']
