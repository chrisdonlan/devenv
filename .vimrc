" Tlist
let $Tlist_Ctags_Cmd='ctags'
map t :TaskList<CR>
map T :TlistToggle<CR>

autocmd FileType python set omnifunc=pythoncomplete#Complete

" Put your non-Plugin stuff after this line
syntax on
set foldmethod=indent

set noexpandtab
set textwidth=120
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
