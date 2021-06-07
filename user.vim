" Useful Links and TODO {{{1
" https://github.com/Kethku/neovide
" http://cheat.sh
" Buffer bar info: https://github.com/romgrk/barbar.nvim

" TODO: Tidy galaxyline code.
" TODO: LSP Perl
" TODO: LSP Java
" TODO: LSP JavaScript
" TODO: LSP React
" TODO: LSP PHP

" }}}

" Functions {{{1

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

" Jump, looks under the cursor for a URL, Hex Code, GithubProject or Word!
function! JumpToSelection()
  let url=matchstr(expand("<cWORD>"), 'http[s]*:\/\/[^ >,;)]*')
  " let url=matchstr(expand("<cWORD>"), 'https\?:\/\/\(\w\+\(:\w\+\)\?@\)\?\([A-Za-z][-_0-9A-Za-z]*\.\)\{1,}\(\w\{2,}\.\?\)\{1,}\(:[0-9]\{1,5}\)\?\S*/')
  " let url=matchstr(expand("<cWORD>"), 'https\?:\/\/\(\w\+\(:\w\+\)\?@\)\?\([A-Za-z][-_0-9A-Za-z]*\.\)\{1,}\(\w\{2,}\.\?\)\{1,}\(:[0-9]\{1,5}\)\?\S*/')

  " Is it a url?
  if url != ""
      silent exec ":!xdg-open '".url."'" | redraw!
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
          let projectPath = matchstr(wordUnderCursor, '[0-9a-zA-Z]\{3,}/[0-9a-z-A-Z\.]\{3,}')

          " Is it a github project?
          if projectPath != ""
              let url="https://github.com/" . projectPath
              silent exec ':!xdg-open "'.url.'"' | redraw!
              echo "Opened GitHub project : ".projectPath
          else
              let jiraTicket = matchstr(wordUnderCursor, '[a-zA-Z]\{2,4}-[0-9]\{1,7}')

              " Is it a Jira ticket number project?
              if jiraTicket != ""
                  exec ':!$HOME/bin/Jira open '.jiraTicket
                  " silent exec ':~/bin/Jira open '.jiraTicket
                  " echo "Opened Jira ticket: ".jiraTicket
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
  endif
endfunction

" Use jira command line tool to show info for current ticket (if under curdor)
" or branch for current project file is in.
function! ShowJira()
    let wordUnderCursor = expand("<cWORD>")
    let jiraTicket = matchstr(wordUnderCursor, '[a-zA-Z]\{2,4}-[0-9]\{1,7}')

    if jiraTicket != ""
        let $TICKET=jiraTicket
        term $HOME/bin/Jira show $TICKET
    else
        term $HOME/bin/Jira show
    endif
endfunction

function! OpenHelpPage()
  let s:help_word = expand('<cword>')
  :exe ":help " . s:help_word
endfunction

" function! OpenManualPage()
  " let s:wordUnderCursor = expand("<cWORD>")
  " let $MANPG=s:wordUnderCursor
  " term colored man $MANPG
  " :exe ":wincmd n"
  " :exe ":r!man " . s:man_word . " | col -b"
  " :exe ":goto"
  " :exe ":delete"
" endfunction

function! ToggleColourCursorLine()
    if &cursorline
        set nocursorline
    else
        set cursorline
        highlight CursorLine                        guibg=#605555
    endif
endfunction

function! ToggleColourCursorColumn()
    if &cursorcolumn
        set nocursorcolumn
    else
        set cursorcolumn
        highlight CursorColumn    guifg=#ffffff     guibg=#483d8b
    endif
endfunction

function! ToggleColourColumn()
    if &colorcolumn == 0
        set colorcolumn=80,120
    else
        set colorcolumn=0
    endif
endfunction

function! ToggleColourLongLine()
    if synIDattr(hlID("longLine"), "bg", "gui") == "#5F3F3F"
        highlight longLine        NONE
    else
        highlight longLine                          guibg=#5F3F3F
    endif
endfunction

function! ToggleColourWhiteSpace()
    if synIDattr(hlID("extraWhitespace"), "bg", "gui") == "Red"
        highlight extraWhitespace NONE
    else
        highlight extraWhitespace                   guibg=Red
    endif
endfunction

let s:blameline=1
function! ToggleColourGitBlame()
    if s:blameline
        let s:blameline=0
    else
        let s:blameline=1
    endif
    Gitsigns toggle_current_line_blame
endfunction

function! ToggleColourSyntax()
    if exists("g:syntax_on")
        syntax off
    else
        syntax enable
    endif
endfunction

