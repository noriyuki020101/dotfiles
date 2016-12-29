if !&compatible
  set nocompatible
endif

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END 

" dein settings {{{ 
" dein自体の自動インストール
" let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/dotfiles/.vim') : $XDG_CACHE_HOME
let s:cache_home = expand('~/dotfiles/.vim')
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' .
  shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath
"let &runtimepath = s:dein_dir .",". &runtimepath
" プラグイン読み込み＆キャッシュ作成
let s:toml_file = s:dein_dir . '/toml/plugin.toml'
let s:toml_lazy_file = s:dein_dir . '/toml/plugin_lazy.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir , [$MYVIMRC, s:toml_file])
  call dein#load_toml(s:toml_file, {'lazy': 0}) 
  call dein#load_toml(s:toml_lazy_file, {'lazy': 1}) 
  call dein#end()
  call dein#save_state()
endif
" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
  call dein#install()
endif
" }}} 

" 引数なしでvimを開くとNERDTreeを起動
let file_name = expand('%')
if has('vim_starting') &&  file_name == ''
  autocmd VimEnter * NERDTree ./
endif

"End dein Scripts-------------------------
