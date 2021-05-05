```
   _..._
 .'   (_`.    _                         __     ___
:  .      :  | |   _   _ _ __   __ _ _ _\ \   / (_)_ __ ___
:)    ()  :  | |  | | | | '_ \ / _` | '__\ \ / /| | '_ ` _ \
`.   .   .'  | |__| |_| | | | | (_| | |   \ V / | | | | | | |
  `-...-'    |_____\__,_|_| |_|\__,_|_|    \_/  |_|_| |_| |_|
```

<!-- Christian Information -->
<!-- {{{1 -->
[![GitHub license](https://img.shields.io/github/license/ChristianChiarulli/LunarVim)](https://github.com/ChristianChiarulli/LunarVim/blob/master/LICENSE)
[![Open Source? Yes!](https://badgen.net/badge/Open%20Source%20%3F/Yes%21/blue?icon=github)](https://github.com/ChristianChiarulli/lunarvim)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)
<a href="https://patreon.com/chrisatmachine" title="Donate to this project using Patreon"><img src="https://img.shields.io/badge/patreon-donate-yellow.svg" alt="Patreon donate button" /></a>
<a href="https://twitter.com/intent/follow?screen_name=chrisatmachine"><img src="https://img.shields.io/twitter/follow/chrisatmachine?style=social&logo=twitter" alt="follow on Twitter"></a>
<!-- }}}1 -->

<!-- Main Image -->
<!-- {{{1 -->
![LunarVim](./utils/media/demoScreen.png)
<!-- }}}1 -->

<!-- Introduction -->
<!-- {{{1 -->

This is a fork of the **brilliant** configuration project
[LunarVim](https://github.com/ChristianChiarulli/LunarVim) by [Christian
Chiarulli](https://twitter.com/intent/follow?screen_name=chrisatmachine).
I've been using VI on and off as my daily editor since the early 1990's and
Christian's setup is the best I've seen so I've just plagiarized it and added a
few of my own twists.

The main changes are documented below:

- My config for GalaxyLine.
- My dashboard.
- Custom Keybindings.
- Custom Colours.

Most of my configuration is contained in `user.vim`.

I intend to merge Christian's changes into my config regularly to keep up with
his brilliant work.

<!-- }}}1 -->

# Contents
<!-- {{{1 -->
- [Visual Appearance](#visual-appearance)
- [Galaxy Line](#galaxy-line)
- [Extra Plugins](#extra-plugins)
- [Key Bindings](#key-bindings)
- [Some Useful Links](#some-useful-links)
<!-- }}}1 -->

# Visual Appearance
<!-- {{{1 -->
![Visual Appearance](./utils/media/VisualAppearance.png)
- I use zenburn theme.  One of the reasons for this is that its available in virtually
  any plugin/app/program that allows themeing, so I can near consistent code themeing
  everywhere.
- I've added vertical markers at 80 and 120 characters.
  - Galaxy line displays the current column and line length, these change colour at 80 and 120 characters.
- The current cursor line is highlighted in red, #870000
- The current cursor column is highlighted in light blue, #483d8b.
- Whitspace at the end of a line in highlighted in bright Red.
- Margin:
  - Current line number is highlighted in Yellow.
  - Relative line numbers are shown in RoyalBlue1.
  - Markers are shown.
  - Git changes are shown.
  - Folding marks are also shown in the margin.
<!-- }}}1 -->

# Galaxy line
<!-- {{{1 -->
The Galaxy line configuration can be found [here](https://github.com/jimcornmell/LunarVim/blob/master/lua/lv-galaxyline/init.lua).
This image shows what is in the different sections.

![Galaxy Line](./utils/media/GalaxyLine.svg)

The line is split into 5 main sections, 3 on the left and 2 on the right:

- On the left:
  - VIM Mode is colour coded, see the init.lua for details
  - Git information
  - LSP information
- On the right:
  - File information
  - Position information
<!-- }}}1 -->

# Extra Plugins
<!-- {{{1 -->
I've added a few extra plugins I use to the configuration:

- [NVim Colorizer](https://github.com/norcalli/nvim-colorizer.lua)
  - A high-performance color highlighter for Neovim which has no external dependencies! Written in performant Luajit.
- [Vim Signature](https://github.com/kshenoy/vim-signature)
  - A plugin to place, toggle and display marks.
- [Tagbar](https://github.com/preservim/tagbar)
  - A plugin that provides an easy way to browse the tags of the current file and get an overview of the files structure.
  - Opened with <kbd>F11</kbd>
- [Vim Eunuch](https://github.com/tpope/vim-eunuch)
  - Vim sugar for the UNIX shell commands that need it the most.
- [Vim Surround](https://github.com/tpope/vim-surround)
  - Surround.vim is all about "surroundings": parentheses, brackets, quotes,
    XML tags, and more. The plugin provides mappings to easily delete, change and add such surroundings in pairs.
<!-- }}}1 -->

# Key Bindings
<!-- {{{1 -->

The following are a mixture of stadard key bindings and my own, which I find
useful like <kbd>Q</kbd>, <kbd>g</kbd><kbd>j</kbd>, <kbd>Alt</kbd>+<kbd>Up</kbd> etc. I've marked mine and other non-default
key-bindings with "B" in the table below.

Key                   | (B)espke or (I)nternal | Action
------------------------------- | - | -------------------------------
<kbd>Ctrl</kbd>+<kbd>l</kbd>    | B | Redraws the screen and removes any search highlighting
<kbd>Ctrl</kbd>+<kbd>s</kbd>    | B | Save the current file.
<kbd>g</kbd><kbd>r</kbd>        | B | Run line under cursor in shell, **USE WITH CARE!**
<kbd>Alt</kbd>+<kbd>r</kbd>     | B | Run the current file.
<kbd>Alt</kbd>+<kbd>e</kbd>     | B | Make the current file executable `chmod a+x file`
__Macros__
<kbd>q</kbd><kbd>q</kbd>        | I | Record macro (as q), you can use `qa` to record to `a` but double q is a quick shortcut.
<kbd>q</kbd>                    | I | Quit recording current macro.
<kbd>Q</kbd>                    | B | Play macro q, shortcut for `@q`.
__Jump__
<kbd>g</kbd><kbd>j</kbd>        | B | If line contains a url jump to this in browser.<br/> - Else if line contains a hex colour, `#AABBCC`jump to that colour on [ColorHexa.com](https://www.colorhexa.com)<br/>- Else if line contains a github project name of the format  `user/repository` then jump to this GitHub project.<br/>- Else if try and open the current word in [cheat.sh](https://cheat.sh) uses the buffers language to help get the right command.
__Commenting__
<kbd>Ctrl</kbd>+<kbd>/</kbd>             | B | (un)Comment a line and move to the next.<br/> - I've tweaked the commenter to comment the currentline (or uncomment) and then move to the next.  <br/> - I find this really handy!
__Moving Line__
<kbd>Alt</kbd>+<kbd>Up</kbd>             | B | Move current line up.
<kbd>Alt</kbd>+<kbd>Down</kbd>           | B | Move current line down.
__Changing case__
<kbd>g</kbd><kbd>\~</kbd><kbd>\~</kbd>                  | I | Togglecase line
<kbd>g</kbd><kbd>u</kbd><kbd>u</kbd>                  | I | Lowercase line
<kbd>g</kbd><kbd>U</kbd><kbd>U</kbd>                  | I | Uppercase line
<kbd>g</kbd><kbd>~</kbd><kbd>movement</kbd>         | I | Togglecase, movement is <kbd>w</kbd> or <kbd>}</kbd> etc.
<kbd>g</kbd><kbd>u</kbd><kbd>movement</kbd>         | I | Lowercase
<kbd>g</kbd><kbd>U</kbd><kbd>movement</kbd>         | I | Uppercase
&nbsp;                          | &nbsp; | Title Case regex `:s/\<\(\w\)\(\w\*\)\>/\u\1\L\2/g`
__Marks__
<kbd>m</kbd><kbd>/</kbd>                   | I | Display marks.
<kbd>m</kbd><kbd>space</kbd>             | I | Remove all marks.
<kbd>m</kbd><kbd>x</kbd>                   | I | Toggle mark 'x'
<kbd>'</kbd><kbd>x</kbd>                   | I | Goto to mark 'x'
__Increment a value__
<kbd>Ctrl</kbd>+<kbd>a</kbd>             | I | Increment value under cursor by 1.
<kbd>Ctrl</kbd>+<kbd>x</kbd>             | I | Decrement value under cursor by 1.<br/>`:let i=1 \| g/foo/s//\=i/ \| let i=i+1`<br/>`:let i=1 \| g/foo/s//\="morestuff".i."morestuff"/ \| let i=i+1`
__Other misc commands__
<kbd>d</kbd><kbd>t</kbd><kbd>char</kbd>             | I | Delete to `char`.
<kbd>d</kbd><kbd>^</kbd>                   | I | Delete to start of line.
<kbd>D</kbd>                   | I | Delete to end of line.
<kbd>g</kbd><kbd>a</kbd>                   | I | Ascii, octal val of char under cursor.
<kbd>c</kbd><kbd>a</kbd><kbd>t</kbd>, <kbd>c</kbd><kbd>i</kbd><kbd>t</kbd>           | I | etc for change insert tags etc.
<kbd>c</kbd><kbd>i</kbd><kbd>'</kbd>, <kbd>c</kbd><kbd>a</kbd><kbd>(</kbd>, <kbd>c</kbd><kbd>i</kbd><kbd>{</kbd>      | I | Change stuff in between ' (also works for ", [, (, {).
<kbd>c</kbd><kbd>c</kbd>                   | I | Change current line.
<kbd>c</kbd><kbd>f</kbd><kbd>char</kbd>             | I | Change to `char` (any char).
<kbd>tab</kbd>, <kbd>shift</kbd>+<kbd>tab</kbd>, <kbd>b</kbd><kbd>d</kbd>    | I | Buffer next, previous, delete (close).
<kbd>g</kbd><kbd>d</kbd>                   | I | Goto definition.
__Formatting__
<kbd>g</kbd><kbd>g</kbd><kbd>=</kbd><kbd>G</kbd>                 | I | auto (re)indent entire document.
<kbd>=</kbd>                    | I | (re)indent the text on the current line or on the area selected (SUPER).
<kbd>=</kbd><kbd>%</kbd>                   | I | (re)indent the current braces { ... }.
`:%!par`        | I | Format range, in this case whole doument.
`:%!par j1w80`         | I | Format range to j1w80.
<kbd>Ctrl</kbd>+<kbd>w</kbd>             | B | Wrap, quick format current paragraph.
&nbsp;                          | &nbsp; | `:[range]ce[nter] [width] center lines :.,+3 center 80`
&nbsp;                          | &nbsp; | `:[range] ri[ght] [right edge] right alignment :% right`
&nbsp;                          | &nbsp; | `:[range] le[ft] [indent] left alignment.(Unit of identation is space) :% left 4`
__Block editing__
<kbd>Ctrl</kbd>+<kbd>q</kbd>    | I | Start column mode<br/>Select the columns and rows where you want to enter your text, shift and move with keyboard ('''Do not use the mouse to select the block!''')
<kbd>I</kbd>                    | I | To go into insert mode in column mode.<br/>Type in the text you want to enter. Don't be discouraged by the fact that only the first row is changed.
<kbd>Esc</kbd>                  | I | To apply your change (or alternately <kbd>Ctrl</kbd>+<kbd>c</kbd>)
__Function Keys__
<kbd>F1</kbd>                   | B | Help, open this page
<kbd>F2</kbd>                   | B | Toggle highlighting whitespace at end of line
<kbd>F3</kbd>                   | B | Toggle whitespace highlight
<kbd>F4</kbd>                   | B | Open left file menu
<kbd>F5</kbd>                   | B | Special binding for kitty, not used in vim
<kbd>F6</kbd>                   | B | Toggle line wrap
<kbd>F7</kbd>                   | B | Toggle spell check highlighting
<kbd>F8</kbd>                   | &nbsp; | Not defined
<kbd>F9</kbd>                   | B | Open Telescope
<kbd>F10</kbd>                  | B | New terminal in Kitty in new tab
<kbd>F11</kbd>                  | B | Toggle right tagbar
<kbd>F12</kbd>                  | B | Toggle ranger
__Misc commands__
`:set number!`                  | I | Toggle line numbers.
`:set ft={markdown\|java\|...}` | I | Set file type.
`:set ff={unix\|html\|dos}`     | I | Set file format.
`:set syntax?`                  | I | Syntax type.
<!-- }}}1 -->

# Some Useful Links
<!-- {{{1 -->
- [NeoVim](https://neovim.io)
- [LunarVim](https://github.com/ChristianChiarulli/LunarVim)
- [Vim Sheet](http://vimsheet.com)
- [Vim Cheatsheet](https://www.cheatsheet.wtf/vim/)
- [Quick ref](http://tnerual.eriogerg.free.fr/vimqrc.html)
- [Cheatsheet](https://paulgorman.org/technical/vim.html)
- [100 Essential commands](https://catswhocode.com/vim-commands/)
- [Vim tutorial](https://www.openvim.com/)
- [Vim cookbook](http://www.oualline.com/vim-cook.html)
<!-- }}}1 -->
