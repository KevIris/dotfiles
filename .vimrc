" TODO 
" nnoremap <leader>rc :-1read $HOME/Documents/Snippets/SkeletonRubyClass<CR>A 
" context=dependant snippets - eg ,c brings up a class snippet based on filetype

"TODO cycle through next thing at the same indent level. 
"Have to come back to this
"nnoremap <leader>n 0vwy/"+p<cr>n

"TODO search for current wordwith tt 
" nnoremap & yw:Find<D-v><cr> 

"TODO new blank window in this folder with ,e. 
"nnoremap <leader>e :vsplit <D-v><cr><cr>

" words I can't spell. iab == iabbrev
iab strign string
iab stirng string
iab lenght length 
iab legnth length 
iab ojbect object 
iab funciton function
iab gatehring gathering
iab ot to 

"leader key
let mapleader = ","

" timeoutlenght; dddd interferes a bit with dd....
set timeout
set timeoutlen=300 ttimeoutlen=0

" TODO use mouse to scroll 
" set mouse=n

" Specify a directory for plugins 
call plug#begin('~/.vim/plugged')
"Linter
Plug 'w0rp/ale'
"File broswer
Plug 'scrooloose/nerdtree'
" syntax highlighting
Plug 'scheakur/vim-scheakur'
"Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" elm amazingness
Plug 'elmcast/elm-vim'
" More colour schemes
Plug 'altercation/vim-colors-solarized'
" Rubocop innit
Plug 'ngmy/vim-rubocop'
" Matches coceblocks with % 
Plug 'adelarsq/vim-matchit'
" Git ting yo
Plug 'tpope/vim-fugitive'

call plug#end()

"Colourscheme stuff
set background=dark
try 
  colorscheme scheakur 
catch
endtry

" text width
set tw=80

" Does this even work?
"  Enable folding  
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" Requires brew install macvim --withoverride-system-vim 
" Set clipboard as global register for vim
set clipboard=unnamed  


"line numbers
set number

"statusline - show file path and n/n line
set statusline=%F
set statusline+=\ \ \ \ 
set statusline+=%l/%L

"Don't include a swapfile
set noswapfile

"Remember cursor position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"keeps buffers open in the background
set hidden

"Let's be honest, no-one really cares about case when searching.
set ignorecase

"highlight line and column
set cursorline
set cursorcolumn

"Tab as two spaces
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

"Turns off compatibility with vi
set nocompatible

"enable syntax and plugins (for netrw)
syntax enable
filetype plugin on

"Fuzzy find - path looks through every subdirectory, and subdirectory of
"subdirectory - hence fuzzy. 
set path+=**
"not sure this is necessary with fzf but meh

"File menu type thing
set wildmenu
"also probably not necessary because NERDtree 

"Text over 80 chars in red
highlight OverLength ctermfg=red guibg=#592929
match OverLength /\%81v.\+/

"go to tags
command! MakeTags !ctags -R .

"

"upper-case current word with ctrl+u
:nnoremap <c-u> veU<esc>

"Fuzzy file finder. 
nnoremap ff :FZF<CR>

" Because apparently by default backspace doesn't do what you'd expect
set backspace=indent,eol,start

"Spacebar turn on/ off highlighting for search term; displays same
noremap <Space> :set hlsearch! hlsearch?<CR>

"Enter centres screen to current position
nnoremap <Enter> zz

"When cycling through searches with n/ N, centre screen. 
nnoremap n nzz
nnoremap N Nzz

"edit and source vimrc quickly
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :w<cr>:source $MYVIMRC<cr><esc>:q<cr> 

" highlights all and aligns
" the 2<C-o> is taking you back two positions, FYI
nnoremap == ggvG==<esc>2<C-o>

"Surround current word in quotes
"In case you're wondering, if the 'b' is at the beginning of the line, it'll go
"to the line before; moving one character right guarantess that's not a problem. 
nnoremap <leader>" lbi"<esc>ea"<esc> 
vnoremap <leader>" lb<esc>i"<esc>ea"<esc>v 

nnoremap <leader>' lbi'<esc>ea'<esc> 
vnoremap <leader>' lb<esc>i'<esc>ea'<esc>v 

