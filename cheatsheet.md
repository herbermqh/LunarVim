The following are a mixture of standard key bindings and my own, which I find
useful like <kbd>Q</kbd>, <kbd>g</kbd><kbd>j</kbd>, <kbd>Alt</kbd>+<kbd>Up</kbd> etc. I've marked mine and other non-default
key-bindings with :heavy_check_mark: in the table below.

| Key     | Action   |
| ------: | :------- |
__Insert Mode__
|ESC|                                                                          Exit insert mode|
|i, a|                                                                         Insert before, after cursor|
|I, A|                                                                         Insert start, end of line|
|gI|                                                                           Insert start of line, even before whitespace|
|o, O|                                                                         Insert new line below, above|
|gi|                                                                           Insert at last insert point|
|C|                                                                            Change to end of line|
|S|                                                                            Substitute line|
|s|                                                                            Substitute character|
|Ctrl-n, Ctrl-p|                                                               Complete word|
|Ctrl-x-l|                                                                     Complete line|
|Ctrl-d|                                                                       Deindent|
__Operators__
|d|                                                                            Delete/cut|
|dd|                                                                           Delete current line|
|D|                                                                            Delete to end of line|
|x, X|                                                                         Delete forward, back|
|y|                                                                            Yank/copy|
|yy|                                                                           Yank current line|
|p, P|                                                                         Paste before, after cursor|
|c|                                                                            Change|
|u|                                                                            Undo|
|Ctrl-r|                                                                       Redo|
|r|                                                                            Replace character|
|.|                                                                            Repeat last operation|
|J|                                                                            Join with next line|
|gJ|                                                                           Join without spaces|
|U|                                                                            Undo all changes to line|
|R|                                                                            Type over|
|&gt;&gt;, &lt;&lt;|                                                           Indent, deindent|
|==|                                                                           Autoindent|
|ZZ|                                                                           Save and close|
|ZQ|                                                                           Close without saving|
__Text Objects__
|daw|                                                                          Delete around word|
|cis|                                                                          Change in sentence|
|dap|                                                                          Delete around paragraph|
|dtX|                                                                          Delete forward to char X|
|yi"|                                                                          Yank in quotes|
|ci{|                                                                          Change in brackets|
|cit|                                                                          Change in tags (HTML)|
|vib|                                                                          Visual in block|
|:h text-objects||
__Motions__
|h, j, k, l|                                                                   Char left, down, up, right|
|0, gm, $|                                                                     Start, midule, end of line|
|^|                                                                            First non-white character of line|
|[ENTER]|                                                                      First non-white char of next line|
|*, #|                                                                         Next, last word under cursor|
|b, w|                                                                         Word left, right|
|B, W|                                                                         Whitespaced word left, right|
|n, N|                                                                         Next, previous search result|
|f<i>x</i>, F<i>x</i>|                                                         Next, previous character <i>x</i>|
|H, M, L|                                                                      Top, midule, bottom of screen|
|zz, zt, zb|                                                                   View line center, top, bottom|
|Ctrl-f, Ctrl-b|                                                               Next, previous screen|
|Ctrl-d, Ctrl-u|                                                               Next, previous half-screen|
|gg, G|                                                                        Start, end of file|
|g;, g,|                                                                       Previous, next change|
|%|                                                                            Matching brace|
|{, }|                                                                         Next, previous empty line|
|(, )|                                                                         Next, previous sentence|
|<i>n</i>G, :n|                                                                Goto line number <i>n</i>|
|<i>n</i>||                                                                    Column <i>n</i>|
|]s, [s|                                                                       Next, last misspelled|
|<kbd>g</kbd><kbd>j</kbd>|                                                     :heavy_check_mark:
JUMP!
<ul>
<li>If line contains a url jump to this in browser.
<li>else if line contains a hex colour, `#AABBCC`jump to that colour on [ColorHexa.com](https://www.colorhexa.com)
<li>Else if line contains a github project name of the format `user/repository` then jump to this GitHub project.
<li>Else if try and open the current word in [cheat.sh](https://cheat.sh) uses the buffers language to help get the right command.
</ul
|<kbd>g</kbd><kbd>f</kbd>|                                                     Open file under cursor|
__Macros__
|q<i>x</i>|                                                                    Record to <i>x</i>|
|q|                                                                            Stop recording|
|@<i>x</i>|                                                                    Execute <i>x</i>|
|@@|                                                                           Repeat last macro|
|<kbd>q</kbd><kbd>q</kbd>|                                                     Record macro (as q), double q is a quick shortcut.|
|<kbd>Q</kbd>|                                                                 :heavy_check_mark:| Play macro q, shortcut for `@q`.|
|:%norm @<i>x</i>|                                                             Run macro @x on all lines|
|:5,10norm @<i>x</i>|                                                          Run macro @x on lines 5-10|
__Marks__
|<kbd>m</kbd><kbd>space</kbd> |                                                Remove all marks.|
|<kbd>m</kbd><kbd>x</kbd>     |                                                Toggle mark <kbd>x</kbd>|
|'<i>x</i> `x|                                                                 Goto to mark <i>x</i> (a-z), '=start of line, `=end|
|m<i>X</i>|                                                                    Set GLOBAL mark <i>X</i> (A-Z)|
|:Telescope marks|                                                             List marks, select and jump|
|:marks|                                                                       List marks|
|:'<i>x</i>,'<i>y</i> s/<i>foo</i>/<i>bar</i>/g|                               Replace between marks <i>x</i> and <i>y</i>|
|:'&lt;,'&gt; s/<i>foo</i>/<i>bar</i>/g|                                       Replace between selected text|
__Surround__
|<kbd>c</kbd><kbd>s</kbd><kbd>"</kbd><kbd>'</kbd>|                             :heavy_check_mark: "aWord" to 'aWord'|
|<kbd>c</kbd><kbd>s</kbd><kbd>'</kbd><kbd>"</kbd>|                             :heavy_check_mark: 'aWord' to "aWord"|
|<kbd>c</kbd><kbd>s</kbd><kbd>'</kbd><kbd>&lt;</kbd><kbd>q</kbd><kbd>&gt;</kbd>|:heavy_check_mark: 'aWord' to &lt;q&gt;aWord&lt;/q&gt;|
|<kbd>d</kbd><kbd>s</kbd><kbd>'</kbd>|                                         :heavy_check_mark: 'aWord' to aWord|
|<kbd>y</kbd><kbd>s</kbd><kbd>i</kbd><kbd>w</kbd><kbd>]</kbd>|                 :heavy_check_mark: aWord to [aWord]|
|<kbd>y</kbd><kbd>s</kbd><kbd>s</kbd><kbd>)</kbd>|                             :heavy_check_mark: Whole-Line to (Whole-Line)|
|<kbd>y</kbd><kbd>s</kbd><kbd>s</kbd><kbd>"</kbd>|                             :heavy_check_mark: Whole-Line to "Whole-Line"|
__Command Mode__
|:10,20 d|                                                                     Delete line 10 to 20|
|:'x,'y d|                                                                     Delete mark x to y|
|:'&lt;,'&gt;w d|                                                              Delete selection|
|:'&lt;,'&gt;w new.txt|                                                        Write selection to new file|
|:ls (or :buffers)|                                                            List buffers|
|:changes|                                                                     Show changes|
|:map|                                                                         Show custom key mappings|
|:reg|                                                                         Show register contents|
|:history|                                                                     Show command history|
|:jumps|                                                                       Show jump list|
|/<i>foo</i>|                                                                  Search <i>foo</i> forward|
|?<i>foo</i>|                                                                  Search <i>foo</i> backward|
|:%s/<i>foo\(\d\+\)</i>/<i>bar\1</i>/gic|                                      Replace all, ignore case, confirm each. Note backreference and escaped parens.|
|:s/<i>foo</i>/<i>bar</i>/gI|                                                  Replace all on current line, mind case|
|:s/\%V<i>foo</i>/<i>bar</i>/g|                                                Match only within visual selection with \%V|
|&amp;|                                                                        Repeat last :s|
__File Commands__
|:e <i>file</i>|                                                               Open <i>file</i>|
|:enew|                                                                        New file|
|:e .|                                                                         Explore dir|
|:e <i>sftp://me@example.com/myfile</i>|                                       Open sftp|
|:e!|                                                                          Revert to saved|
|:w <i>file</i>|                                                               Save <i>file</i>|
|:wq|                                                                          Save, close|
|:q!|                                                                          Close, don't save|
|:qa|                                                                          Close all|
|:qa!|                                                                         Close all, don't save|
|:SudoWrite|                                                                   Eunuch : Write even if you don't have permission.|
__Options__
|:set number|                                                                  Show line numbers|
|:set rnu|                                                                     Show relative line numbers|
|:set paste|                                                                   Autoindent off|
|:set hlsearch|                                                                Highlight matches|
|:set syntax=perl|                                                             Set syntax|
|:set no<i>opt</i>|                                                            Turn off <i>opt</i>|
|:set <i>opt</i>?|                                                             Show value of <i>opt</i>|
|:help options||
|:set|                                                                         Show current options|
__Ranges__
|:help ranges||
|:5,10d|                                                                       delete lines 5–10|
|:*d|                                                                          delete last VISUAL selection|
|:.,.+10|                                                                      delete current and next 10 lines|
|:/foo/+1d|                                                                    delete line after next line containing <i>foo</i>|
|:.,'td|                                                                       delete current line to mark <i>t</i>|
__Visual Mode And Selection__
|v|                                                                            Enter visual mode|
|V|                                                                            Enter line-wise visual mode|
|Ctrl-v|                                                                       Visual block-wise mode|
|I, A, x|                                                                      Prepend, append, delete block selection|
|&lt;, &gt;|                                                                   Indent selection|
|ggVG|                                                                         Select all|
|=|                                                                            Auto format selected|
|gv|                                                                           Re-select visual area|
|vip|                                                                          Select paragraph|
__Buffers and Windows__
|<kbd>tab</kbd>, <kbd>shift</kbd>+<kbd>tab</kbd>, <kbd>b</kbd><kbd>d</kbd>|    Buffer next, previous, delete (close).|
|:sp, :vsp|                                                                    Split view horizontal, vertical|
|Ctrl-w Ctrl-w|                                                                Move cursor viewport|
|Ctrl-w q|                                                                     Close viewport|
|Ctrl-w <span class="font2">[</span>-+=_<span class="font2">]</span>|          Resize viewport|
|:bufdo <i>%s/foo/bar</i>|                                                     Do to all buffers|
__Folding__
|&lt;F2&gt;|                                                                   Cycle through fold methods|
|:set foldmethod=manual|                                                       or syntax, indent, etc.|
|:[range]fold|                                                                 Create fold on range or selection|
|zf[move]|                                                                     Create fold|
|za|                                                                           Toggle fold|
|zo|                                                                           Open fold|
|zc|                                                                           Close fold|
|zd|                                                                           Delete this fold|
|zE|                                                                           Delete all folds|
|zR|                                                                           Fold open|
|zM|                                                                           Fold collapse|
|:help folding||
__Help__
|:h <i>topic</i>|                                                              Help on <i>topic</i>|
|:h quickref|                                                                  Quick reference|
|Ctrl-]|                                                                       Follow help link|
|Ctrl-t|                                                                       Back to previous|
__Formatting__
|:help formatoptions||
|:set textwidth=80|                                                            My default|
|set formatprg=par\ -w79|                                                      Format using paragraph to at most 79 chars|
|vvVG|                                                                         Select whole file|
|gq{motion}|                                                                   like gqip to format around paragraph|
|Ctrl-w|                                                                       does a gqip|
__Commenting__
|<kbd>Ctrl</kbd>+<kbd>/</kbd> |                                                :heavy_check_mark:| (un)Comment a line and move to the next.<br/> - I've tweaked the commenter to comment the currentline (or uncomment) and then move to the next.  <br/> - I find this really handy!|
__Moving a Line__
|<kbd>Alt</kbd>+<kbd>Up</kbd> |                                                :heavy_check_mark:| Move current line up.|
|<kbd>Alt</kbd>+<kbd>Down</kbd>|                                               :heavy_check_mark:| Move current line down.|
__Changing case__
|~|                                                                            Change case|
|gUU, guu, g~~|                                                                Upper, lower, flip case whole line|
|<kbd>g</kbd><kbd>~</kbd><kbd>{movement}</kbd>|                                Togglecase, movement is <kbd>w</kbd> or <kbd>}</kbd> etc.|
|<kbd>g</kbd><kbd>u</kbd><kbd>{movement}</kbd>|                                Lowercase|
|<kbd>g</kbd><kbd>U</kbd><kbd>{movement}</kbd>|                                Uppercase|
|:s/\<\(\w\)\(\w\*\)\>/\u\1\L\2/g|                                             Title Case regex|
__Increment/Dec a value__
|<kbd>Ctrl</kbd>+<kbd>a</kbd> |                                                Increment value under cursor by 1.  Also works with Dates/times....|
|<kbd>Ctrl</kbd>+<kbd>x</kbd> |                                                Decrement value under cursor by 1.<br/>`:let i=1 \| g/foo/s//\=i/ \| let i=i+1`<br/>`:let i=1 \| g/foo/s//\="morestuff".i."morestuff"/ \| let i=i+1`|
__Formatting__
|<kbd>g</kbd><kbd>g</kbd><kbd>=</kbd><kbd>G</kbd>|                             auto (re)indent entire document.|
|<kbd>=</kbd>                 |                                                (re)indent the text on the current line or on the area selected (SUPER).|
|<kbd>=</kbd><kbd>%</kbd>     |                                                (re)indent the current braces { ... }.|
|`:%!par`                     |                                                Format range, in this case whole doument.|
|`:%!par j1w80`               |                                                Format range to j1w80.|
|<kbd>Ctrl</kbd>+<kbd>w</kbd> |                                                :heavy_check_mark:| Wrap, quick format current paragraph.|
|&nbsp;                       |                                                `:[range]ce[nter] [width] center lines :.,+3 center 80`|
|&nbsp;                       |                                                `:[range] ri[ght] [right edge] right alignment :% right`|
|&nbsp;                       |                                                `:[range] le[ft] [indent] left alignment.(Unit of identation is space) :% left 4`|
__Function Keys__
|<kbd>F1</kbd>                |                                                :heavy_check_mark: Help, open this page|
|<kbd>F2</kbd>                |                                                :heavy_check_mark: Cycle through different folding methods.|
|<kbd>F3</kbd>                |                                                :heavy_check_mark: Toggle most visual items.|
|<kbd>F4</kbd>                |                                                :heavy_check_mark: Open left file menu|
|<kbd>F9</kbd>                |                                                :heavy_check_mark: Open Telescope|
|<kbd>F10</kbd>               |                                                :heavy_check_mark: Kitty command - New terminal in new tab|
|<kbd>F11</kbd>               |                                                :heavy_check_mark: Toggle right tagbar|
|<kbd>F12</kbd>               |                                                :heavy_check_mark: Toggle ranger|
__Miscellaneous__
|`:set number!`               |                                                Toggle line numbers.|
|`:set relativenumber!`       |                                                Toggle relative line numbers.|
|`:set ft={markdown\|java\|...}`|                                              Set file type.|
|`:set ff={unix\|html\|dos}`  |                                                Set file format.|
|`:set syntax?`               |                                                Syntax type.|
|z=|                                                                           suggest spelling|
|zg, zug|                                                                      Add to dict, undo add|
|Ctrl-a|                                                                       Increment number under cursor|
|Ctrl-x|                                                                       Decrement number under cursor|
|ci<span class="font2">[</span><i>)"}</i><span class="font2">]</span>|         Delete inside ()/"/{} and insert|
|:[range]w !{cmd}|                                                             Execute cmd with range as stdin, like <code>:w !sbcl</code> or <code>:'&lt;,'&gt;w !python</code>|
|g Ctrl-g|                                                                     Word count|
|g?|                                                                           Rot 13|
|:ce <i>80</i>|                                                                Center line <i>columns</i>|
|:r !date|                                                                     Insert external command output (e.g. date)|
|:%! <i>filter</i>|                                                            Filter whole file|
|:| <i>filter</i>|                                                             Same as above|
|:'&lt;,'&gt;! <i>filter</i>|                                                  Filter visual selection|
|:'&lt;,'&gt;! sort|                                                           Example of above|
|:ab <i>lw LongWord</i>|                                                       Abbreviate <i>LongWord</i>|
|:una lw|                                                                      Unset abbreviation|
|:%s/pattern//gn|                                                              Count matches|
|:so ~/.vimrc|                                                                 Reload .vimrc|
|:[range]g[lobal]/<i>pattern</i>/[command]</dt> <dd style="font-weight:bold;">Run the Ex command on all lines in [range] matching <i>pattern</i>|
|:[9,20]g/^/d A|                                                               Delete lines 9–20.
|:g/foobar/y A|                                                                Yank all lines matching <i>foobar</i> into copy buffer|
|:g/^Foo/norm <i>0xxxBar</i>|                                                  norm runs commands as if you typed them|
|:v/<i>pattern</i>/[command]|                                                  Like :g but finds NON-matching lines|
|<kbd>Ctrl</kbd>+<kbd>l</kbd>|                                                 :heavy_check_mark: Redraws the screen and removes any search highlighting|
|<kbd>Ctrl</kbd>+<kbd>s</kbd>|                                                 :heavy_check_mark: Save the current file.|
|<kbd>g</kbd><kbd>r</kbd>|                                                     :heavy_check_mark: Run line under cursor in shell, **USE WITH CARE!**|
|<kbd>Alt</kbd>+<kbd>r</kbd>|                                                  :heavy_check_mark: Run the current file.|
|<kbd>Alt</kbd>+<kbd>e</kbd>|                                                  :heavy_check_mark: Make the current file executable `chmod a+x file`<br/>The Eunuch plugin also makes files starting with `#!` executable.|
|<kbd>d</kbd><kbd>t</kbd><kbd>char</kbd>|                                      Delete to `char`.|
|<kbd>d</kbd><kbd>^</kbd>     |                                                Delete to start of line.|
|<kbd>D</kbd>                 |                                                Delete to end of line.|
|:ascii or <kbd>g</kbd><kbd>a</kbd>|                                           Ascii, octal val of char under cursor.|
|<kbd>c</kbd><kbd>a</kbd><kbd>t</kbd>, <kbd>c</kbd><kbd>i</kbd><kbd>t</kbd>|   etc for change insert tags etc.|
|<kbd>c</kbd><kbd>i</kbd><kbd>'</kbd>, <kbd>c</kbd><kbd>a</kbd><kbd>(</kbd>, <kbd>c</kbd><kbd>i</kbd><kbd>{</kbd>|Change stuff in between ' (also works for ", [, (, {)|
|<kbd>c</kbd><kbd>c</kbd>     |                                                Change current line.|
|<kbd>c</kbd><kbd>f</kbd><kbd>char</kbd>|                                      Change to `char` (any char).|
|<kbd>g</kbd><kbd>d</kbd>     |                                                Goto definition.|

