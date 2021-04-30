# Links {{{1

- Quick ref: http://tnerual.eriogerg.free.fr/vimqrc.html
- Vim tutorial: https://www.openvim.com/
- Vim cookbook: http://www.oualline.com/vim-cook.html
- Cheatsheet: https://paulgorman.org/technical/vim.html
- 100 Essential commands: https://catswhocode.com/vim-commands/

Check Health
:checkhealth rnvimr

ranger
ueberzug
ripgrep
pynvim
neovim-remote

# Function keys {{{1

- <F1> Help.
- <F2> Toggle space red colour at end of line.
- <F3> Toggle space highlight.
- <F4> Syntax highlight toggle.
- <F5> Terminal only open URL.
- <F6> Line wrap toggle.
- <F7>
- <F8>
- <F9> New terminal in Kitty to right.
- <F10> New terminal in Kitty in new tab.
- <F12> Toggle spelling.

# Misc commands {{{1

- Control+w wrap
- Control+h Open this screen.
- Control+f Open nerd tree file manager, I to toggle dot files.
- Control+Space Code completion.

- cat, cit etc for change insert tags etc.
- ci' ca( ci{ Change stuff in between ' (also works for ", [, (, {).
- cc Change current line.
- dt<char> Delete to "char", d\$ or D to end of line, d0 to start.
- cf<char> Change to "char" (any char).
- qq, q, Q Macro, start record, end record and play.
- #!ba for file header with hash bang.
- set number! Toggle line numbers.
- set ft={unix|html|dos} Set file type.
- set syntax? Syntax type.
- bn, bp, bd buffer next, previous, delete (close).

# G commands {{{1

- gJ Join without space.
- gx : gf open url/file in new window/buffer.
- ga Ascii, octal val.
- gd Goto definition.
- gq Format/justify paragraph. With par command.
- gy type-definition.
- gi implementation.
- gr Show references.
- K Show documentation.
- ggg?G rot13 whole file.
- Alt-a,Alt-x increment, decrement next number on same line as the cursor.
- = (re)indent the text on the current line or on the area selected (SUPER).
- =% (re)indent the current braces { ... }.
- gg=G auto (re)indent entire document.

# Marks {{{1

- mx Toggle mark 'x'
- 'x Goto to mark 'x'
- m<space> Remove all marks.
- m/ Display marks.

# Folds {{{1

- za Toggle a fold at the cursor.
- zo Opens folds.
- zc Closes fold.
- zR Open all folds. Reveal.
- zM Close all folds. Mask.
- zj Moves to the next fold.
- zk Moves to the previous fold.

# Changing case {{{1

- g\~\~ Togglecase line.
- guu Lowercase line.
- gUU Uppercase line.
- g~ + movement Togglecase.
- gu + movement Lowercase.
- gU + movement Uppercase.
- Title Case regex

# :s/\<\(\w\)\(\w\*\)\>/\u\1\L\2/g

# Increment a value {{{1

- Ctrl+a increment value under cursor.
- Ctrl+x deccrement value under cursor.

:let i=1 | g/foo/s//\=i/ | let i=i+1
:let i=1 | g/foo/s//\="morestuff".i."morestuff"/ | let i=i+1

# Block editing {{{1

- Ctrl+q Start column mode
- Select the columns and rows where you want to enter your text, shift and move with keyboard ('''Do not use the mouse to select the block!''')
- Shift + i to go into insert mode in column mode
- Type in the text you want to enter. Don't be discouraged by the fact that only the first row is changed.
- Esc to apply your change (or alternately Ctrl+c)

# Formatting {{{1

- [http://tech.zhenhua.info/2009/01/text-formatting-in-vim.html]
- gq current line format to 80j
- :%!par
- :%!par j1w80
- :[range]ce[nter] [width] center lines :.,+3 center 80
- :[range] ri[ght] [right edge] right alignment :% right
- :[range] le[ft] [indent] left alignment.(Unit of identation is space) :% left 4
