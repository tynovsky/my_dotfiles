execute pathogen#infect()
syntax on
filetype plugin indent on
set mouse=a
set history=10000
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅
set tabstop=4
set shiftwidth=4
set expandtab
set scrolloff=3
set hidden
set omnifunc=syntaxcomplete#Complete
let g:SuperTabDefaultCompletionType = "context"

colorscheme solarized
highlight MatchParen cterm=none ctermbg=bg ctermfg=black
let g:solarized_termcolors=256
set background=light

set guioptions=aegirLt
set guifont=Inconsolata\ 12

inoremap <F2> <C-o>:w<CR>
nnoremap <F2> :w<CR>
set pastetoggle=<F3>
nnoremap <F4> :bd<CR>

nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

nnoremap <Up>    <Nop>
nnoremap <Down>  <Nop>
nnoremap <Left>  <Nop>
nnoremap <Right> <Nop>
nnoremap <M-Left> <C-o>
nnoremap <M-Right> <C-i>

inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-x><C-o>


cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'"


if v:version >= 703
    set undodir=~/.vim/undofiles
    set undofile
    set colorcolumn=+2
endif

if has("autocmd")
  au InsertEnter * silent execute "!sed -i -e 's/TERMINAL_CURSOR_SHAPE_BLOCK/TERMINAL_CURSOR_SHAPE_IBEAM/; s/ColorCursor=.*/ColorCursor=\\#000000000000/' ~/.terminal-solarized/xfce4/terminal/terminalrc"
  au InsertLeave * silent execute "!sed -i -e 's/TERMINAL_CURSOR_SHAPE_IBEAM/TERMINAL_CURSOR_SHAPE_BLOCK/; s/ColorCursor=.*/ColorCursor=\\#cccccccccccc/' ~/.terminal-solarized/xfce4/terminal/terminalrc"
  au VimLeave * silent execute "!sed -i -e 's/TERMINAL_CURSOR_SHAPE_IBEAM/TERMINAL_CURSOR_SHAPE_BLOCK/; s/ColorCursor=.*/ColorCursor=\\#cccccccccccc/' ~/.terminal-solarized/xfce4/terminal/terminalrc"
endif


"Autoreload .vimrc on save
au! bufwritepost .vimrc source %
