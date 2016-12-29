if &compatible
  set nocompatible
endif

let s:dein_dir = expand('~/.cache/dein')

let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let g:rc_dir = expand('~/.vim/rc')
  let s:toml = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install(['vimproc'])
  call dein#install(['vimproc'])
endif

if dein#check_install()
  call dein#install()
endif


let g:molokai_original = 1

filetype plugin indent on

let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/snippets/'
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)


" unite.vim
" 入力モードで開始する
let g:unite_enable_start_insert=1
noremap <C-P> :Unite buffer<CR>
noremap <C-N> :Unite -buffer-name=file file<CR>
noremap <C-Z> :Unite file_mru<CR>


" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>


" 全角スペースの表示
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme * call ZenkakuSpace()
    autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
  augroup END
  call ZenkakuSpace()
endif

" 自動的にvim-indent-guidesをオンに
"let g:indent_guides_enable_on_vim_startup = 1

set tag=./tags
nnoremap <F3> :<C-u>tab stj <C-R>=expand('<cword>')<CR><CR>
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_Show_One_File = 1
let Tlist_Use_Right_Window = 1
let Tlist_Exit_OnlyWindow = 1

set mouse=n
set ttymouse=xterm2

set ruler
set cmdheight=2
set laststatus=2
set statusline=%<%f\%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set title
set wildmenu
set showcmd
set browsedir=buffer
set smartcase
set background=dark
set expandtab

" dbext
let dbext_default_dbname="master"
let dbext_default_profile=""
let dbext_default_type="PGSQL"
let dbext_default_user="postgres"
let dbext_default_passwd=""

let mapleader = "\<Space>"

" VimFiler
"nnoremap <F2> :VimFiler -buffer-name-explore -split -winwitdh=45 -toggle -no-quit<Cr>
"autocmd! FileType vimfiler call g:my_vimfiler_settings()
"function! g:my_vimfiler_settings()
"  nmap  <buffer><expr><Cr>      vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
"  nnoremap <buffer>s    :call vimfiler#mappings#do_action('my_split)<Cr>
"  nnoremap <buffer>v    :call vimfiler#mappings#do_action('my_vsplit')<Cr>
"endfunction

"let s:my_action = { 'is_selectable' : 1 }
"function! s:my_action.func(candidates)
"  sincmd p
"  exec 'split ' . a:candidates[0].action__path
"endfunction
"call unite#custom_action('file', 'my_split', s:my_action)

"let s:my_action = { 'is_selectable' : 1 }
"function! s:my_action.func(candidates)
"  wincmd p
"  exec 'vsplit ' . a:candidates[0].action__path
"endfunction
"call unite#custom_action('file', 'my_svplit', s:my_action)
