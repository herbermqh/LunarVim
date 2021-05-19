The following are a mixture of standard key bindings and my own, which I find
useful like <kbd>Q</kbd>, <kbd>g</kbd><kbd>j</kbd>, <kbd>Alt</kbd>+<kbd>Up</kbd> etc. I've marked mine and other non-default
key-bindings with :heavy_check_mark: in the table below.

| Key     | Action  |
| ------: | :-------|
__Insert Mode__
|<kbd>ESC</kbd>|                                                               Exit insert mode|
|<kbd>i</kbd>, <kbd>a</kbd>|                                                   Insert before, after cursor|
|<kbd>I</kbd>, <kbd>A</kbd>|                                                   Insert start, end of line|
|<kbd>g</kbd><kbd>I</kbd>|                                                     Insert start of line, even before whitespace|
|<kbd>o</kbd>, <kbd>O</kbd>|                                                   Insert new line below, above|
|<kbd>g</kbd><kbd>i</kbd>|                                                     Insert at last insert point|
|<kbd>C</kbd>|                                                                 Change to end of line|
|<kbd>S</kbd>|                                                                 Substitute line|
|<kbd>s</kbd>|                                                                 Substitute character|
|<kbd>Ctrl-n</kbd>, <kbd>Ctrl-p</kbd>|                                         Complete word|
|<kbd>Ctrl-x-l</kbd>|                                                          Complete line|
|<kbd>Ctrl-d</kbd>|                                                            Deindent|
__Operators__
|<kbd>d</kbd>|                                                                 Delete/cut|
|<kbd>d</kbd><kbd>d</kbd>|                                                     Delete current line|
|<kbd>D</kbd>|                                                                 Delete to end of line|
|<kbd>x</kbd>, <kbd>X</kbd>|                                                   Delete forward, back|
|<kbd>y</kbd>|                                                                 Yank/copy|
|<kbd>y</kbd><kbd>y</kbd>|                                                     Yank current line|
|<kbd>p</kbd>, <kbd>P</kbd>|                                                   Paste before, after cursor|
|<kbd>c</kbd>|                                                                 Change|
|<kbd>u</kbd>|                                                                 Undo|
|<kbd>Ctrl-r</kbd>|                                                            Redo|
|<kbd>r</kbd>|                                                                 Replace character|
|<kbd>.</kbd>|                                                                 Repeat last operation|
|<kbd>J</kbd>|                                                                 Join with next line|
|<kbd>g</kbd><kbd>J</kbd>|                                                     Join without spaces|
|<kbd>U</kbd>|                                                                 Undo all changes to line|
|<kbd>R</kbd>|                                                                 Type over|
|<kbd>&gt;</kbd><kbd>&gt;</kbd>, <kbd>&lt;</kbd><kbd>&lt;</kbd>|               Indent, deindent|
|<kbd>=</kbd><kbd>=</kbd>|                                                     Autoindent|
|<kbd>Z</kbd><kbd>Z</kbd>|                                                     Save and close|
|<kbd>Z</kbd><kbd>Q</kbd>|                                                     Close without saving|
__Text Objects__
|<kbd>d</kbd><kbd>a</kbd><kbd>w</kbd>|                                         Delete around word|
|<kbd>c</kbd><kbd>i</kbd><kbd>s</kbd>|                                         Change in sentence|
|<kbd>d</kbd><kbd>a</kbd><kbd>p</kbd>|                                         Delete around paragraph|
|<kbd>d</kbd><kbd>t</kbd><kbd>X</kbd>|                                         Delete forward to char X|
|<kbd>y</kbd><kbd>i</kbd><kbd>"</kbd>|                                         Yank in quotes|
|<kbd>c</kbd><kbd>i</kbd><kbd>{</kbd>|                                         Change in brackets|
|<kbd>c</kbd><kbd>i</kbd><kbd>t</kbd>|       i                                 Change in tags (HTML)|
|<kbd>v</kbd><kbd>i</kbd><kbd>b</kbd>|                                         Visual in block|
|`:h text-objects`||
__Motions__
|<kbd>h</kbd>, <kbd>j</kbd>, <kbd>k</kbd>, <kbd>l</kbd>|                       Char left, down, up, right|
|<kbd>0</kbd>, <kbd>g</kbd><kbd>m</kbd>, <kbd>$|</kbd>                         Start, middle, end of line|
|<kbd>^</kbd>|                                                                 First non-white character of line|
|<kbd>Enter</kbd>|                                                             First non-white char of next line|
|<kbd>*</kbd>, <kbd>#</kbd>|                                                   Next, last word under cursor|
|<kbd>b</kbd>, <kbd>w</kbd>|                                                   Word left, right|
|<kbd>B</kbd>, <kbd>W</kbd>|                                                   Whitespaced word left, right|
|<kbd>n</kbd>, <kbd>N</kbd>|                                                   Next, previous search result|
|<kbd>f</kbd><kbd>x</kbd>, <kbd>F</kbd><kbd>x</kbd>|                           Next, previous character `x`|
|<kbd>H</kbd>, <kbd>M</kbd>, <kbd>L</kbd>|                                     Top, middle, bottom of screen|
|<kbd>z</kbd><kbd>z</kbd>, <kbd>z</kbd><kbd>t</kbd>, <kbd>z</kbd><kbd>b</kbd>| View line center, top, bottom|
|<kbd>Ctrl-f</kbd>, <kbd>Ctrl-b</kbd>|                                         Next, previous screen|
|<kbd>Ctrl-d</kbd>, <kbd>Ctrl-u</kbd>|                                         Next, previous half-screen|
|<kbd>g</kbd><kbd>g</kbd>, <kbd>G</kbd>|                                       Start, end of file|
|<kbd>g</kbd><kbd>;</kbd>, <kbd>g</kbd><kbd>,</kbd>|                           Previous, next change|
|<kbd>%</kbd>|                                                                 Matching brace|
|<kbd>{</kbd>, <kbd>}</kbd>|                                                   Next, previous empty line|
|<kbd>(</kbd>, <kbd>)</kbd>|                                                   Next, previous sentence|
|<i>n</i><kbd>G</kbd>, `:n`|                                                   Goto line number <i>n</i>|
|<i>n</i><kbd>\|</kbd>|                                                        Column <i>n</i>|
|<kbd>]</kbd><kbd>s</kbd>, <kbd>[</kbd><kbd>s</kbd>|                           Next, last misspelled|
|<kbd>g</kbd><kbd>j</kbd>|                                                     :heavy_check_mark: JUMP!  <ul> <li>If line contains a url jump to this in browser.  <li>else if line contains a hex colour, `#AABBCC`jump to that colour on [ColorHexa.com](https://www.colorhexa.com) <li>Else if line contains a github project name of the format `user/repository` then jump to this GitHub project.  <li>Else if try and open the current word in [cheat.sh](https://cheat.sh) uses the buffers language to help get the right command.  </ul>|
|<kbd>g</kbd><kbd>f</kbd>|                                                     Open file under cursor|
__Macros__
|<kbd>q</kbd><kbd>x</kbd>|                                                     Record to <i>x</i>|
|<kbd>q</kbd>|                                                                 Stop recording|
|<kbd>@</kbd><kbd>x</kbd>|                                                     Execute macro `x`|
|<kbd>@</kbd><kbd>@</kbd>|                                                     Repeat last macro|
|<kbd>q</kbd><kbd>q</kbd>|                                                     Record macro (as q), double <kbd>q</kbd> is a quick shortcut.|
|<kbd>Q</kbd>|                                                                 :heavy_check_mark: Play macro <kbd>q</kbd>, shortcut for <kbd>@q</kbd>.|
|`:%norm @x`|                                                                  Run macro @x on all lines|
|`:5,10norm @x`|                                                               Run macro @x on lines 5-10|
__Marks__
|<kbd>m</kbd><kbd>space</kbd>|                                                 Remove all marks.|
|<kbd>m</kbd><kbd>x</kbd>|                                                     Toggle mark <kbd>x</kbd>|
|<kbd>'</kbd><kbd>x</kbd>, <kbd>`</kbd><kbd>x</kbd>|                           Goto to mark <i>x</i> (a-z), '=start of line, `=end|
|<kbd>m</kbd><kbd>X</kbd>|                                                     Set GLOBAL mark <i>X</i> (A-Z)|
|`:Telescope marks`|                                                           List marks, select and jump|
|`:marks`|                                                                     List marks|
|`:'x,'y s/foo/bar/g`|                                                         Replace between marks <i>x</i> and <i>y</i>|
|`:'<,'> s/foo/bar/g`|                                                         Replace between selected text|
__Surround__
|<kbd>c</kbd><kbd>s</kbd><kbd>"</kbd><kbd>'</kbd>|                             :heavy_check_mark: "aWord" to 'aWord'|
|<kbd>c</kbd><kbd>s</kbd><kbd>'</kbd><kbd>"</kbd>|                             :heavy_check_mark: 'aWord' to "aWord"|
|<kbd>c</kbd><kbd>s</kbd><kbd>'</kbd><kbd>&lt;</kbd><kbd>q</kbd><kbd>&gt;</kbd>|`:heavy_check_mark: 'aWord' to &lt;q&gt;aWord&lt;/q&gt;|
|<kbd>d</kbd><kbd>s</kbd><kbd>'</kbd>|                                         :heavy_check_mark: 'aWord' to aWord|
|<kbd>y</kbd><kbd>s</kbd><kbd>i</kbd><kbd>w</kbd><kbd>]</kbd>|                 :heavy_check_mark: aWord to [aWord]|
|<kbd>y</kbd><kbd>s</kbd><kbd>s</kbd><kbd>)</kbd>|                             :heavy_check_mark: Whole-Line to (Whole-Line)|
|<kbd>y</kbd><kbd>s</kbd><kbd>s</kbd><kbd>"</kbd>|                             :heavy_check_mark: Whole-Line to "Whole-Line"|
__Command Mode__
|`:10,20 d`|                                                                   Delete line 10 to 20|
|`:'x,'y d`|                                                                   Delete mark x to y|
|`:'<,'> d`|                                                                   Delete selection|
|`:'<,'>w new.txt`|                                                            Write selection to new file|
|`:ls` (or `:buffers`)|                                                        List buffers|
|`:changes`|                                                                   Show changes|
|`:map`|                                                                       Show custom key mappings|
|`:reg`|                                                                       Show register contents|
|`:history`|                                                                   Show command history|
|`:jumps`|                                                                     Show jump list|
|`/foo`|                                                                       Search <i>foo</i> forward|
|`?foo`|                                                                       Search <i>foo</i> backward|
|`:%s/foo\(\d\+\)/bar\1/gic`|                                                  Replace all, ignore case, confirm each. Note backreference and escaped parens.|
|`:s/foo/bar/gI`|                                                              Replace all on current line, mind case|
|`:s/\%Vfoo/bar/g`|                                                            Match only within visual selection with \%V|
|&amp;`|                                                                       Repeat last :s|
__File Commands__
|`:e file`|                                                                    Open <i>file</i>|
|`:enew`|                                                                      New file|
|`:e .`|                                                                       Explore dir|
|`:e sftp://me@example.com/myfile`|                                            Open sftp|
|`:e!`|                                                                        Revert to saved|
|`:w <i>file</i>`|                                                             Save <i>file</i>|
|`:wq`|                                                                        Save, close|
|`:q!`|                                                                        Close, don't save|
|`:qa`|                                                                        Close all|
|`:qa!`|                                                                       Close all, don't save|
|`:SudoWrite`|                                                                 Eunuch : Write even if you don't have permission.|
__Options__
|`:set number`|                                                                Show line numbers|
|`:set rnu`|                                                                   Show relative line numbers|
|`:set paste`|                                                                 Autoindent off|
|`:set hlsearch`|                                                              Highlight matches|
|`:set syntax=perl`|                                                           Set syntax|
|`:set no<i>opt</i>`|                                                          Turn off <i>opt</i>|
|`:set <i>opt</i>?`|                                                           Show value of <i>opt</i>|
|`:set`|                                                                       Show current options|
|`:help options`||
__Ranges__
|`:help ranges`||
|`:5,10d`|                                                                     delete lines 5–10|
|`:*d`|                                                                        delete last VISUAL selection|
|`:.,.+10`|                                                                    delete current and next 10 lines|
|`:/foo/+1d`|                                                                  delete line after next line containing <i>foo</i>|
|`:.,'td`|                                                                     delete current line to mark <i>t</i>|
__Visual Mode And Selection__
|<kbd>v</kbd>|                                                                 Enter visual mode|
|<kbd>V</kbd>|                                                                 Enter line-wise visual mode|
|<kbd>Ctrl-v</kbd>|                                                            Visual block-wise mode|
|<kbd>I</kbd>, <kbd>A</kbd>, <kbd>x</kbd>|                                     Prepend, append, delete block selection|
|<kbd>&lt;</kbd>, <kbd>&gt;</kbd>|                                             Indent selection|
|<kbd>g</kbd><kbd>g</kbd><kbd>V</kbd><kbd>G</kbd>|                             Select all|
|<kbd>=</kbd>|                                                                 Auto format selected|
|<kbd>g</kbd><kbd>v</kbd>|                                                     Re-select visual area|
|<kbd>v</kbd><kbd>i</kbd><kbd>p</kbd>|                                         Select paragraph|
__Buffers and Windows__
|<kbd>tab</kbd>, <kbd>shift</kbd>+<kbd>tab</kbd>, <kbd>b</kbd><kbd>d</kbd>|    Buffer next, previous, delete (close).|
|`:sp, :vsp`|                                                                  Split view horizontal, vertical|
|<kbd>Ctrl-w</kbd> <kbd>Ctrl-w</kbd>|                                          Move cursor viewport|
|<kbd>Ctrl-w</kbd> <kbd>q</kbd>|                                               Close viewport|
|<kbd>Ctrl-w</kbd> <span class="font2">[</span>-+=_<span class="font2">]</span>|          Resize viewport|
|`:bufdo <i>%s/foo/bar</i>`|                                                   Do to all buffers|
__Folding__
|&lt;<kbd>F2</kbd>&gt;|                                                        Cycle through fold methods|
|`:set foldmethod=manual`|                                                     or syntax, indent, etc.|
|`:[range]fold`|                                                               Create fold on range or selection|
|<kbd>z</kbd><kbd>f</kbd>[move]|                                               Create fold|
|<kbd>z</kbd><kbd>a</kbd>|                                                     Toggle fold|
|<kbd>z</kbd><kbd>o</kbd>|                                                     Open fold|
|<kbd>z</kbd><kbd>c</kbd>|                                                     Close fold|
|<kbd>z</kbd><kbd>d</kbd>|                                                     Delete this fold|
|<kbd>z</kbd><kbd>E</kbd>|                                                     Delete all folds|
|<kbd>z</kbd><kbd>R</kbd>|                                                     Fold open|
|<kbd>z</kbd><kbd>M</kbd>|                                                     Fold collapse|
|`:help folding`||
__Help__
|`:h <i>topic</i>`|                                                            Help on <i>topic</i>|
|`:h quickref`|                                                                Quick reference|
|<kbd>Ctrl-</kbd>]|                                                            Follow help link|
|<kbd>Ctrl-t</kbd>|                                                            Back to previous|
__Formatting__
|`:help formatoptions`||
|`:set textwidth=80`|                                                          My default|
|`:set formatprg=par\ -w79`|                                                   Format using paragraph to at most 79 chars|
|<kbd>g</kbd><kbd>q</kbd>{motion}|                                             like gqip to format around paragraph|
|<kbd>Ctrl-w</kbd>|                                                            does a gqip|
__Commenting__
|<kbd>Ctrl</kbd>+<kbd>/</kbd>|                                                 :heavy_check_mark: (un)Comment a line and move to the next.<br/> - I've tweaked the commenter to comment the currentline (or uncomment) and then move to the next.  <br/> - I find this really handy!|
__Moving a Line__
|<kbd>Alt</kbd>+<kbd>Up</kbd>|                                                 :heavy_check_mark: Move current line up.|
|<kbd>Alt</kbd>+<kbd>Down</kbd>|                                               :heavy_check_mark: Move current line down.|
__Changing case__
<kbd>|~|</kbd>                                                                 Change case|
|<kbd>g</kbd><kbd>U</kbd><kbd>U</kbd>, <kbd>g</kbd><kbd>u</kbd><kbd>u</kbd>, <kbd>g</kbd><kbd>~</kbd><kbd>~</kbd>|Upper, lower, flip case whole line|
|<kbd>g</kbd><kbd>~</kbd><kbd>{movement}</kbd>|                                Togglecase, movement is <kbd>w</kbd> or <kbd>}</kbd> etc.|
|<kbd>g</kbd><kbd>u</kbd><kbd>{movement}</kbd>|                                Lowercase|
|<kbd>g</kbd><kbd>U</kbd><kbd>{movement}</kbd>|                                Uppercase|
|`:s/\<\(\w\)\(\w\*\)\>/\u\1\L\2/g`|                                           Title Case regex|
__Increment/Dec a value__
|<kbd>Ctrl</kbd>+<kbd>a</kbd>|                                                 Increment value under cursor by 1.  Also works with Dates/times....|
|<kbd>Ctrl</kbd>+<kbd>x</kbd>|                                                 Decrement value under cursor by 1.<br/>`:let i=1 \| g/foo/s//\=i/ \| let i=i+1`<br/>`:let i=1 \| g/foo/s//\="morestuff".i."morestuff"/ \| let i=i+1`|
__Formatting__
|<kbd>g</kbd><kbd>g</kbd><kbd>=</kbd><kbd>G</kbd>|                             auto (re)indent entire document.|
|<kbd>=</kbd>|                                                                 (re)indent the text on the current line or on the area selected (SUPER).|
|<kbd>=</kbd><kbd>%</kbd>|                                                     (re)indent the current braces { ... }.|
|`:%!par`|                                                                     Format range, in this case whole doument.|
|`:%!par j1w80`|                                                               Format range to j1w80.|
|<kbd>Ctrl</kbd>+<kbd>w</kbd>|                                                 :heavy_check_mark: Wrap, quick format current paragraph.|
|`:[range]ce[nter] [width]`|                                                   center lines `:.,+3 center 80`|
|`:[range] ri[ght] [right edge]`|                                              right alignment `:% right`|
|`:[range] le[ft] [indent]`|                                                   left alignment.(Unit of identation is space) `:% left 4`|
__Function Keys__
|<kbd>F1</kbd>|                                                                :heavy_check_mark: Help, open this page|
|<kbd>F2</kbd>|                                                                :heavy_check_mark: Cycle through different folding methods.|
|<kbd>F3</kbd>|                                                                :heavy_check_mark: Toggle most visual items.|
|<kbd>F4</kbd>|                                                                :heavy_check_mark: Open left file menu|
|<kbd>F9</kbd>|                                                                :heavy_check_mark: Open Telescope|
|<kbd>F10</kbd>|                                                               :heavy_check_mark: Kitty command - New terminal in new tab|
|<kbd>F11</kbd>|                                                               :heavy_check_mark: Toggle right tagbar|
|<kbd>F12</kbd>|                                                               :heavy_check_mark: Toggle ranger|
__Miscellaneous__
|`:set number!`|                                                               Toggle line numbers.|
|`:set relativenumber!`|                                                       Toggle relative line numbers.|
|`:set ft={markdown\|java\|...}`|                                              Set file type.|
|`:set ff={unix\|html\|dos}`|                                                  Set file format.|
|`:set syntax?`|                                                               Syntax type.|
|<kbd>z</kbd><kbd>=|</kbd>                                                     suggest spelling|
|<kbd>z</kbd><kbd>g</kbd>, <kbd>z</kbd><kbd>u</kbd><kbd>g</kbd>|               Add to dict, undo add|
|<kbd>Ctrl-a</kbd>|                                                            Increment number under cursor|
|<kbd>Ctrl-x</kbd>|                                                            Decrement number under cursor|
|<kbd>c</kbd><kbd>i</kbd><span class="font2">[</span><i>)"}</i><span class="font2">]</span>|         Delete inside ()/"/{} and insert|
|`:[range]w !{cmd}`|                                                           Execute cmd with range as stdin, like <code>:w !sbcl</code> or <code>:'&lt;,'&gt;w !python</code>|
|<kbd>g</kbd> <kbd>Ctrl-g</kbd>|                                               Word count|
|<kbd>g</kbd<kbd>>?|</kbd>                                                     Rot 13|
|`:ce <i>80</i>`|                                                              Center line <i>columns</i>|
|`:r !date`|                                                                   Insert external command output (e.g. date)|
|`:%! <i>filter</i>`|                                                          Filter whole file|
|`:\|<i>filter</i>`|                                                           Same as above|
|`:'&lt;,'&gt;! <i>filter</i>`|                                                Filter visual selection|
|`:'&lt;,'&gt;! sort`|                                                         Example of above|
|`:ab <i>lw LongWord</i>`|                                                     Abbreviate <i>LongWord</i>|
|`:una lw`|                                                                    Unset abbreviation|
|`:%s/pattern//gn`|                                                            Count matches|
|`:so ~/.vimrc`|                                                               Reload .vimrc|
|`:[range]g[lobal]/<i>pattern</i>/[command]`|                                  Run the Ex command on all lines in [range] matching <i>pattern</i>|
|`:[9,20]g/^/d A`|                                                             Delete lines 9–20.
|`:g/foobar/y A`|                                                              Yank all lines matching <i>foobar</i> into copy buffer|
|`:g/^Foo/norm <i>0xxxBar</i>`|                                                norm runs commands as if you typed them|
|`:v/<i>pattern</i>/[command]`|                                                Like :g but finds NON-matching lines|
|<kbd>Ctrl</kbd>+<kbd>l</kbd>|                                                 :heavy_check_mark: Redraws the screen and removes any search highlighting|
|<kbd>Ctrl</kbd>+<kbd>s</kbd>|                                                 :heavy_check_mark: Save the current file.|
|<kbd>g</kbd><kbd>r</kbd>|                                                     :heavy_check_mark: Run line under cursor in shell, **USE WITH CARE!**|
|<kbd>Alt</kbd>+<kbd>r</kbd>|                                                  :heavy_check_mark: Run the current file.|
|<kbd>Alt</kbd>+<kbd>e</kbd>|                                                  :heavy_check_mark: Make the current file executable `chmod a+x file`<br/>The Eunuch plugin also makes files starting with `#!` executable.|
|<kbd>d</kbd><kbd>t</kbd><kbd>char</kbd>|                                      Delete to `char`.|
|<kbd>d</kbd><kbd>^</kbd>|                                                     Delete to start of line.|
|<kbd>D</kbd>|                                                                 Delete to end of line.|
|`:ascii` or <kbd>g</kbd><kbd>a</kbd>|                                         Ascii, octal val of char under cursor.|
|<kbd>c</kbd><kbd>a</kbd><kbd>t</kbd>, <kbd>c</kbd><kbd>i</kbd><kbd>t</kbd>|   etc for change insert tags etc.|
|<kbd>c</kbd><kbd>i</kbd><kbd>'</kbd>, <kbd>c</kbd><kbd>a</kbd><kbd>(</kbd>, <kbd>c</kbd><kbd>i</kbd><kbd>{</kbd>|Change stuff in between ' (also works for ", [, (, {)|
|<kbd>c</kbd><kbd>c</kbd>|                                                     Change current line.|
|<kbd>c</kbd><kbd>f</kbd><kbd>char</kbd>|                                      Change to `char` (any char).|
|<kbd>g</kbd><kbd>d</kbd>|                                                     Goto definition.|

