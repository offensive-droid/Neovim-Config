" Plugins
call plug#begin()
    " Appearance
    Plug 'vim-airline/vim-airline'
    Plug 'ryanoasis/vim-devicons'
    Plug 'rafi/awesome-vim-colorschemes'
    Plug 'daltonmenezes/aura-theme', { 'rtp': 'packages/neovim' }
    Plug 'lambdalisue/nerdfont.vim'


    " Utilities
    Plug 'sheerun/vim-polyglot'
    Plug 'jiangmiao/auto-pairs'
    Plug 'ap/vim-css-color'
    Plug 'preservim/nerdtree'

    " Completion / linters / formatters
    Plug 'plasticboy/vim-markdown'
    " Git
    Plug 'airblade/vim-gitgutter'

    " Code completion
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'github/copilot.vim'
    

call plug#end()


" Encoding
set encoding=UTF-8


" Nerd Font
set guifont=DroidSansMono\ Code\ Nerd\ Font:h12



" Colorscheme
colorscheme default

" Airline settings
let g:airline_theme = 'murphy'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" File browser
let NERDTreeShowHidden = 1

" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree

" Options
set background=dark
set clipboard=unnamedplus
set completeopt=noinsert,menuone,noselect
set cursorline
set hidden
set inccommand=split
set mouse=a
set number
" set relativenumber
set splitbelow
set splitright
set title
set ttimeoutlen=0
set wildmenu

" Tabs size
set expandtab
set shiftwidth=2
set tabstop=2

filetype plugin indent on
syntax enable
set t_Co=256

" True color if available
if has("termguicolors")
    set termguicolors
endif

" Italics (if supported by your terminal)
if has('nvim')
    let &t_ZH = "\e[3m"
    let &t_ZR = "\e[23m"
endif

" Coc settings
let g:deoplete#enable_at_startup = 1

augroup my_auto_commands
    autocmd!
    autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
augroup END

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

" Ultisnips settings
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<c-b>"
let g:UltiSnipsJumpBackwardTrigger = "<c-z>"
let g:UltiSnipsEditSplit = "vertical"

" Coc-snippets settings
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction
