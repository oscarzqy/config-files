:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=2
:set smarttab
:set softtabstop=4
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
Plug 'https://github.com/neoclide/coc.nvim', {'branch': 'release'}  " Auto Completion
" Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim' " command-line fuzzy finder, need to install fzf on your system https://github.com/junegunn/fzf

call plug#end()

" }}}

colorscheme gruvbox
set encoding=UTF-8

let g:coc_data_home = 'C:/Users/qzhang/AppData/Local/coc'

" other plugins
" fzf @ https://github.com/junegunn/fzf.vim 
" auto-pairs @ https://github.com/jiangmiao/auto-pairs " Pair brackets automatically, .vim file should be put under ~/AppData/Local/nvim/plugin

nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>
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

imap	 <C-j>		  <ESC><C-e>
imap	 <C-k>		  <ESC><C-k>
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
inoremap jk			  <ESC>
inoremap <C-_>		  <ESC>:execute "normal gcc"<cr> 
inoremap <C-f>		  <ESC>/

nmap	 <C-j>		  <ESC><C-e>
nmap	 <C-k>		  <ESC><C-y>
nnoremap <C-f>		  /
nnoremap <C-_>        <ESC>:execute "normal gcc"<cr>
nnoremap <C-q>		  :bdelete<cr>
nnoremap <leader>ev	  :edit $MYVIMRC<cr>
nnoremap <leader>vev  :vsplit $MYVIMRC<cr>
nnoremap <leader>hev  :split $MYVIMRC<cr>
nnoremap <leader>sv	  :source $MYVIMRC<cr>
nnoremap <leader>nh	  :nohl<cr>
nnoremap <leader>-	  :bprevious<cr>
nnoremap <leader>=	  :bnext<cr>

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
  autocmd filetype cpp setlocal foldlevelstart=1
  autocmd filetype cpp setlocal foldmethod=syntax
augroup end
" }}} 
