if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

let g:rsenseHome = expand("/home/vagrant/.vim/dein/repos/github.com/marcus/rsense")
let g:rsenseUseOmniFunc = 1 
