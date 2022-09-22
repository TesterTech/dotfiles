" from primagen youtube video
" https://www.youtube.com/watch?v=n9k9scbTuvQ
execute pathogen#infect()
set nocompatible
filetype plugin indent on
syntax on
runtime! plugin/sensible.vim
set showmatch
set cursorline
set mouse=a
set noerrorbells
set tabstop=4 softtabstop=4
set expandtab
set smartindent
set nu
set nowrap
set noswapfile
set smartcase
set incsearch
set nobackup 
set undodir=~/.vim/undodir
set undofile
set laststatus=2

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey
highlight Comment cterm=italic

" if plug not installed you get an error
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" if pathogen error
" curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
"
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'kien/ctrlp.vim'
Plug 'mbbill/undotree'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
call plug#end()

colorscheme gruvbox
set background=dark
if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let mapleader = " "
let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:ctrlp_use_caching = 0

nnoremap <leader>j :wincmd h<CR>
nnoremap <leader>k :wincmd j<CR>
nnoremap <leader>l :wincmd k<CR>
nnoremap <leader>; :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>= :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>e :Explore <CR>

" https://medium.com/@victormours/a-better-nerdtree-setup-3d3921abc0b9 
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" open and close nerdtree
nnoremap <Leader>f :NERDTreeToggle<Enter>

" https://stackoverflow.com/questions/3083928/vim-remapping-the-hjkl
"noremap ; l
"noremap l k
"noremap k j
"noremap j h

" https://vim.fandom.com/wiki/Accessing_the_system_clipboard
"
" Copy to X CLIPBOARD
map <leader>cc :w !xsel -i -b<CR>
map <leader>cp :w !xsel -i -p<CR>
map <leader>cs :w !xsel -i -s<CR>
" Paste from X CLIPBOARD
map <leader>pp :r!xsel -p<CR>
map <leader>ps :r!xsel -s<CR>
map <leader>pb :r!xsel -b<CR>
