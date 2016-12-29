au BufNewFile,BufRead * call s:structured_text()
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.rb set filetype=ruby
au BufNewFile,BufRead *.toml set filetype=toml
"au BufNewFile,BufRead *.php\|*.ctp\|*.tpl\|*.ihtml :set dictionary=~/.vim/dein/dictionary/php.dict filetype=php

function! s:structured_text()
  let line1 = getline(1)
  execute 'setfiletype'
    \ line1 =~ 'sh' ? 'sh' : 'text'
endfunction

if expand ("%:t") =~ ".*\.rb"
  filetype plugin indent on
endif
