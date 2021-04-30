" Useful Links and TODO {{{1
" LINK: https://github.com/Kethku/neovide
" LINK: http://cheat.sh

" TODO: Get Codi working.
" TODO: Style barbar.
" TODO: Tidy galaxyline code.
" TODO: Snippets how to use?
" TODO: Code completion how to use?
" TODO: LSP Perl
" TODO: LSP Bash
" TODO: LSP Java
" TODO: LSP JavaScript
" TODO: LSP React
" TODO: LSP Python
" TODO: LSP PHP
" TODO: LSP Lua

" Buffer bar info: https://github.com/romgrk/barbar.nvim
" }}}

" TODO: Codi maths editor {{{1
" map <C-c> :Codi<CR>
" let g:codi#virtual_text_prefix = " ❯❯❯ "
" let g:codi#rightsplit=1
" let g:codi#rightalign=1
" }}}

" Key mappings {{{1

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" <Ctrl-c> and yy copies to clipboard, paste with <shift-insert>
vmap <C-c> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
vmap yy    y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>

" Move lines up and down using alt-up/down.
nnoremap <A-Down> :m .+1<CR>==
nnoremap <A-Up> :m .-2<CR>==
inoremap <A-Down> <Esc>:m .+1<CR>==gi
inoremap <A-Up> <Esc>:m .-2<CR>==gi
vnoremap <A-Down> :m '>+1<CR>gv=gv
vnoremap <A-Up> :m '<-2<CR>gv=gv

" Hash bang function and key combo
" See https://vim.fandom.com/wiki/Setting_file_attributes_without_reloading_a_buffer
function! SetExecutableBit()
  let fname = expand("%:p")
  checktime
  execute "au FileChangedShell " . fname . " :echo"
  silent !chmod a+x %
  checktime
  execute "au! FileChangedShell " . fname
endfunction
inoremap #!ba #!/usr/bin/env bash<CR><Esc>:w<CR>:call SetExecutableBit()<CR>a
inoremap #!sh #!/usr/bin/env sh<CR><Esc>:w<CR>:call SetExecutableBit()<CR>a
inoremap #!pe #!/usr/bin/env perl<CR><Esc>:w<CR>:call SetExecutableBit()<CR>a
inoremap #!py #!/usr/bin/env python<CR><Esc>:w<CR>:call SetExecutableBit()<CR>a
inoremap #!gr #!/usr/bin/env groovy<CR><Esc>:w<CR>:call SetExecutableBit()<CR>a
inoremap #!zs #!/usr/bin/env zsh<CR><Esc>:w<CR>:call SetExecutableBit()<CR>a

" Execute current file.
map <silent> <A-r> :w<CR>:!%:p<CR>

function! ExecuteCurrentLine()
    let line=getline('.')
    if line != ""
        let $CURCMD=line
        term bash -c $CURCMD
        echo "Running : ".line
    else
        echo "No Text under cursor."
    endif
endfunction
nmap gr :call ExecuteCurrentLine()<CR>

" gq to format selection as 80 char justified.
" set formatoptions q
set formatprg=par\ -w79
map <C-w> gqip

" Saves a few key presses.
nnoremap ; :
nnoremap W :w<CR>

" zz toggles fold
nnoremap zz za

" Inc and dec a number.
" nnoremap <A-a> <C-a>
" nnoremap <A-x> <C-x>

" Jump!
function! JumpToSelection()
    let url=matchstr(getline('.'), '[a-z]*:\/\/[^ >,;)]*')
    if url != ""
        silent exec ':!xdg-open "'.url.'"' | redraw!
        echo "Opened URL ".url
    else
        echo "No URL under cursor."
    endif
endfunction
nmap gj :call JumpToSelection()<CR>

" Open url under cursor.
function! OpenUrlUnderCursor()
    let url=matchstr(getline('.'), '[a-z]*:\/\/[^ >,;)]*')
    if url != ""
        silent exec ':!xdg-open "'.url.'"' | redraw!
        echo "Opened URL ".url
    else
        echo "No URL under cursor."
    endif
endfunction
nmap gx :call OpenUrlUnderCursor()<CR>

" Open url under cursor.
function! OpenPluginUnderCursor()
    let url="https://github.com/" .  matchstr(getline('.'), '"[^"]*"')
    if url != ""
        silent exec ':!xdg-open "'.url.'"' | redraw!
        echo "Opened URL ".url
    else
        echo "No URL under cursor."
    endif
endfunction
nmap gp :call OpenPluginUnderCursor()<CR>

" Open cheat page on word under cursor
function! OpenChtUrlUnderCursor()
    let wordUnderCursor = expand("<cword>")
    let url='https://cheat.sh/' . &filetype . '/' . wordUnderCursor
    if url != ""
        let $CURLCMDVIM='https://cheat.sh/' . &filetype . '/' . wordUnderCursor
        term curl -s $CURLCMDVIM
        echo "Opened Cheat ".url
    else
        echo "No cheat word under cursor."
    endif
endfunction
nmap gc :call OpenChtUrlUnderCursor()<CR>

" Open colour under cursor when hex like #ff4422
function! OpenHexUrlUnderCursor()
    let url="https://www.colorhexa.com/" . matchstr(getline('.'), '[0-9a-fA-F]\{6}')
    if url != ""
        silent exec ':!xdg-open "'.url.'"' | redraw!
        echo "Opened hex colour ".url
    else
        echo "No hex colour under cursor."
    endif
endfunction
nmap gh :call OpenHexUrlUnderCursor()<CR>

" Toggle whitespace highlight.
let s:hilightws = 1
function TOGGLEWHITESPACECOLOURS()
  if s:hilightws
    match ExtraWhitespace //
    let s:hilightws = 0
  else
    match ExtraWhitespace /^\s*\t\s*\|\s\+\%#\@<!$/
    let s:hilightws = 1
  endif
endfunction

" Function key mappings.
map <F1> :sp $HOME/.config/nvim/README.md<CR>
map <F2> :call TOGGLEWHITESPACECOLOURS()<CR>
map <F3> :set list!<CR>
map <F4> :NvimTreeToggle<CR>
" F5 reserved for kitty.
map <F6> :set wrap!<CR>
map <F7> :if exists("g:syntax_on")<Bar>syntax off<Bar>else<Bar>syntax enable<Bar>endif<CR>
" map <F8>
map <F9> :Telescope find_files<CR>
" F10 reserved for kitty, open new terminal.
map <F11> :TagbarToggle<CR>
map <F12> :RnvimrToggle<CR>

