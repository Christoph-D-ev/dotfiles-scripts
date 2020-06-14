let mapleader=" "

set mouse=a

noremap <Leader>W :w ! sudo tee % > /dev/null

call plug#begin()

Plug 'junegunn/goyo.vim'

Plug 'sheerun/vim-polyglot'

Plug 'lervag/vimtex'

let g:vimtex_latexmk_continuous = 1
let g:vimtex_view_general_viewer = 'zathura'
noremap <Leader>cc :w<Enter> <bar> :VimtexCompile<Enter> <bar> :w<Enter>  

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'


Plug 'scrooloose/syntastic'

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

Plug 'vim-airline/vim-airline'

Plug 'ycm-core/YouCompleteMe'

let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

call plug#end()

set spell
set spelllang=de,en

hi clear SpellBad
hi SpellBad cterm=underline
" Set style for gVim
hi SpellBad gui=undercurl


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list =1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

set number
set relativenumber
