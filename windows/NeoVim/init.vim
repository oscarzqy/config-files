:set number
:set relativenumber
filetype plugin indent on
:set tabstop=4
:set shiftwidth=4
:set expandtab
:set smarttab
:set autoindent
:set smartindent
:set mouse=a

" plugins ---------------------- {{{
call plug#begin()

" Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'vim-airline/vim-airline-themes' " Official airline theme
Plug 'morhetz/gruvbox' "Gruvbox color scheme
Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
" emmet configurations -------------------- {{{
Plug 'mattn/emmet-vim'
let g:user_emmet_leader_key='<A-z>'
let g:user_emmet_install_global = 0
augroup EmmetFileType
    autocmd!
    autocmd FileType html,css,javascriptreact,typescriptreact EmmetInstall
augroup END
" }}}
Plug 'https://github.com/neoclide/coc.nvim', {'branch': 'release'}  " Auto Completion
" COC configurations ------------------------- {{{
let g:coc_data_home = 'C:/Users/qzhang/AppData/Local/coc'
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-json',
  \ 'coc-html',
  \ 'coc-html-css-support',
  \ 'coc-omnisharp',
  \ 'coc-prettier',
  \ 'coc-prisma',
  \ 'coc-lua',
  \ 'coc-pyright'
  \ ]
" }}}
" Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
" Multi Cursor configurations --------------- {{{
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<C-d>'
let g:VM_maps['Find Subword Under'] = '<C-d>'
let g:VM_mouse_mappings             = 1
nmap <A-LeftMouse>                  <Plug>(VM-Mouse-Cursor)
" }}}

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" or                                , { 'branch': '0.1.x' }
let $FZF_DEFAULT_COMMAND='rg --files -g !.git/ -g !build/'
Plug 'https://github.com/pangloss/vim-javascript' " javascript syntax
Plug 'https://github.com/leafgarland/typescript-vim' "typescript syntax
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'cohama/lexima.vim'

call plug#end()

" }}}

colorscheme gruvbox
set encoding=UTF-8

nnoremap <C-t>                   :NERDTreeToggle<CR>
nnoremap <silent> <F12>          <Plug>(coc-definition)
nnoremap <silent> <leader>r      <Plug>(coc-references)
noremap <C-p> :Files<CR>

nmap <F8> :TagbarToggle<CR>

:set completeopt-=preview " For No Previews

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins
"
" :CocInstall coc-pyright
" :CocInstall coc-clangd  " Coc for cpp, need Clangd installed
" :CocInstall coc-snippets
" :CocCommand snippets.edit... FOR EACH FILE TYPE

" Airline configurations ----------------- {{{
" air-line
let g:airline_powerline_fonts = 1
let g:airline_theme='jellybeans'
" let g:airline_section_b = '%{getcwd()}' " in section B of the status line display the CWD
" TABLINE:
let g:airline#extensions#tabline#enabled = 1           " enable airline tabline
let g:airline#extensions#tabline#formatter = 'jsformatter' " path-to/f
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#ignore_bufadd_pat = '!|defx|gundo|nerd_tree|startify|tagbar|undotree|vimfiler'
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
" }}}


" vim mapping settings ------------------- {{{
let mapleader = "-"
noremap	 <S-j>		  <Nop>
noremap	 <S-k>		  <Nop>

imap	 <C-j>		  <Down>
imap	 <C-k>		  <Up>
imap	 <C-h>		  <left>
imap	 <C-l>		  <right>
imap     <A-h>        <C-left>
imap     <A-l>        <C-right>
inoremap <silent><expr> <Tab>
        \ coc#pum#visible() ? coc#pum#confirm() : "\<Tab>"
inoremap jk           <ESC>
inoremap <C-_>		  <ESC>:execute "normal gcc"<cr>
inoremap <C-f>		  <ESC>/\c
inoremap <C-s>        <ESC>:w<cr>
inoremap <C-z>        <ESC>u<cr>
inoremap <A-f>        <ESC>:CocCommand prettier.formatFile<cr>

nmap	 <leader>	  <Nop>
nmap	 <C-j>		  <ESC><C-e>
nmap	 <C-k>		  <ESC><C-y>
nnoremap <C-f>		  /\c
nnoremap <C-_>        <ESC>:execute "normal gcc"<cr>
nnoremap <C-q>		  :bdelete<cr>
nnoremap <C-p>        <ESC>:Telescope find_files find_command=rg,--hidden,--files,--glob,!**/.git/*,--glob,!**/build/* <cr>
nnoremap <C-b>        <ESC>:Telescope buffers<cr>
nnoremap <leader>n	  :nohl<cr>
nnoremap <C-s>        :w<cr>
nnoremap <C-z>        :u<cr>
nnoremap <A-t>		  :NERDTreeFind<cr>
nnoremap <A-f>        :CocCommand prettier.formatFile<cr>
nnoremap <leader>ev	  :edit $MYVIMRC<cr>
nnoremap <leader>vev  :vsplit $MYVIMRC<cr>
nnoremap <leader>hev  :split $MYVIMRC<cr>
nnoremap <leader>sv	  :source $MYVIMRC<cr>
nnoremap <leader>-	  :bprevious<cr>
nnoremap <leader>=	  :bnext<cr>
nnoremap <leader>gp :Telescope live_grep<cr>

" In order to use the commentary plugin, this mapping is not nore
vmap	 <C-_>		  gc
vnoremap <leader>"	          <ESC>`>a"<ESC>`<i"<ESC>
vnoremap <leader>'	          <ESC>`>a'<ESC>`<i'<ESC>
vnoremap <leader>(	          <ESC>`>a)<ESC>`<i(<ESC>
vnoremap <leader>{	          <ESC>`>a}<ESC>`<i{<ESC>
vnoremap <leader>[	          <ESC>`>a]<ESC>`<i[<ESC>
vnoremap <leader><	          <ESC>`>a><ESC>`<i<<ESC>
vnoremap '			  <Nop>
vnoremap (			  <Nop>

tnoremap <A-q>  	  <C-\><C-N>
tnoremap <C-F>		  <C-c>ack "" ./

inoreabbrev adn and
inoreabbrev waht what
inoreabbrev @@  oscarzqy@hotmail.com
" }}}

" Vimscript file settings --------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" c++ file settings --------------------------- {{{
augroup filetype_cpp
    autocmd!
    autocmd filetype cpp setlocal foldlevelstart=99
    autocmd filetype cpp setlocal foldmethod=syntax
augroup end
" }}}


" Autocmds ----------------------- {{{
augroup RemoveTrailingSpaces
    autocmd!
    autocmd BufWritePre * :%s/\s\+$//e
augroup END

augroup JSBufferHighlightingSync
    autocmd!
	autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
	autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
augroup END
" }}}

augroup WebdevIndent
    autocmd!
    autocmd BufEnter *.{js,jsx,ts,tsx,html,css,json} :setlocal tabstop=2 shiftwidth=2
augroup END

" Test Coc insert
" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" neovide settings
if exists("g:neovide")
    let g:neovide_cursor_animation_length = 0
    set guifont=Consolas:h12
endif

