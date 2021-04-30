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
![LunarVim Demo](./utils/media/demo.png)
<!-- }}}1 -->

<!-- Table Of Contents -->
<!-- {{{1 -->
- [Intro](#intro)
- [Links](#links)
- [Key Bindings](#key-bindings)
<!-- }}}1 -->

# Intro {{{1
This is a fork of the *brilliant* configuration project [LunarVim](https://github.com/ChristianChiarulli/LunarVim) by [Christian Chiarulli](https://twitter.com/intent/follow?screen_name=chrisatmachine).
I've just added some of my preferences and "vimisms" I prefer.  The main changes are:

- My config for GalaxyLine.
- My dashboard.
- Custom Keybindings.
# }}}1

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
# }}}1

# Key Bindings {{{1
- <F1> Help, open this page.
- <F2> Toggle space red colour at end of line.
- <F3> Toggle space highlight.
- <F4> Open left file menu.
- <F5> Terminal only open URL.
- <F6> Line wrap toggle.
- <F7>
- <F8>
- <F9> 
- <F10> New terminal in Kitty in new tab.
- <F11> Toggle right tagbar.
- <F12> Toggle ranger.
# }}}1

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
# }}}1

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
# }}}1

# Marks {{{1

- mx Toggle mark 'x'
- 'x Goto to mark 'x'
- m<space> Remove all marks.
- m/ Display marks.
# }}}1

# Folds {{{1
- za Toggle a fold at the cursor.
- zo Opens folds.
- zc Closes fold.
- zR Open all folds. Reveal.
- zM Close all folds. Mask.
- zj Moves to the next fold.
- zk Moves to the previous fold.
# }}}1

# Changing case {{{1
- g\~\~ Togglecase line.
- guu Lowercase line.
- gUU Uppercase line.
- g~ + movement Togglecase.
- gu + movement Lowercase.
- gU + movement Uppercase.
- Title Case regex

# :s/\<\(\w\)\(\w\*\)\>/\u\1\L\2/g
# }}}1

# Increment a value {{{1
- Ctrl+a increment value under cursor.
- Ctrl+x deccrement value under cursor.

:let i=1 | g/foo/s//\=i/ | let i=i+1
:let i=1 | g/foo/s//\="morestuff".i."morestuff"/ | let i=i+1
# }}}1

# Block editing {{{1
- Ctrl+q Start column mode
- Select the columns and rows where you want to enter your text, shift and move with keyboard ('''Do not use the mouse to select the block!''')
- Shift + i to go into insert mode in column mode
- Type in the text you want to enter. Don't be discouraged by the fact that only the first row is changed.
- Esc to apply your change (or alternately Ctrl+c)
# }}}1

# Formatting {{{1
- [http://tech.zhenhua.info/2009/01/text-formatting-in-vim.html]
- gq current line format to 80j
- :%!par
- :%!par j1w80
- :[range]ce[nter] [width] center lines :.,+3 center 80
- :[range] ri[ght] [right edge] right alignment :% right
- :[range] le[ft] [indent] left alignment.(Unit of identation is space) :% left 4
# }}}1
