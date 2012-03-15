set autoindent
set backspace=indent,eol,start

set tabstop=4
autocmd BufNewFile,BufRead *.p[lm] set expandtab "expand tab only in perl files
set shiftwidth=4
set shiftround

set ignorecase
set smartcase

"set smartindent
call pathogen#infect()

syntax on

filetype plugin indent on
set background=dark
if has('gui_running')
    set background=light
    "colorscheme solarized
    colorscheme github
endif
"set number
set scrolloff=2
set guifont=Inconsolata\ 12
set guioptions=aegirLt
"set guioptions=aegimrLt "to enable menu
"set guioptions=aegimrLtT "to enable menu and toolbars

"less violent matching-parenthesis highlighting
"highlight MatchParen cterm=underline ctermbg=none ctermfg=none
highlight MatchParen gui=bold guibg=bg guifg=Blue

set list
set listchars=tab:\ \ ,trail:▒

nmap    <CR>        <C-]>
nmap    <BS>        <C-T>
nmap    <M-Left>    <C-O>
nmap    <M-Right>   <C-I>

inoremap <tab> <c-r>=InsertTabWrapper()<cr>

function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction

inoremap <cr> <c-r>=EnterInBrackets()<cr>

function! EnterInBrackets()
    let c = strpart(getline('.'), col('.')-2, 2)
    if c == "()" || c == "[]" || c == "{}"
        return "\<cr>\<cr>\<Up>\<tab>"
    else
        return "\<cr>"
    endif
endfunction


"inoremap <expr> {  strpart(getline('.'), col('.'), 1) == "" ? "{}\<Left>" : "{"
inoremap  {  {}<Left>
inoremap <expr> }  strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
"inoremap <expr> [  strpart(getline('.'), col('.'), 1) == "" ? "[]\<Left>" : "["
inoremap  [  []<Left>
inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
"inoremap <expr> (  strpart(getline('.'), col('.'), 1) == "" ? "()\<Left>" : "("
inoremap  (  ()<Left>
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
""inoremap " ""<Left>
""inoremap ' ''<Left>

:map <C-F11>  :sp tags<CR>:%s/^\([^	:]*:\)\=\([^	]*\).*/syntax keyword Tag \2/<CR>:wq! tags.vim<CR>/^<CR><C-F12>
:map <C-F12>  :so tags.vim<CR>


"""""""Perl abbreviations (from PBP) TODO: put into file templates instead
iab papp  :0r ~/.code_templates/perl_application.pl
iab pmod  :0r ~/.code_templates/perl_module.pm

"""""""Perl compiler
set autowrite
autocmd BufNewFile,BufRead *.pl compiler perl
autocmd BufNewFile,BufRead *.pm compiler perl

"""""""Perl folding
""let perl_fold = 1
""let perl_fold_blocks = 1
""nmap + zo
""nmap - zfa}

"""""""Nette stuff
autocmd BufNewFile,BufRead *.latte set filetype=html

