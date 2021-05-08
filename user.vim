" Useful Links and TODO {{{1
" LINK: https://github.com/Kethku/neovide
" LINK: http://cheat.sh
" LINK: http://cheat.sh

" LINK: https://github.com/hrsh7th/vim-vsnip

" TODO: Get Codi working.
" TODO: Tidy galaxyline code.
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

" Make current file executable using Eunuch.
map <silent> <A-e> :Chmod a+x<CR>:echo "File is now executable!"<CR>

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

" Jump, looks under the cursor for a URL, Hex Code, GithubProject or Word!
function! JumpToSelection()
  let url=matchstr(expand("<cWORD>"), 'http[s]*:\/\/[^ >,;)]*')

  " Is it a url?
  if url != ""
    silent exec ':!xdg-open "'.url.'"' | redraw!
    echo "Opening URL ".url
  else
    let wordUnderCursor = expand("<cWORD>")
    let hexcode = matchstr(wordUnderCursor, '[0-9a-fA-F]\{6}')

    " Is it a hex colour code?
    if hexcode != ""
      let url="https://www.colorhexa.com/" . hexcode
      silent exec ':!xdg-open "'.url.'"' | redraw!
      echo "Opened HEX colour ".url
    else
      let projectPath = matchstr(wordUnderCursor, '[0-9a-zA-Z]\{3,}/[0-9a-z-A-Z]\{3,}')

      " Is it a github project?
      if projectPath != ""
        let url="https://github.com/" . projectPath
        silent exec ':!xdg-open "'.url.'"' | redraw!
        echo "Opened GitHub project : ".projectPath
      else
        let url='https://cheat.sh/' . &filetype . '/' . wordUnderCursor

        if url != ""
          let $CURLCMDVIM='https://cheat.sh/' . &filetype . '/' . wordUnderCursor
          term curl -s $CURLCMDVIM
          echo "Opened Cheat ".url
        else
          echo "No URL, HEX colour sequence, GitHub Project or Keyword under cursor."
        endif
      endif
    endif
  endif
endfunction
nmap gj :call JumpToSelection()<CR>

" Toggle whitespace highlight.
let s:hilightws = 1
function! TOGGLEWHITESPACECOLOURS()
  if s:hilightws
    highlight extraWhitespace NONE
    highlight longLine NONE
    let s:hilightws = 0
  else
    highlight extraWhitespace guibg=Red
    highlight longLine guibg=#AA3333
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

" Run macro q with just typing Q.
nnoremap Q @q

" Toggle comment and move to next line.
nmap <C-_> :CommentToggle<CR>j
" In neovide use this line instead!
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
set foldenable                          " Folding enabled
set foldmethod=marker                   " Folding method, based on { { {1
set clipboard+=unnamedplus              " Use single clipboard
set guifont=SauceCodePro\ Nerd\ Font\ Mono:h15
" }}}

" Visual and Colours {{{1

" My colour scheme
colorscheme zenburnmod
set termguicolors

" Show whitespace characters
set listchars=eol:¶,tab:»-,trail:·,extends:>,precedes:<,space:·
set list

"Highligh cursor line/column
set colorcolumn=80,120
highlight ColorColumn                          guifg=#ffffff     guibg=#313131
set cursorcolumn
highlight CursorColumn                         guifg=#ffffff     guibg=#483d8b
highlight CursorLine                                             guibg=#870000

" Selection line colours
highlight Visual                                                 guibg=Grey35

" Search hit colour
highlight Search                               guifg=Wheat       guibg=Peru

" Line number colour
highlight LineNr                               guifg=RoyalBlue1  guibg=Gray19
highlight CursorLineNr                         guifg=Yellow      guibg=Gray19

" Diff colours
highlight DiffAdd                              guifg=Green
highlight DiffChange                           guifg=Cyan
highlight DiffDelete                           guifg=Red
highlight DiffText                             guifg=Orange

" Highlight folds
highlight Folded guifg=lightgreen
set foldcolumn=1

" Git changes and margins
highlight GitSignsAdd                          guifg=White       guibg=#608b4e
highlight GitSignsDelete                       guifg=White       guibg=#d16969
highlight GitSignsChange                       guifg=White       guibg=#5497cf
highlight GitSignsCurrentLineBlame             guifg=Grey        guibg=#700000

