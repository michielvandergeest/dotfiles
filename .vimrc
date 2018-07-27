set nocompatible              					" Use iMproved features, required for Vundle

" Source plugins that are defined in separate file
so ~/.vim/plugins.vim



"------------ General Settings ------------"
syntax enable
set backspace=indent,eol,start					" Make backspace behave like in other editors.
let mapleader = ','								" Use comma as leader for custom mappings (instead of \).
set number										" Activate line numbers
set noerrorbells 								" No beeps
set visualbell									" No beeps
set showcmd										" Show (partial) command in the status line
set autoindent                  				" always set autoindenting on
set copyindent                  				" copy the previous indentation on autoindenting
set hidden										" Allow changing buffers without forcing to save
set laststatus=2								" Configuration for lightline plugin
set noshowmode									" Configuration for lightline plugin



"------------ Visuals ------------"
set t_Co=256									" Force to use 256 colors
colorscheme atom-dark-256						" Theme from https://github.com/gosukiwi/vim-atom-dark/
hi LineNr ctermbg=bg							" Same background on linenumbers



"------------ Searching ------------"
set hlsearch									" Highlight search results
set incsearch									" Highlight incrementally




"------------ Custom Shortcuts ------------"
nmap <Leader>ev :tabedit $MYVIMRC<cr>			" Shortcut to edit the Vimrc file.
nmap <Leader><space> :nohlsearch<cr>			" Shortcut to remove search higlight
nmap ; :Files<cr>								" Shortcut to open fzf file browser
nmap ' :NERDTreeToggle<cr>						" Shortcut to open fzf file browser

nnoremap j gj									" Down is really the next line
nnoremap k gk									" Down is really the previous line



"----------- Auto Commands ------------"

"Automatically source the VIMrc file on save.
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END