" For folding.
inoremap "{ " Name { <esc>xa{{1<CR>" } <esc>xa}}<esc>bbbbbcw
inoremap #{ # Name { <esc>xa{{1<CR># } <esc>xa}}<esc>bbbbbcw

" Save
map <c-s> :w<CR>

" Highlight a column in csv text.
" See: https://vim.fandom.com/wiki/Working_with_CSV_files
" :Csv 1    " highlight first column
" :Csv 12   " highlight twelfth column
" :Csv 0    " switch off highlight
function! CSVH(colnr)
  if a:colnr > 1
    let n = a:colnr - 1
    execute 'match CsvColHighlight /^\([^,|\t]*[,|\t]\)\{'.n.'}\zs[^,|\t]*/'
    execute 'normal! 0'.n.'f,'
  elseif a:colnr == 1
    match CsvColHighlight /^[^,|\t]*/
    normal! 0
  else
    match
  endif
endfunction
command! -nargs=1 Csv :call CSVH(<args>)

" Sql and Java flipping.
vnoremap <A-s> :!$HOME/bin/sak sqlflip<CR>

" Toggle comment and move to next line.
nmap <C-_> :CommentToggle<CR>j
" nmap <C-/> :CommentToggle<CR>j
" }}}

" Settings {{{1
:Gitsigns toggle_current_line_blame

let g:github_enterprise_urls = ['https://bitbucket.org']
let g:startify_session_dir=['~/.config/nvim/sessions']
let bufferline.icons="both"
let bufferline.icon_custom_colors="true"
let bufferline.icon_close_tab_modified=''

syntax enable                           " Enables syntax highlighing
set iskeyword+=-                        " Treat dash separated words as a word text object"
set formatoptions-=cro                  " Stop newline continution of comments
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler                               " Show the cursor position all the time
set cmdheight=2                         " More space for displaying messages
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set tabstop=4                           " Insert 4 spaces for a tab
set softtabstop=0                       " Disable soft tabs
set shiftwidth=4                        " Change the number of space chars inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=2                        " Always display the status line
set number relativenumber               " Line numbers and relativenumbers
set cursorline                          " Enable highlighting of the current line
set background=dark                     " tell vim what the background color looks like
set showtabline=2                       " Always show tabs
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set shortmess+=c                        " Don't pass messages to |ins-completion-menu|.
set signcolumn=yes                      " Always show, otherwise it would shift the text each time
set updatetime=300                      " Faster completion
set timeoutlen=750                      " By default timeoutlen is 1000 ms
set clipboard=unnamedplus               " Copy paste between vim and everything else
set incsearch                           " Highlight all matches
" set guifont=Consolas\ Nerd\ Font        " Preferred font
set guifont=SauceCodePro\ Nerd\ Font\ Mono:h15
set foldenable                          " Folding enabled
set foldmethod=marker                   " Folding method, based on { { {1
set clipboard+=unnamedplus              " Use single clipboard
" }}}

" Visual and Colours {{{1

" My colour scheme
colorscheme zenburnmod

" Colour words highlightin
" See: https://github.com/RRethy/vim-hexokinase
let g:Hexokinase_highlighters = [ 'backgroundfull' ]

" Show whitespace characters
set listchars=eol:¶,tab:»-,trail:·,extends:>,precedes:<,space:·
set list

"Highligh cursor line/column
set colorcolumn=80,120
highlight ColorColumn  cterm=NONE ctermbg=Grey       ctermfg=White guibg=#313131 guifg=#ffffff
set cursorcolumn
highlight CursorColumn cterm=NONE ctermbg=Black      ctermfg=White guibg=#483d8b guifg=#ffffff
highlight CursorLine ctermbg=238 guibg=#870000

" Selection line colours
highlight Visual cterm=NONE ctermbg=0 ctermfg=NONE guibg=Grey35

" Search hit colour
highlight Search guibg=peru guifg=wheat

" Line number colour
highlight LineNr ctermbg=black guifg=RoyalBlue1 guibg=Gray19
highlight CursorLineNr ctermbg=NONE guifg=Yellow guibg=Gray19

" Highlight text over 100 chars
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%101v.\+/

" Diff colours
highlight DiffAdd      gui=none  guibg=none    guifg=Green
highlight DiffChange   gui=none  guibg=none    guifg=Cyan
highlight DiffDelete   gui=none  guibg=none    guifg=Red
highlight DiffText     gui=none  guibg=none    guifg=Orange

" Highlight folds
highlight Folded guifg=lightgreen
set foldcolumn=1

" Git changes and margins
highlight GitSignsAdd    ctermfg=Black ctermbg=Green guifg=White guibg=#608b4e
highlight GitSignsDelete ctermfg=Black ctermbg=Red   guifg=White guibg=#d16969
highlight GitSignsChange ctermfg=Black ctermbg=Blue  guifg=White guibg=#5497cf
highlight GitSignsCurrentLineBlame guifg=Grey guibg=#700000

" Tab bar at top!
highlight BufferCurrent       guifg=Black     guibg=#CCCCCC
highlight BufferCurrentIndex  guifg=Black     guibg=#CCCCCC
highlight BufferCurrentSign   guifg=Black     guibg=#CCCCCC
highlight BufferCurrentMod    guifg=#FF4422   guibg=#CCCCCC
highlight BufferInactive      guifg=White     guibg=#333333
highlight BufferInactiveIndex guifg=White     guibg=#333333
highlight BufferInactiveSign  guifg=White     guibg=#333333
highlight BufferInactiveMod   guifg=#FF4422   guibg=#333333

" Highlight spaces at end of line: https://vim.fandom.com/wiki/Highlight_unwanted_spaces
highlight ExtraWhitespace ctermbg=Red guibg=Red
match ExtraWhitespace /^\s*\t\s*\|\s\+\%#\@<!$/
set termguicolors
" }}}

" Syntax files {{{1

"  Auddis!
au! Syntax auddis source ~/.config/nvim/syntax/auddis.vim
au BufRead,BufNewFile *.aud set filetype=auddis
au BufRead,BufNewFile *.ASC set filetype=auddis

"  Celestia!
au! Syntax cel source ~/.config/nvim/syntax/cel.vim
au BufRead,BufNewFile *.cel set filetype=cel

" Csv files.
au! Syntax csvfile source ~/.config/nvim/syntax/csv.vim
au BufRead,BufNewFile *.csv set filetype=csvfile
au BufRead,BufNewFile *.tsv set filetype=csvfile

" EDI files.
au! Syntax edifile source $HOME/.config/nvim/syntax/edifile.vim
au BufRead,BufNewFile *.edi set filetype=edifile
au BufRead,BufNewFile *.mdf set filetype=edifile
au BufRead,BufNewFile *.hse set filetype=edifile

" Franchise dat files.
au! Syntax franchisefile source ~/.config/nvim/syntax/franchisefile.vim
au BufRead,BufNewFile *.dat set filetype=franchisefile

" Log4j files.
au! Syntax log4j source ~/.config/nvim/syntax/log4j.vim
au BufRead,BufNewFile *.log set filetype=log4j

" Rundeck log files.
au! Syntax runlog source ~/.config/nvim/syntax/runlog.vim
au BufRead,BufNewFile ALLREAD*.txt set filetype=runlog
au BufRead,BufNewFile ALLKewill*.txt set filetype=runlog
" }}}

" Abbreviations and Snippets {{{1

let g:UltiSnipsSnippetStorageDirectoryForUltiSnipsEdit='~/.config/nvim/UltiSnips'
let g:UltiSnipsListSnippets="<c-s>"

" For Java
au BufRead,BufNewFile *.java call JavaAbbrevFunction()
function JavaAbbrevFunction()
    iab /* /*<CR> *<CR>*/<Up>
    iab psvm public static void main(String[] args){<CR>}<esc>O
    iab sysout System.out.println("");<esc>2hi
    iab sop System.out.println("");<esc>2hi
    iab syserr System.err.println("");<esc>2hi
    iab sep System.err.println("");<esc>2hi
    iab forl for (int i = 0; i < ; i++) {<esc>7hi
    iab tryb try {<CR>} catch (Exception ex) {<CR> ex.printStackTrace();<CR>}<esc>hx3ko
    iab const public static final int
    iab ctm System.currentTimeMillis()
    iab slept try {<CR> Thread.sleep();<CR>}<esc>hxA catch(Exception ex) {<CR> ex.printStackTrace();<CR>}<esc>hx3k$hi
    iab log import org.slf4j.Logger;<CR>import org.slf4j.LoggerFactory;<CR>/* Logging! */<CR>private static final Logger LOG = LoggerFactory.getLogger(HealthCheckService.class);<CR>
endfunction

" Misc
iab waht what
iab Vari Variables
iab teh the
iab tehn then
iab Req Request
iab fb foobar
iab Attr Attributes
iab Appl Application
iab adn and

" For command abbreviations
cab s sort
" }}}

" LSP {{{1

" lua require'lspconfig'.pyright.setup{}
" lua require'lspconfig'.bashls.setup{}
" }}}

" Auto Commands, e.g source init.vim {{{1

" Auto reload my init.vim file.
" autocmd! bufwritepost ~/.config/nvim/init.vim source ~/.config/nvim/init.vim | echo "Reloaded my init.vim"

" Disable some things on the dashboard.
autocmd! Filetype * if &ft=="dashboard"|match OverLength /\%501v.\+/|endif | autocmd WinLeave <buffer> match OverLength /\%101v.\+/

" }}}