function! ToggleColourIncSearch()
    if synIDattr(hlID("IncSearch"), "bg", "gui") == "#385f38"
        highlight IncSearch NONE
    else
        highlight IncSearch                            guifg=#f8f893     guibg=#385f38
    endif
endfunction

function! ToggleGutter()
    if &foldcolumn == 1
        set foldcolumn=0
        set nonumber
        set norelativenumber
        Gitsigns detach
    else
        set foldcolumn=1
        set number
        highlight LineNr          guifg=RoyalBlue1  guibg=Gray19
        set relativenumber
        highlight CursorLineNr    guifg=Yellow      guibg=Gray19
        Gitsigns attach
    endif
endfunction

function ToggleAll()
    call ToggleColourCursorColumn()
    call ToggleColourColumn()
    call ToggleColourLongLine()
    call ToggleColourWhiteSpace()
    call ToggleColourGitBlame()
    call ToggleColourIncSearch()
    set list!
    set foldenable!
    highlight markerStart NONE
    highlight markerEnd NONE
endfunction

" Delete whitespace at end of lines, and put cursor back to where it started.
function! DeleteTrailingWhiteSpace()
    let current_position=getpos(".")
    let reg=@/
    %s/\s*$//
    let @/=reg
    unlet reg
    call setpos('.', current_position)
    unlet current_position
endfunction

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

function FoldingToggle()
    if &foldmethod == 'diff'
        if &foldenable == 1
            set foldenable!
            echo "Folding switched off"
            highlight markerStart              NONE
            highlight markerEnd                NONE
        else
            highlight markerStart              guifg=#777777     guibg=#000000
            highlight markerEnd                guifg=#777777     guibg=#000000
            set foldenable
            set foldmethod=manual
            echo "Folding method set to Manual"
        endif
    elseif &foldmethod == 'manual'
        set foldenable
        set foldmethod=indent
        echo "Folding method set to Indent"
    elseif &foldmethod == 'indent'
        set foldenable
        set foldmethod=marker
        echo "Folding method set to Marker"
    elseif &foldmethod == 'marker'
        set foldenable
        set foldmethod=syntax
        echo "Folding method set to Syntax"
    elseif &foldmethod == 'syntax'
        set foldenable
        set foldmethod=diff
        echo "Folding method set to Diff"
    endif
endfunction

" }}}1

" Key mappings {{{1

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" <Ctrl-c> and yy copies to clipboard, paste with <shift-insert>
vmap <C-c> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
vmap yy    y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>

" Make current file executable using Eunuch.
map <silent> <A-e> :Chmod a+x<CR>:echo "File is now executable!"<CR>

" Execute current file, line and vim command.
map <silent> <A-r> :w<CR>:!%:p<CR>
nmap gr :call ExecuteCurrentLine()<CR>
nmap gt :exe getline('.')<CR>

" gq to format selection as 80 char justified.
" set formatoptions q
set formatprg=par\ -w79
map gw gqip

noremap <silent> gs :call DeleteTrailingWhiteSpace()<CR>

" Saves a few key presses.
" nnoremap ; :
map <C-s> :w<CR>

" Highlight column in csv
command! -nargs=1 Csv :call CSVH(<args>)

" Sql and Java flipping.
vnoremap <A-s> :!$HOME/bin/sak sqlflip<CR>

" Run macro q with just typing Q.
nnoremap Q @q

" Toggle comment and move to next line, or comment selection.
nmap <C-_> :CommentToggle<CR>j
vmap <C-_> :CommentToggle<CR>gv
" In neovide use this line instead!
nmap <C-/> :CommentToggle<CR>j
vmap <C-/> :CommentToggle<CR>gv

" Move lines up and down using alt-up/down.
nnoremap <A-Up> :m .-2<CR>==
nnoremap <A-Down> :m .+1<CR>==
inoremap <A-Up> <Esc>:m .-2<CR>==gi
inoremap <A-Down> <Esc>:m .+1<CR>==gi
vnoremap <A-Up> :m '<-2<CR>gv=gv
vnoremap <A-Down> :m '>+1<CR>gv=gv

" Jump : TODO: Add description to which key.
nmap gj :call JumpToSelection()<CR>
noremap <silent> <leader>jj :call JumpToSelection()<CR>
noremap <silent> <leader>jr :silent exec "!jump Repo %:p:h"<CR>
noremap <silent> <leader>jt :silent exec "!jump Ticket %:p:h"<CR>
noremap <silent> <leader>ja :silent exec "!jump Artifact %:p:h"<CR>
noremap <silent> <leader>jn :silent exec "!jump Notes %:p:h"<CR>
noremap <silent> <leader>jc :silent exec "!jump Ci %:p:h"<CR>
noremap <silent> <leader>jl :silent exec "!jump Lint %:p:h"<CR>
noremap <silent> <leader>jh :call OpenHelpPage()<CR>
noremap <silent> <leader>jm :<C-U>exe "Man" v:count "<C-R><C-W>"<CR>
noremap <silent> <leader>ji :silent exec "!jump Live %:p:h"<CR>
noremap <silent> <leader>je :silent exec "!jump TestReports %:p:h"<CR>
noremap <silent> <leader>js :call ShowJira()<CR>

" Toggle various visual items. : TODO: Add description to which key.
noremap <silent> <leader>t1 :call ToggleColourCursorLine()<CR>
noremap <silent> <leader>t2 :call ToggleColourCursorColumn()<CR>
noremap <silent> <leader>t3 :call ToggleColourColumn()<CR>
noremap <silent> <leader>t4 :call ToggleColourLongLine()<CR>
noremap <silent> <leader>t5 :call ToggleColourWhiteSpace()<CR>
noremap <silent> <leader>t6 :ColorizerToggle<CR>
noremap <silent> <leader>t7 :set list!<CR>
noremap <silent> <leader>t8 :call ToggleColourGitBlame()<CR>
noremap <silent> <leader>t9 :set wrap!<CR>
noremap <silent> <leader>t0 :call ToggleColourSyntax()<CR>
noremap <silent> <leader>ti :call ToggleColourIncSearch()<CR>
noremap <silent> <leader>tu :call ToggleGutter()<CR>
noremap <silent> <leader>ta :call ToggleAll()<CR>

" Function keys.
map <silent> <F1> :!xdg-open $HOME/.config/nvim/cheatsheet.html<CR>
map <silent> <F2> :call FoldingToggle()<CR>
map <silent> <F3> :call ToggleAll()<CR>
map <F4> :NvimTreeToggle<CR>
" F5 reserved for kitty, open selected.
" Use to replace last :s command on a range
" * = last range.
" & = last s/foo/bar/
map <F6> :*&<CR>
map <F9> :Telescope find_files<CR>
" F10 reserved for kitty, open new terminal.
map <F11> :TagbarToggle<CR>
map <F12> :RnvimrToggle<CR>

" Keep X as delete backwards, rather then close buffer, I prefer to use :bd
nunmap X

" }}}

" Settings {{{1

:Gitsigns toggle_current_line_blame

let g:github_enterprise_urls = ['https://bitbucket.org']
let g:startify_session_dir=['~/.config/nvim/sessions']
let bufferline.icons="both"
let bufferline.icon_custom_colors="true"
let bufferline.icon_close_tab_modified=''

" If diffing two or more files then....
" See: https://neovim.io/doc/user/options.html
if &diff
    set diffopt+=algorithm:patience
    set diffopt+=indent-heuristic
    let g:diff_translations=0 " Speed up syntax
    set syntax=diff
    set wrap               " Lines wrap to following lines"
    set nolist             " Do not display whitespace
else
    set nowrap             " Display long lines as just one line
    set list               " Display whitespace
endif

syntax enable              " Enables syntax highlighing
set iskeyword+=-           " Treat dash separated words as a word text object"
set formatoptions-=cro     " Stop newline continution of comments
set hidden                 " Required to keep multiple buffers open multiple buffers
set encoding=utf-8         " The encoding displayed
set pumheight=10           " Makes popup menu smaller
set fileencoding=utf-8     " The encoding written to file
set ruler                  " Show the cursor position all the time
set cmdheight=2            " More space for displaying messages
set mouse=a                " Enable the mouse
set splitbelow             " Horizontal splits will automatically be below
set splitright             " Vertical splits will automatically be to the right
set t_Co=256               " Support 256 colors
set conceallevel=0         " So that I can see `` in markdown files
set tabstop=4              " Insert 4 spaces for a tab
set softtabstop=0          " Disable soft tabs
set shiftwidth=4           " Change the number of space chars inserted for indentation
set smarttab               " Makes tabbing smarter will realize you have 2 vs 4
set expandtab              " Converts tabs to spaces
set smartindent            " Makes indenting smart
set autoindent             " Good auto indent
set laststatus=2           " Always display the status line
set number relativenumber  " Line numbers and relativenumbers
set cursorline             " Enable highlighting of the current line
set background=dark        " tell vim what the background color looks like
set showtabline=2          " Always show tabs
set noshowmode             " We don't need to see things like -- INSERT -- anymore
set nobackup               " This is recommended by coc
" set textwidth=80           " Set text width to 80
set nowritebackup          " This is recommended by coc
set shortmess+=c           " Don't pass messages to |ins-completion-menu|.
set signcolumn=yes         " Always show, otherwise it would shift the text each time
set updatetime=300         " Faster completion
set timeoutlen=750         " By default timeoutlen is 1000 ms
set incsearch              " Highlight all matches
set foldenable             " Folding enabled
set foldmethod=marker      " Folding method, based on { { {1
set clipboard=unnamedplus  " Copy paste between vim and everything else
set guifont=SauceCodePro\ Nerd\ Font\ Mono:h15

" }}}

" Visual and Colours {{{1

set termguicolors

" Use zenburn colour scheme, but make some minor tweaks.
let g:zenburn_italic_Comment=1
colorscheme zenburn
" Tweaks to zenburn...
hi Boolean         guifg=#bfbfbf                              ctermfg=181
hi Character       guifg=#a3aca3 gui=bold                     ctermfg=181 cterm=bold
hi Constant        guifg=#a3dcdc gui=NONE                     ctermfg=181 cterm=bold
hi SpecialChar     guifg=#a3a3dc gui=bold                     ctermfg=181 cterm=bold
hi String          guifg=#53BB83                              ctermfg=174
hi Tag             guifg=#93e893 gui=bold                     ctermfg=181 cterm=bold

" Show whitespace characters
set listchars=eol:¶,tab:»-,trail:·,extends:>,precedes:<,space:·
"
"Highligh cursor line/column
set colorcolumn=80,120
highlight ColorColumn                          guifg=#ffffff     guibg=#3A3A3A
set cursorcolumn
highlight CursorColumn                         guifg=#ffffff     guibg=#483d8b
highlight CursorLine                                             guibg=#605555

" Selection line colours
highlight Visual                                                 guibg=Grey35

" Search hit colour
highlight Search                               guifg=Wheat       guibg=Peru

" Popup and Float menu
highlight Pmenu                                guifg=Wheat       guibg=#332000
highlight PmenuSbar                                              guibg=Gray35
highlight PmenuThumb                                             guibg=Wheat
highlight PmenuSel                    gui=bold guifg=Black       guibg=Wheat
highlight NormalFloat                 gui=NONE guifg=Gold        guibg=Black

" Line number colour
highlight LineNr                               guifg=RoyalBlue1  guibg=Gray19
highlight CursorLineNr                         guifg=Yellow      guibg=Gray19

" Diff colours : http://vimdoc.sourceforge.net/htmldoc/diff.html
highlight DiffAdd                              guifg=#999999     guibg=#115511
highlight DiffChange                                             guibg=#222266
highlight DiffDelete                           guifg=#552222     guibg=#552222
highlight DiffText                             guifg=#CC2222     guibg=#222266

" Git changes and margins
highlight GitSignsAdd                          guifg=#608b4e     guibg=#608b4e
highlight GitSignsDelete                       guifg=#d16969     guibg=#343434
highlight GitSignsChange                       guifg=#5497cf     guibg=#5497cf
highlight GitSignsCurrentLineBlame             guifg=Black       guibg=#605555

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
highlight LspDiagnosticsDefaultError           guifg=#F44747
highlight LspDiagnosticsDefaultWarning         guifg=#FF8800
highlight LspDiagnosticsDefaultInformation     guifg=#FFCC66
highlight LspDiagnosticsDefaultHint            guifg=#4FC1FF

highlight LspDiagnosticsFloatingError          guifg=#F44747
highlight LspDiagnosticsFloatingWarning        guifg=#FF8800
highlight LspDiagnosticsFloatingWarn           guifg=#FF8800
highlight LspDiagnosticsFloatingInformation    guifg=#FFCC66
highlight LspDiagnosticsFloatingInfor          guifg=#FFCC66
highlight LspDiagnosticsFloatingHint           guifg=#4FC1FF

" Lsp highlight in left margin.
highlight LspDiagnosticsSignError              guifg=#F44747     guibg=Gray19
highlight LspDiagnosticsSignWarning            guifg=#FF8800     guibg=Gray19
highlight LspDiagnosticsSignInformation        guifg=#FFCC66     guibg=Gray19
highlight LspDiagnosticsSignHint               guifg=#4FC1FF     guibg=Gray19

" Lsp Inline error highlight.
highlight LspDiagnosticsUnderlineError         guifg=Black       guibg=#F44747
highlight LspDiagnosticsUnderlineWarning       guifg=Black       guibg=#FF8800
highlight LspDiagnosticsUnderlineInformation   guifg=Black       guibg=#FFCC66
highlight LspDiagnosticsUnderlineHint          guifg=Black       guibg=#4FC1FF

" Lsp error on right side.
highlight LspDiagnosticsVirtualTextError       guifg=#F44747
highlight LspDiagnosticsVirtualTextWarning     guifg=#FF8800
highlight LspDiagnosticsVirtualTextInformation guifg=#FFCC66
highlight LspDiagnosticsVirtualTextHint        guifg=#4FC1FF

" Matching parenthesis
highlight MatchParen           gui=bold        guifg=Black       guibg=Cyan

" Highlight text over 120 chars
highlight longLine                                               guibg=#5F3F3F
call matchadd('longLine', '.\%>121v', 1)

" Highlight git merge conflict markers.
highlight gitMergeConflictStart                guifg=DarkGreen   guibg=Red
call matchadd('gitMergeConflictStart', '^<<<<<<< HEAD.*$', 30)

highlight gitMergeConflictMid                  guifg=DarkBlue    guibg=Red
call matchadd('gitMergeConflictMid', '^=======.*$', 30)

highlight gitMergeConflictEnd                  guifg=Orange      guibg=Red
call matchadd('gitMergeConflictEnd', '^>>>>>>>.*$', 30)

" Highlight spaces at end of line:
" https://vim.fandom.com/wiki/Highlight_unwanted_spaces
highlight extraWhitespace                                        guibg=Red
call matchadd('extraWhitespace', '/^\s*\t\s*\|\s\+\%#\@<!$', 100)

" Highlight #! lines... Both good and bad.
highlight sheBangGood gui=bold,italic,underline guifg=#7fdf7f    guibg=NONE
call matchadd('sheBangGood', '^#!/usr/bin/env \(bash\|sh\|python3\|zsh\)$', 20)

highlight sheBangBad                  gui=bold guifg=Red         guibg=NONE
call matchadd('sheBangBad', '^#!.*')

highlight IncSearch           NONE             guifg=#f8f893     guibg=#385f38

highlight HighlightUrl        gui=underline    guifg=#54b5fa

" highlight Tag                 gui=bold         guifg=White
highlight Todo                gui=bold         guifg=LightGreen

" Highlight folds
highlight Folded                               guifg=#777777     guibg=#000000
set foldcolumn=1

" Highlight markers.
highlight markerStart                          guifg=#777777     guibg=#000000
highlight markerEnd                            guifg=#777777     guibg=#000000
call matchadd('markerStart', '^.*{\{3\}.*$', 50)
call matchadd('markerEnd', '^.*}\{3\}.*$', 50)

" Highlight my marker lines
highlight markerLineCommentAmber               guifg=#000000     guibg=#999900
call matchadd('markerLineCommentAmber', '^.*\.\{5,\}$', 50)
highlight markerLineCommentGreen               guifg=#000000     guibg=#009900
call matchadd('markerLineCommentGreen', '^.*-\{5,\}$', 50)
highlight markerLineCommentRed                 guifg=#000000     guibg=#990000
call matchadd('markerLineCommentRed',   '^.*=\{5,\}$', 50)
" }}}1

" Syntax files {{{1

"  Auddis!
au! Syntax auddis source ~/.config/nvim/syntax/auddis.vim
au BufRead,BufNewFile *.aud set filetype=auddis
au BufRead,BufNewFile AUDDIS*.ASC set filetype=auddis

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
" }}}

" Auto Commands, e.g source init.vim {{{1

" Auto reload my init.vim file.
" autocmd! bufwritepost ~/.config/nvim/init.vim source ~/.config/nvim/init.vim | echo "Reloaded my init.vim"

" Disable some things on the dashboard.
autocmd! Filetype * if &ft=="dashboard"| highlight longLine NONE |endif | autocmd WinLeave <buffer> highlight longLine guibg=#5F3F3F
autocmd! Filetype * if &ft=="dashboard"| highlight extraWhitespace NONE |endif | autocmd WinLeave <buffer> highlight extraWhitespace guibg=Red

" Highlight matching words in buffer.
autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

" Remove whitespace on save for certain file types.
autocmd BufWrite *.py :call DeleteTrailingWhiteSpace()
autocmd BufWrite *.java :call DeleteTrailingWhiteSpace()
autocmd BufWrite * if &ft=="sh" | :call DeleteTrailingWhiteSpace() | endif
autocmd BufWrite * if &ft=="vim" | :call DeleteTrailingWhiteSpace() | endif

" I prefer -- for comments in SQL
autocmd FileType sql set commentstring=--\ %s

" }}}

