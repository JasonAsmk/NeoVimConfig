set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"" ***** BEGIN PLUGINS ******
Plugin 'scrooloose/nerdTree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'mhinz/vim-grepper.git'
Plugin 'mhinz/vim-signify.git'
Plugin 'neovimhaskell/haskell-vim.git'
Plugin 'parsonsmatt/intero-neovim.git'
Plugin 'neomake/neomake.git'
Plugin 'alx741/vim-hindent.git'
Plugin 'alx741/vim-stylishask.git'
Plugin 'godlygeek/tabular.git'
Plugin 'dan-t/vim-hsimport.git'
Plugin 'tpope/vim-fugitive.git'

"Plugin 'leafgarland/typescript-vim.git'
Plugin 'Shougo/vimproc.vim'
Plugin 'HerringtonDarkholme/yats.vim'
"Plugin 'Quramy/tsuquyomi.git'
Plugin 'w0rp/ale.git'
Plugin 'Shougo/deoplete.nvim'
Plugin 'mhartington/nvim-typescript'
Plugin 'janko-m/vim-test.git'
Plugin 'junegunn/fzf.vim.git'
Plugin 'vim-airline/vim-airline.git'
Plugin 'scrooloose/nerdcommenter'
"" ***** END PLUGINS *****

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"" ***** GENERAL SETTINGS *****

"" Grepper bindings
"" \ga to search the entire project
"" \gb to search the current buffer
nnoremap <leader>ga :Grepper<cr>
nnoremap <leader>gb :Grepper -buffer<cr>

"Open NERDTree when nvim starts
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"Toggle NERDTree with Ctrl-N
map <C-n> :NERDTreeToggle<CR>

"Show hidden files in NERDTree
let NERDTreeShowHidden=1

" haskell-vim options
let g:haskell_classic_highlighting = 1
let g:haskell_indent_if = 3
let g:haskell_indent_case = 2
let g:haskell_indent_let = 4
let g:haskell_indent_where = 6
let g:haskell_indent_before_where = 2
let g:haskell_indent_after_bare_where = 2
let g:haskell_indent_do = 3
let g:haskell_indent_in = 1
let g:haskell_indent_guard = 2
let g:haskell_indent_case_alternative = 1
let g:cabal_indent_section = 2
let g:intero_start_immediately = 1

" neovim intero options
" Automatically reload on save
au BufWritePost *.hs InteroReload

" Lookup the type of expression under the cursor
au FileType haskell nmap <silent> <leader>t <Plug>InteroGenericType
au FileType haskell nmap <silent> <leader>T <Plug>InteroType
" Insert type declaration
au FileType haskell nnoremap <silent> <leader>ni :InteroTypeInsert<CR>
" Show info about expression or type under the cursor
au FileType haskell nnoremap <silent> <leader>i :InteroInfo<CR>

" Open/Close the Intero terminal window
au FileType haskell nnoremap <silent> <leader>nn :InteroOpen<CR>
au FileType haskell nnoremap <silent> <leader>nh :InteroHide<CR>

" Reload the current file into REPL
au FileType haskell nnoremap <silent> <leader>nf :InteroLoadCurrentFile<CR
" Jump to the definition of an identifier
au FileType haskell nnoremap <silent> <leader>ng :InteroGoToDef<CR>
" Evaluate an expression in REPL
au FileType haskell nnoremap <silent> <leader>ne :InteroEval<CR>

" Start/Stop Intero
au FileType haskell nnoremap <silent> <leader>ns :InteroStart<CR>
au FileType haskell nnoremap <silent> <leader>nk :InteroKill<CR>

" Reboot Intero, for when dependencies are added
au FileType haskell nnoremap <silent> <leader>nr :InteroKill<CR> :InteroOpen<CR>

" Managing targets
" Prompts you to enter targets (no silent):
au FileType haskell nnoremap <leader>nt :InteroSetTargets<CR>

" check file on save and open issues automatically
call neomake#configure#automake('w')
let g:neomake_open_list = 2
" disable other checkers, only use intero
let g:neomake_haskell_enabled_makers = []

" Tabularize options
nnoremap <leader>= :Tabularize /=<CR>
nnoremap <leader>- :Tabularize /-><CR>
nnoremap <leader>, :Tabularize /,<CR>
nnoremap <leader># :Tabularize /#-}<CR>

" hsimport remaps
" get symbol only from import
au FileType haskell nnoremap <silent> <leader>ims :HsimportSymbol<CR>
" get the whole module
au FileType haskell nnoremap <silent> <leader>imm :HsimportModule<CR>

" enable deoplete for mhartington's vim ts plugin
let g:deoplete#enable_at_startup = 1

" set ALE fixers
let g:ale_fixers = {'typescript': ['tslint']}
let g:ale_linters = {'typescript': ['tslint', 'tsserver', 'typecheck']}
" show lints on quickfix window 
let g:ale_set_quickfix = 1
let g:ale_set_signs = 0

let g:gitgutter_enabled = 1

let g:tsuquyomi_single_quote_import = 1
" turn off checking typescript with neomake on save
let g:neomake_typescript_enabled_makers = []

" nvim-typescript
" print func signature on echo area while in deoplete
let g:nvim_typescript#signature_complete = 1
let g:nvim_typescript#type_info_on_hold = 1

" fzf with ctrlp like binding
nnoremap <c-p> :FZF<cr>

" attempt to fix the gutter not refreshing issue
let g:signify_realtime = 1

syntax on
filetype plugin indent on

set nocompatible
set number
set showmode
set smartcase
set smarttab
set smartindent
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2
set background=dark
set laststatus=0
set mouse=a
set nowrap

colorscheme torte

" gutter colors
hi clear SignColumn
hi SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
hi SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
hi SignifySignChange cterm=bold ctermbg=237  ctermfg=227
"hi Keyword ctermfg=darkcyan
"hi Constant ctermfg=5*
"hi Comment ctermfg=2*
"hi Normal ctermbg=none
"hi LineNr ctermfg=darkgrey
