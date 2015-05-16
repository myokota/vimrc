
set guifont=VLGothic\ 10
set backupdir=$HOME/.vim_backup
set number
set hlsearch
set incsearch
set tabstop=8
set shiftwidth=8
set backspace=2
set title
set noexpandtab
set cindent
set autoindent
set ignorecase
set smartcase
set foldlevel=100

colorscheme DarkDefault
colorscheme pyte
colorscheme peaksea
colorscheme DarkDefault

highlight Pmenu ctermbg=4
highlight PmenuSel ctermbg=5
highlight PmenuSbar ctermbg=4

"" autocmd FileType python set omnifunc=pythoncomplete#Complete
"" autocmd FileType c set omnifunc=ccomplete#Complete
"" autocmd FileType conf set expandtab! tabstop=4 shiftwidth=4
"" autocmd FileType sh set expandtab! tabstop=4 shiftwidth=4
"" autocmd BufNewFile,BufRead *.py set expandtab tabstop=4 shiftwidth=4

autocmd BufNewFile,BufRead *.sh set filetype=sh
autocmd BufNewFile,BufRead *.py set filetype=python
autocmd BufNewFile,BufRead *.c set filetype=c
autocmd BufNewFile,BufRead *.cpp set filetype=c
autocmd BufNewFile,BufRead *.js set filetype=javascript
autocmd BufNewFile,BufRead *.json set filetype=javascript

autocmd FileType python set expandtab tabstop=4 shiftwidth=4 omnifunc=pythoncomplete#Complete
autocmd FileType c set expandtab! tabstop=8 shiftwidth=8 omnifunc=ccomplete#Complete
autocmd FileType sh set expandtab! tabstop=4 shiftwidth=4
autocmd FileType javascript set expandtab tabstop=2 shiftwidth=2 smartindent noautoindent foldlevel=100 omnifunc=javascriptcomplete#Complete

let g:changelog_timeformat = "%Y-%m-%d"
let g:changelog_username = "Masashi YOKOTA "

"" NeoBundle
set nocompatible
filetype plugin off
if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
call neobundle#end()
filetype plugin on
NeoBundleCheck

"" neocomplcache
NeoBundle 'Shougo/neocomplcache.vim'
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()


""" vimfilter
NeoBundle 'Shougo/vimfiler.vim'
nnoremap <leader>e :VimFilerExplore -split -winwidth=30 -find -no-quit<Cr>


NeoBundle 'Shougo/neosnippet-snippet'
NeoBundle 'Shutnik/jshint2.vim'