nnoremap <leader>) lbi(<esc>ea)<esc> 
vnoremap <leader>) lb<esc>i(<esc>ea)<esc>v 
nnoremap <leader>( lbi(<esc>ea)<esc> 
vnoremap <leader>( lb<esc>i(<esc>ea)<esc>v 

nnoremap <leader>] lbi[<esc>ea]<esc> 
vnoremap <leader>] lb<esc>i[<esc>ea]<esc>v 
nnoremap <leader>[ lbi[<esc>ea]<esc> 
vnoremap <leader>[ lb<esc>i[<esc>ea]<esc>v 


nnoremap <leader>} lbi{<esc>ea}<esc> 
vnoremap <leader>} lb<esc>i{<esc>ea}<esc>v 
nnoremap <leader>{ lbi{<esc>ea}<esc> 
vnoremap <leader>{ lb<esc>i{<esc>ea}<esc>v 

"Surround current line in quotes; terrifying similar to the previous, you may note
nnoremap <leader>"" l0i"<esc>A"<esc>
vnoremap <leader>"" l0<esc>i"<esc>A"<esc>v 

nnoremap <leader>'' l0i'<esc>A'<esc> 
vnoremap <leader>'' l0<esc>i'<esc>ea'<esc>v 

nnoremap <leader>)) l0i(<esc>A)<esc> 
vnoremap <leader>)) l0<esc>i(<esc>A)<esc>v 
nnoremap <leader>(( l0i(<esc>A)<esc> 
vnoremap <leader>(( l0<esc>i(<esc>A)<esc>v 

nnoremap <leader>]] l0i[<esc>A]<esc> 
vnoremap <leader>]] l0<esc>i[<esc>A]<esc>v 
nnoremap <leader>[[ l0i[<esc>A]<esc> 
vnoremap <leader>[[ l0<esc>i[<esc>A]<esc>v 


nnoremap <leader>}} l0i{<esc>A}<esc> 
vnoremap <leader>}} l0<esc>i{<esc>A}<esc>v 
nnoremap <leader>{{ l0i{<esc>A}<esc> 
vnoremap <leader>{{ l0<esc>i{<esc>A}<esc>v 

" escape twice to save
nnoremap <Esc><Esc> :w<cr>
 
"paste in insert mode. Arguably shonky.  
inoremap PP <esc>xxpa 

" Note that the below depends upon ripgrep - brew install ripgrep
" Text search with fuzzy finder. Parameters:  
" --column: Show column number 
" --line-number: Show line number 
" --no-heading: Do not show file headings in results 
" --fixed-strings: Search term as a literal string 
" --ignore-case: Case insensitive search 
" --no-ignore: Do not respect .gitignore, etc... 
" --hidden: Search hidden files and folders 
" --follow: Follow symlinks 
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder) 
" --color: Search color options 
"
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --smart-case --glob "!.git/*" --glob "!CHANGELOG*" --glob "!*.json" --glob "!*.yaml" --glob "!*.xml" --glob "!*node_modules*" --color "always" '.shellescape(<q-args>), 1, <bang>0) 

"fzf as glbal search ting
set rtp+=/usr/local/opt/fzf

"remap above to tt 
:nnoremap tt :Find  
 
" move between buffers with ctrl+l/ h
nnoremap <C-h> <C-w>h 
nnoremap <C-l> <C-w>l
inoremap <C-h> <esc><C-w>h 
inoremap <C-l> <esc><C-w>l

"cycle through open buffers in current window
nnoremap <C-j> :bprevious<cr>
nnoremap <C-k> :bnext<cr>

"new window 
nnoremap vv :vsplit<cr><C-w>l

"tab text while in visual mode
vnoremap <Tab> > 

"copy current parenteses 
nnoremap <Tab> v%lyO<esc>

"copy  & paste current code block
nnoremap <Tab><Tab> v%lyO<esc>p

" delete to end of file
nnoremap dddd dG

" quit without saving
nnoremap qqq :q!<cr>

"Copy filepath to clipboard
nnoremap <leader>cp :let @*=expand("%")<cr>

"Copy filename only to clipboard
nnoremap <leader>cf :let @*=expand("%:t")<cr>

"show full path
nnoremap <leader>sp :echo expand('%:p')<cr> 

" Show filepath 
nnoremap ;; :pwd<cr>

" Scroll up / down and centre
nnoremap H Hzz
nnoremap L Lzz

"Copy all file to clipboard [2<C-o> is again returning to current position]
nnoremap <leader>ca ggvG$y<esc>2<C-o>
