set nocompatible
filetype off
syntax on
set t_Co=256

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
 Plugin 'gmarik/Vundle.vim'
 Plugin 'tpope/vim-fugitive'
 Plugin 'bling/vim-airline'
 Plugin 'blerins/flattown'
 Plugin 'junegunn/goyo.vim'
 Plugin 'amix/vim-zenroom2'
 Plugin 'Townk/vim-autoclose'
 Plugin 'vim-scripts/closetag.vim'
 Plugin 'altercation/vim-colors-solarized'
 Plugin 'fatih/vim-go'
 Plugin 'scrooloose/nerdtree'
 Plugin 'Valloric/YouCompleteMe'
 Plugin 'morhetz/gruvbox'
call vundle#end()
filetype plugin indent on

" Colorscheme has to come after vundle call.
 syntax enable
 set background=dark
 colorscheme gruvbox

" Required for airline
set laststatus=2
set ttimeoutlen=50

" Enable mouse
set number
set mouse=a

" Some Linux distributions set filetype in /etc/vimrc.
" Clear filetype flags before changing runtimepath to force Vim to reload
" them.
 filetype off
 filetype plugin indent off
 set runtimepath+=$GOROOT/misc/vim
 filetype plugin indent on
 syntax on


 " autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
