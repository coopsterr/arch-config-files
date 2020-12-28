call plug#begin("~/.vim/plugged")
  " Plugin Section
  Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'zchee/deoplete-jedi'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'jiangmiao/auto-pairs'
  Plug 'sbdchd/neoformat'
  Plug 'davidhalter/jedi-vim'
  Plug 'scrooloose/nerdtree'
  Plug 'machakann/vim-highlightedyank'
  Plug 'tmhedberg/SimpylFold'
  Plug 'morhetz/gruvbox'
  Plug 'dylanaraps/wal.vim'
call plug#end()

" Config Section
let g:airline_theme='wal'
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Make semshi have less colour
let g:semshi#simplify_markup = 'v:false'

" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to space conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

hi HighlightedyankRegion cterm=reverse gui=reverse
" set highlight duration time to 1000 ms, i.e., 1 second
let g:highlightedyank_highlight_duration = 1000

colorscheme wal

function MyCustomHighlights()
    hi semshiUnresolved      ctermfg=253 guifg=#eeeeee cterm=underline gui=underline
    hi semshiAttribute       ctermfg=248  guifg=#a8a8a8
    hi semshiBuiltin         ctermfg=240 guifg=#585858
    hi semshiFree            ctermfg=244 guifg=#808080
    hi semshiParameterUnused ctermfg=250 guifg=#bcbcbc cterm=underline gui=underline
    hi semshiParameter       ctermfg=250  guifg=#bcbcbc
    hi semshiImported        ctermfg=242 guifg=#6c6c6c cterm=bold gui=bold
    hi semshiGlobal          ctermfg=242 guifg=#6c6c6c
    hi semshiLocal           ctermfg=246 guifg=#949494
endfunction
autocmd FileType python call MyCustomHighlights()
