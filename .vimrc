set number
set title
set tabstop=2
set expandtab
set shiftwidth=2
set smartindent
"set list
"set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set virtualedit=block
set history=50
set hidden
set whichwrap=b,s,[,],<,>
set backspace=indent,eol,start
set wildmenu


let php_foldind=0
let php_sql_query=1
let php_htmlInStrings=1
let php_parent_error_clone=1
let php_parent_error_open=1

syntax on 


set nocompatible
filetype off
if has('vim_starting')
  set runtimepath+=$HOME/.vim/bundle/neobundle.vim/
  call neobundle#begin(expand('~/.vim/bundle'))
  NeoBundleFetch 'Shougo/neobundle.vim'
  call neobundle#end()
endif

NeoBundle 'Shougo/neobunlde.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/noecomplcache-snippets-complete'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'szw/vim-tags'
NeoBundle 'scrooloose/nerdtree'

filetype plugin on 
filetype indent on 

" neocomplcache-
autocmd BufRead *.php\|*.ctp\|*.tpl :set dictionary=~/.vim/dictionary/php.dict filetype=php
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_manual_completion_start_length = 0
let g:neocomplcache_caching_percent_in_statusline = 1
let g:neocomplcache_enable_skip_completion = 1
let g:neocomplcache_skip_input_time = '0.5'
let g:neocomplcache_snippets_dir='~/.vim/snippets'


set tags=tags
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_Show_One_File = 1
let Tlist_Use_Right_Window = 1
let Tlist_Exit_OnlyWindow = 1
map <silent><leader>l :TlistToggle <CR>
" let tlist_php_settings='php;f:function'

nnoremap <silent><C-e> :NERDTreeToggle<CR>