" Tab bar at top!
highlight BufferCurrent                        guifg=Black       guibg=#CCCCCC
highlight BufferCurrentIndex                   guifg=Black       guibg=#CCCCCC
highlight BufferCurrentSign                    guifg=Black       guibg=#CCCCCC
highlight BufferCurrentMod                     guifg=#FF4422     guibg=#CCCCCC
highlight BufferInactive                       guifg=White       guibg=#333333
highlight BufferInactiveIndex                  guifg=White       guibg=#333333
highlight BufferInactiveSign                   guifg=White       guibg=#333333
highlight BufferInactiveMod                    guifg=#FF4422     guibg=#333333

" LSP colours
highlight LspDiagnosticsDefaultError           guifg=Red
highlight LspDiagnosticsDefaultWarning         guifg=Red
highlight LspDiagnosticsDefaultInformation     guifg=Cyan
highlight LspDiagnosticsDefaultHint            guifg=Green

highlight LspDiagnosticsFloatingError          guifg=Red
highlight LspDiagnosticsFloatingWarning        guifg=Orange
highlight LspDiagnosticsFloatingWarn           guifg=Orange
highlight LspDiagnosticsFloatingInformation    guifg=Cyan
highlight LspDiagnosticsFloatingInfor          guifg=Cyan
highlight LspDiagnosticsFloatingHint           guifg=Green

" Lsp highlight in left margin.
highlight LspDiagnosticsSignError              guifg=Red         guibg=Gray19
highlight LspDiagnosticsSignWarning            guifg=Orange      guibg=Gray19
highlight LspDiagnosticsSignInformation        guifg=Cyan        guibg=Gray19
highlight LspDiagnosticsSignHint               guifg=Green       guibg=Gray19

" Lsp Inline error highlight.
highlight LspDiagnosticsUnderlineError         guifg=Black       guibg=Brown
highlight LspDiagnosticsUnderlineWarning       guifg=Black       guibg=Orange
highlight LspDiagnosticsUnderlineInformation   guifg=Black       guibg=Cyan
highlight LspDiagnosticsUnderlineHint          guifg=Black       guibg=Green

" Lsp error on right side.
highlight LspDiagnosticsVirtualTextError       guifg=Red
highlight LspDiagnosticsVirtualTextWarning     guifg=Orange
highlight LspDiagnosticsVirtualTextInformation guifg=Cyan
highlight LspDiagnosticsVirtualTextHint        guifg=Green

" Highlight text over 120 chars
highlight longLine                                               guibg=#AA3333
call matchadd('longLine', '.\%>121v', 1)

" Highlight git merge conflict markers.
highlight gitMergeConflictStart                guifg=DarkGreen   guibg=Red
call matchadd('gitMergeConflictStart', '^<<<<<<< HEAD.*$', 1)

highlight gitMergeConflictMid                  guifg=DarkBlue    guibg=Red
call matchadd('gitMergeConflictMid', '^=======.*$', 1)

highlight gitMergeConflictEnd                  guifg=Orange      guibg=Red
call matchadd('gitMergeConflictEnd', '^>>>>>>>.*$', 1)

" Highlight spaces at end of line:
" https://vim.fandom.com/wiki/Highlight_unwanted_spaces
highlight extraWhitespace                                        guibg=Red
call matchadd('extraWhitespace', '/^\s*\t\s*\|\s\+\%#\@<!$', 1)
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

" TTT text files.
au! Syntax cooptttfile source ~/.config/nvim/syntax/cooptttfile.vim
au BufRead,BufNewFile tau.cc.* set filetype=cooptttfile

" Log4j files.
au! Syntax log4j source ~/.config/nvim/syntax/log4j.vim
au BufRead,BufNewFile *.log set filetype=log4j

" Rundeck log files.
au! Syntax runlog source ~/.config/nvim/syntax/runlog.vim
au BufRead,BufNewFile ALLREAD*.txt set filetype=runlog
au BufRead,BufNewFile ALLKewill*.txt set filetype=runlog

" }}}

" Abbreviations and Snippets {{{1

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

" Auto Commands, e.g source init.vim {{{1

" Auto reload my init.vim file.
" autocmd! bufwritepost ~/.config/nvim/init.vim source ~/.config/nvim/init.vim | echo "Reloaded my init.vim"

" Disable some things on the dashboard.
autocmd! Filetype * if &ft=="dashboard"| highlight longLine NONE |endif | autocmd WinLeave <buffer> highlight longLine guibg=#AA3333
autocmd! Filetype * if &ft=="dashboard"| highlight extraWhitespace NONE |endif | autocmd WinLeave <buffer> highlight extraWhitespace guibg=Red
" }}}

