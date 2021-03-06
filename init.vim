" =======================
" PLUGINS
" =======================
call plug#begin('~/.config/nvim/plugged')
" IDE-Features
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
Plug 'andymass/vim-matchup'
Plug 'godlygeek/tabular'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'airblade/vim-gitgutter'
" Languages
Plug 'sheerun/vim-polyglot'
" Aesthetic/Appearance
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
Plug 'gruvbox-community/gruvbox'
call plug#end()

" =======================
" APPEARANCE
" =======================
"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" Syntax highlighting
syntax on
set t_Co=256
set t_ut=
colorscheme gruvbox 
set cc=100

" Lightline
let g:lightline = {
  \ 'colorscheme': 'gruvbox',
  \ }


" Go stuff
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_doc_popup_window=1

" =======================
" EDITOR SETTINGS
" =======================
" Editor Settings
set relativenumber
set number
set wildmenu
set wildmode=list:longest,full
set mouse=a
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab

" =======================
" BINDINGS
" =======================
" The prefix to use for leader commands
let g:mapleader=" "

" Use jj as ESC
imap jj <Esc>

" Toggle TagBar
nnoremap <silent> <leader>tb :TagbarToggle<CR>

" Toggle NERDTree
nnoremap <silent> <leader>nt :NERDTreeToggle<CR>

" Remap keys for gotos
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gt <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction
