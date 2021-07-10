" Useful Links and TODO {{{1
" https://github.com/Kethku/neovide
" http://cheat.sh
" Buffer bar info: https://github.com/romgrk/barbar.nvim

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
          let projectPath = matchstr(wordUnderCursor, '[0-9a-zA-Z-]\{3,}/[0-9a-z-A-Z\.]\{3,}')

          " Is it a GitHub project?
          if projectPath != ""
              let url="https://github.com/" . projectPath
              silent exec ':!xdg-open "'.url.'"' | redraw!
              echo "Opened GitHub project : ".projectPath
          else
              let jiraTicket = matchstr(wordUnderCursor, '[a-zA-Z]\{2,4}-[0-9]\{1,7}')

              " Is it a Jira ticket number project?
              if jiraTicket != ""
                  exec ':!$HOME/bin/Jira open '.jiraTicket
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

" Use Jira command line tool to show info for current ticket (if under cursor)
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

function! ToggleColourLineTooLong()
    if &colorcolumn == 0
        set colorcolumn=80,120
        highlight longLine                          guibg=#5F3F3F
    else
        set colorcolumn=0
        highlight longLine        NONE
    endif
endfunction

function! ToggleColourWhiteSpaceAtEndOfLine()
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
    call ToggleColourLineTooLong()
    call ToggleColourWhiteSpaceAtEndOfLine()
    call ToggleColourGitBlame()
    call ToggleColourIncSearch()
    set spell!
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

" Highlight a column in CSV text.
" See: https://vim.fandom.com/wiki/Working_with_CSV_files
" :Csv 1    " highlight first column
" :Csv 12   " highlight twelfth column
" :Csv 0    " switch off highlight
highlight CsvColHeading guifg=Yellow guibg=Black
function! CSVH(colnr)
  if a:colnr > 1
    let n = a:colnr - 1

    execute 'match CsvColHeading /^\([^,]*,\)\{'.n.'}\zs[^,]*/'
    " execute 'match CsvColHighlight /^\([^,|\t]*[,|\t]\)\{'.n.'}\zs[^,|\t]*/'
    execute 'normal! 0'.n.'f,'
    execute 'syntax match csvHeading /\%1l\%(\%("\zs\%([^"]\|""\)*\ze"\)\|\%(\zs[^,"]*\ze\)\)/'
    execute 'highlight csvHeading guifg=Yellow guibg=Black gui=bold'
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

function FullScreenToggle()
    let g:neovide_fullscreen=!g:neovide_fullscreen
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

" Highlight column in CSV
command! -nargs=1 Csv :call CSVH(<args>)

" SQL and Java flipping.
vnoremap <A-s> :!$HOME/bin/sak sqlflip<CR>

" Run macro q with just typing Q.
nnoremap Q @q

" Toggle comment and move to next line, or comment selection.
nmap <C-_> :CommentToggle<CR>j
vmap <C-_> :CommentToggle<CR>gv
" In Neovide use this line instead!
nmap <C-/> :CommentToggle<CR>j
vmap <C-/> :CommentToggle<CR>gv

" Move lines up and down using alt-up/down.
nnoremap <A-Up> :m .-2<CR>==
nnoremap <A-Down> :m .+1<CR>==
inoremap <A-Up> <Esc>:m .-2<CR>==gi
inoremap <A-Down> <Esc>:m .+1<CR>==gi
vnoremap <A-Up> :m '<-2<CR>gv=gv
vnoremap <A-Down> :m '>+1<CR>gv=gv

" Jump
nmap gj :call JumpToSelection()<CR>

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
" Diff current buffer and the next.
map <F7> :vsplit<CR>:bnext<CR>:windo diffthis<CR>
map <F8> :LazyGit<CR>
map <F9> :Telescope find_files<CR>
" F10 reserved for kitty, open new terminal.
" F11 reserved for kitty, full screen.
map <F12> :SymbolsOutline<CR>

" Keep X as delete backwards, rather then close buffer, I prefer to use :bd
" FIXME: WHY! nunmap X not working!
" nunmap X

" }}}

" Settings {{{1

" For Ranger, for some reason does not work in the lua config.
let g:rnvimr_enable_ex = 1
let g:rnvimr_enable_picker = 1
let g:rnvimr_draw_border = 1
let g:rnvimr_hide_gitignore = 1
let g:rnvimr_border_attr = {'fg': 7, 'bg': -1}
let g:rnvimr_enable_bw = 1

let bufferline = get(g:, 'bufferline', {})
let bufferline.icons="both"
let bufferline.icon_close_tab_modified=''
let bufferline.icon_custom_colors="false"

let g:github_enterprise_urls = ['https://bitbucket.org']
let g:startify_session_dir=['~/.config/nvim/sessions']
let g:neovide_cursor_animation_length=0
let g:neovide_fullscreen=v:true

" If running diff two or more files then....
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
    set list               " Do not display whitespace
endif

syntax enable              " Enables syntax highlighting
set iskeyword+=-           " Treat dash separated words as a word text object"
set formatoptions-=cro     " Stop newline continuation of comments
set hidden                 " Required to keep multiple buffers open multiple buffers
set encoding=utf-8         " The encoding displayed
set pumheight=10           " Makes pop-up menu smaller
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
set number relativenumber  " Line numbers and relative numbers
set cursorline             " Enable highlighting of the current line
set background=dark        " tell Vim what the background colour looks like
set showtabline=2          " Always show tabs
set noshowmode             " We don't need to see things like -- INSERT -- anymore
set nobackup               " This is recommended by various posts
set nowritebackup          " This is recommended by various posts
set shortmess+=c           " Don't pass messages to |ins-completion-menu|.
set signcolumn=yes         " Always show, otherwise it would shift the text each time
set updatetime=300         " Faster completion
set timeoutlen=750         " By default this is 1000 ms
set incsearch              " Highlight all matches
set foldenable             " Folding enabled
set foldmethod=marker      " Folding method, based on { { {1
set clipboard=unnamedplus  " Copy paste between Vim and everything else
set guifont=SauceCodePro\ Nerd\ Font\ Mono:h15
set ignorecase             " When searching ignore case of words.

" Setup spelling
set spell
setlocal spell spelllang=en_gb
set spellfile=~/bin/dictionary.add

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
hi javaTSVariable  guifg=#CEDF99

" Show white space characters
set listchars=eol:¶,tab:»\ ,trail:·,extends:>,precedes:<,space:·
highlight NonText                                        gui=bold guifg=#49494F
highlight Whitespace                                     gui=bold guifg=#49494F

" Highlight cursor line/column
set colorcolumn=80,120
highlight ColorColumn                          guifg=#ffffff     guibg=#3A3A3A
set cursorcolumn
highlight CursorColumn                         guifg=#ffffff     guibg=#483d8b
highlight CursorLine                                             guibg=#605555

" Selected area colour
highlight Visual                  gui=bold     guifg=#ffffff     guibg=#1B51a3

" Search hit colour, also the colour of selection when yanked!
highlight Search                  gui=bold     guifg=Black       guibg=Cyan

" Spelling
highlight SpellBad   guisp=Red    gui=undercurl guifg=NONE
highlight SpellLocal guisp=Orange gui=NONE      guifg=NONE
highlight SpellCap   guisp=Pink   gui=NONE      guifg=NONE
highlight SpellRare  guisp=Yellow gui=NONE      guifg=NONE

" Pop-up and Float menu
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
highlight default link gitblame GitSignsCurrentLineBlame

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

" LSP highlight in left margin.
highlight LspDiagnosticsSignError              guifg=#F44747     guibg=Gray19
highlight LspDiagnosticsSignWarning            guifg=#FF8800     guibg=Gray19
highlight LspDiagnosticsSignInformation        guifg=#FFCC66     guibg=Gray19
highlight LspDiagnosticsSignHint               guifg=#4FC1FF     guibg=Gray19

" LSP In-line error highlight.
highlight LspDiagnosticsUnderlineError         guifg=Black       guibg=#F44747
highlight LspDiagnosticsUnderlineWarning       guifg=Black       guibg=#FF8800
highlight LspDiagnosticsUnderlineInformation   guifg=Black       guibg=#FFCC66
highlight LspDiagnosticsUnderlineHint          guifg=Black       guibg=#4FC1FF

" LSP error on right side.
highlight LspDiagnosticsVirtualTextError       guifg=#F44747
highlight LspDiagnosticsVirtualTextWarning     guifg=#FF8800
highlight LspDiagnosticsVirtualTextInformation guifg=#FFCC66
highlight LspDiagnosticsVirtualTextHint        guifg=#4FC1FF

" Matching parenthesis
highlight MatchParen           gui=bold        guifg=Black       guibg=Cyan

" Highlight text over 120 chars
highlight longLine                                               NONE
call matchadd('longLine', '.\%>121v', 1)

" Highlight git merge conflict markers.
highlight gitMergeConflictStart                guifg=Black       guibg=Red
call matchadd('gitMergeConflictStart', '^<\{7\} HEAD.*$', 60)

highlight gitMergeConflictMid                  guifg=Yellow      guibg=Red
call matchadd('gitMergeConflictMid', '^=\{7\}$', 60)

highlight gitMergeConflictEnd                  guifg=Black       guibg=Red
call matchadd('gitMergeConflictEnd', '^>\{7\} .*$', 60)

" Highlight spaces at end of line:
" https://vim.fandom.com/wiki/Highlight_unwanted_spaces
highlight extraWhitespace                                        guibg=Red
call matchadd('extraWhitespace', '/^\s*\t\s*\|\s\+\%#\@<!$', 100)

" Highlight #! lines... Both good and bad.
highlight sheBangGood gui=bold,italic,underline guifg=#7fdf7f    guibg=NONE
call matchadd('sheBangGood', '^#!/usr/bin/env \(bash\|sh\|python3\|zsh\|groovy\|perl\)$', 20)

highlight sheBangBad                  gui=bold guifg=Red         guibg=NONE
call matchadd('sheBangBad', '^#!.*')

highlight IncSearch           NONE             guifg=#f8f893     guibg=#385f38

highlight HighlightUrl   gui=underline,bold    guifg=#0099FF     guisp=#0099FF

highlight Tag            gui=bold              guifg=Pink
highlight Todo           gui=bold              guifg=LightGreen

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

" CSV files.
au! Syntax csvfile source ~/.config/nvim/syntax/csv.vim
au BufRead,BufNewFile *.csv set filetype=csvfile
au BufRead,BufNewFile *.tsv set filetype=csvfile

" EDI files.
au! Syntax edifile source $HOME/.config/nvim/syntax/edifile.vim
au BufRead,BufNewFile *.edi set filetype=edifile
au BufRead,BufNewFile *.mdf set filetype=edifile
au BufRead,BufNewFile *.hse set filetype=edifile

" Franchise DAT files.
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

" Auto Commands, e.g. source init.vim {{{1

" Auto reload my init.vim file.
" autocmd! bufwritepost ~/.config/nvim/init.vim source ~/.config/nvim/init.vim | echo "Reloaded my init.vim"

" Disable some things on the dashboard.
autocmd! Filetype * if &ft=="dashboard"| highlight longLine NONE |endif | autocmd WinLeave <buffer> highlight longLine guibg=#5F3F3F
autocmd! Filetype * if &ft=="dashboard"| highlight extraWhitespace NONE |endif | autocmd WinLeave <buffer> highlight extraWhitespace guibg=Red

" Highlight matching words in buffer.
autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

" Remove white space on save for certain file types.
autocmd BufWrite *.py :call DeleteTrailingWhiteSpace()
autocmd BufWrite *.java :call DeleteTrailingWhiteSpace()
autocmd BufWrite * if &ft=="sh" | :call DeleteTrailingWhiteSpace() | endif
autocmd BufWrite * if &ft=="vim" | :call DeleteTrailingWhiteSpace() | endif

" I prefer -- for comments in SQL
autocmd FileType sql set commentstring=--\ %s

" Ignore CamelCase words when spell checking
fun! IgnoreCamelCaseSpell()
  syn match CamelCase /\<[A-Z][a-z]\+[A-Z].\{-}\>/ contains=@NoSpell transparent
  syn cluster Spell add=CamelCase
endfun
autocmd BufRead,BufNewFile * :call IgnoreCamelCaseSpell()

" augroup lsp
  " au!
  " au FileType java lua require('jdtls').start_or_attach({cmd = {'java-linux-ls'}})
" augroup end

" }}}

