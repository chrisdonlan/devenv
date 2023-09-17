filetype plugin on
set omnifunc=syntaxcomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd BufWritePost * :!make -C $(git rev-parse --show-toplevel) tags

let git_toplevel = substitute(system('git rev-parse --show-toplevel'), '\n', '', '')
if !empty(git_toplevel)
	let tags_path = git_toplevel . '/tags'
	set tags+=tags_path
endif

set tags=~/tags
" Put your non-Plugin stuff after this line
syntax on
set foldmethod=indent

set noexpandtab
set textwidth=120
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent

colorscheme industry
