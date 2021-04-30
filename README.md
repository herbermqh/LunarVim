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

Most of my configuration is contained in ```user.vim```.

I intend to merge Christian's changes into my config regularly to keep up with
his brilliant work.

<!-- }}}1 -->

# Contents
<!-- {{{1 -->
- [Some Useful Links](#some-useful-links)
- [Extra Plugins](#extra-plugins)
- [Key Bindings](#key-bindings)
- [Visual Appearance](#visual-appearance)
- [Galaxy Line](#galaxy-line)
- [Forgotten Commands](#forgotten-commands)
<!-- }}}1 -->

# Some Useful Links
  <!-- {{{1 -->
- [NeoVim](https://neovim.io)
- [LunarVim](https://github.com/ChristianChiarulli/LunarVim)
- [Quick ref](http://tnerual.eriogerg.free.fr/vimqrc.html)
- [Cheatsheet](https://paulgorman.org/technical/vim.html)
- [100 Essential commands](https://catswhocode.com/vim-commands/)
- [Vim tutorial](https://www.openvim.com/)
- [Vim cookbook](http://www.oualline.com/vim-cook.html)
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
  - Opened with ```<F11>```
<!-- }}}1 -->

# Key Bindings
<!-- {{{1 -->
- ```<Ctrl-w>``` Format paragraph to 80 chars.
- ```gj``` Jump
  - If line contains a url jump to this in browser.
  - If line contains a hex colour jump to that colour on [ColorHexa.com](https://www.colorhexa.com)
  - Try and open the current word in [cheat.sh](https://cheat.sh) uses the buffers language to help get the right command.
- ```<Ctrl-/>``` (un)Comment a line and move to the next.
  - I've tweaked the commenter to comment the currentline (or uncomment) and then move to the next.
  - I find this really handy!
- Moving lines up and down.
  - ```<Alt-Up>``` Move current line up.
  - ```<Alt-Down>``` Move current line down.
- ```<Ctrl-l>``` redraws the screen and removes any search highlighting.
- Function Keys
  - ```<F1>``` Help, open this page.
  - ```<F2>``` Toggle highlighting whitespace at end of line.
  - ```<F3>``` Toggle whitespace highlight.
  - ```<F4>``` Open left file menu.
  - ```<F5>``` Special binding for kitty, not used in vim.
  - ```<F6>``` Toggle line wrap.
  - ```<F7>``` Toggle spell check highlighting.
  - ```<F8>``` Not defined.
  - ```<F9>``` Open Telescope.
  - ```<F10>``` New terminal in Kitty in new tab.
  - ```<F11>``` Toggle right tagbar.
  - ```<F12>``` Toggle ranger.
- Type ```#!ba``` in normal mode and the bash file header will be inserted, also makes the file executable.
  - ```#!sh``` Shell
  - ```#!pe``` Perl
  - ```#!py``` Python
  - ```#!gr``` Groovy
  - ```#!zs``` Zsh
- ```qq```, ```q```, ```Q``` Macro, start record, end record and play.
- ```:checkhealth``` to check installation health.
<!-- }}}1 -->

# Visual Appearance
<!-- {{{1 -->
![Visual Appearance](./media/VisualAppearance.png)
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

![Galaxy Line](./media/GalaxyLine.png)

The line is split into 5 main sections, 3 on the left and 2 on the right:

- On the left:
  - VIM Mode is colour coded, see the init.lua for details
  - Git information
  - LSP information
- On the right:
  - File information
  - Position information
<!-- }}}1 -->

# Forgotten Commands
<!-- {{{1 -->
The rest of this file contains information I need to remind myself every now and
then ;-).

##  Block editing
<!-- {{{2 -->
- ```<Ctrl+q``` Start column mode
- Select the columns and rows where you want to enter your text, shift and move with keyboard ('''Do not use the mouse to select the block!''')
- ```Shift + i``` to go into insert mode in column mode
- Type in the text you want to enter. Don't be discouraged by the fact that only the first row is changed.
- ```Esc``` to apply your change (or alternately ```<Ctrl+c>```)
<!-- }}}2 -->

##  Marks
<!-- {{{2 -->
- ```m/``` Display marks.
- ```m<space>``` Remove all marks.
- ```mx``` Toggle mark 'x'
- ```'x``` Goto to mark 'x'
<!-- }}}2 -->

##  Changing case
<!-- {{{2 -->
- ```g\~\~``` Togglecase line
- ```guu``` Lowercase line
- ```gUU``` Uppercase line
- ```g~``` + movement Togglecase
- ```gu``` + movement Lowercase
- ```gU``` + movement Uppercase
- Title Case regex ```:s/\<\(\w\)\(\w\*\)\>/\u\1\L\2/g```
<!-- }}}2 -->

##  Increment a value
<!-- {{{2 -->
- Ctrl+a increment value under cursor.
- Ctrl+x deccrement value under cursor.
:let i=1 | g/foo/s//\=i/ | let i=i+1
:let i=1 | g/foo/s//\="morestuff".i."morestuff"/ | let i=i+1
<!-- }}}2 -->
<!-- }}}1 -->

# Section to complete, please ignore.
<!-- {{{1 -->
## Misc normal VIM commands I can never remember
<!-- {{{2 -->
- cat, cit etc for change insert tags etc.
- ci' ca( ci{ Change stuff in between ' (also works for ", [, (, {).
- cc Change current line.
- dt<char> Delete to "char", d\$ or D to end of line, d0 to start.
- cf<char> Change to "char" (any char).
- set number! Toggle line numbers.
- set ft={unix|html|dos} Set file type.
- set syntax? Syntax type.
- bn, bp, bd buffer next, previous, delete (close).
- ga Ascii, octal val.
- gd Goto definition.
- gr Show references.
- gg=G auto (re)indent entire document.
- = (re)indent the text on the current line or on the area selected (SUPER).
- =% (re)indent the current braces { ... }.
<!-- }}}2 -->

##  Not tested
<!-- {{{2 -->
- gx : gf open url/file in new window/buffer.
- gi implementation.
<!-- }}}2 -->

##  Formatting
<!-- {{{2 -->
- :%!par
- :%!par j1w80
- :[range]ce[nter] [width] center lines :.,+3 center 80
- :[range] ri[ght] [right edge] right alignment :% right
- :[range] le[ft] [indent] left alignment.(Unit of identation is space) :% left 4
<!-- }}}2 -->

<!-- }}}1 -->
