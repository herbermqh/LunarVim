```
   _..._
 .'   (_`.    _                         __     ___
:  .      :  | |   _   _ _ __   __ _ _ _\ \   / (_)_ __ ___
:)    ()  :  | |  | | | | '_ \ / _` | '__\ \ / /| | '_ ` _ \
`.   .   .'  | |__| |_| | | | | (_| | |   \ V / | | | | | | |
  `-...-'    |_____\__,_|_| |_|\__,_|_|    \_/  |_|_| |_| |_|
```

<!-- Sheilds -->
<!-- {{{1 -->
[![GitHub License](https://img.shields.io/github/license/jimcornmell/LunarVim)](https://github.com/jimcornmell/LunarVim/blob/master/LICENSE)
[![Open Source? Yes!](https://badgen.net/badge/Open%20Source%20%3F/Yes%21/blue?icon=github)](https://github.com/jimcornmell/lunarvim)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)
[![Web Site](https://img.shields.io/badge/Jims%20Cosmos-website-red)](https://JimsCosmos.com)
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

If your interested my website is [![Web Site](https://img.shields.io/badge/Jims%20Cosmos-website-red)](https://JimsCosmos.com)


<!-- }}}1 -->

# Contents
<!-- {{{1 -->
- [Visual Appearance](#visual-appearance)
- [Galaxy Line](#galaxy-line)
- [Extra Plugins](#extra-plugins)
- [Java LSP Install](#java-lsp-install)
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
- The current cursor line is highlighted in red, #605555
- The current cursor column is highlighted in light blue, #483d8b.
- Whitespace at the end of a line in highlighted in bright Red.
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

# Java LSP Install
<!-- {{{1 -->

Note Java is not stable at the moment but it looks like there is plenty of
activity, so I guess sometime in 2021 it will reach a tipping point.

![Java Lsp](./utils/media/JavaLsp.png)

1) Download and Install Java 11

At the time of writing 1/May/2021 you must use Java 11, __Java 16 will not
work.__ I have not investigated why, it was just simpler to follow the
instructions (and leave that research for someone who has the time).

```bash
# Download
wget https://corretto.aws/downloads/latest/amazon-corretto-11-x64-linux-jdk.tar.gz

# Untar
tar zxvf amazon-corretto-11-x64-linux-jdk.tar.gz

# Move to /opt
sudo mv amazon-corretto-11.0.11.9.1-linux-x64 /opt

# Create a nice link
sudo ln -s /opt/amazon-corretto-11.0.11.9.1-linux-x64 /opt/java-11
```

2) Setup your environment
```bash
export JAVA_HOME=/opt/java-11
export PATH=$PATH:$JAVA_HOME/bin
```

3) Install the LSP for Java

Full instructions are [here](https://github.com/eclipse/eclipse.jdt.ls) but the
condensed instructions are as follows.

4) Clone the repo and build

See [these instructions](https://github.com/mfussenegger/nvim-jdtls).
This took a while on my machine (10 minutes on Ryzen 7 3700X @ 3.600GHz)

```bash
git clone git@github.com:eclipse/eclipse.jdt.ls.git
cd eclipse.jdt.ls
./mvnw clean verify
cd ..
sudo mv eclipse.jdt.ls /opt
```

5) Create startup file
This must be and executable called `java-linux-ls` in a folder on your path.

```bash
#!/usr/bin/env bash
export JAVA_HOME="/opt/java-11"
export JAR="/opt/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/plugins/org.eclipse.equinox.launcher_*.jar"
export JDTLS_CONFIG="/opt/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/config_linux"
export WORKSPACE="$HOME/workspace"

$JAVA_HOME/bin/java \
  -Declipse.application=org.eclipse.jdt.ls.core.id1 \
  -Dosgi.bundles.defaultStartLevel=4 \
  -Declipse.product=org.eclipse.jdt.ls.core.product \
  -Dlog.protocol=true \
  -Dlog.level=ALL \
  -Xms1g \
  -Xmx2G \
  -jar           $(echo "$JAR") \
  -configuration "$JDTLS_CONFIG" \
  -data          "$WORKSPACE" \
  --add-modules=ALL-SYSTEM \
  --add-opens java.base/java.util=ALL-UNNAMED \
  --add-opens java.base/java.lang=ALL-UNNAMED
```

6) Update [`init.lua`](https://github.com/jimcornmell/LunarVim/blob/master/init.lua)
```lua
require('lsp.java-ls')
```

7) Update [`lua/plugins.lua`](https://github.com/jimcornmell/LunarVim/blob/master/lua/plugins.lua)
```lua
use {"mfussenegger/nvim-jdtls", opt = true}
require_plugin("nvim-jdtls")
```

8) Close and open LunarVim and run `:PackerSync`
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
  - Also makes files starting with `#!` executable.
- [Vim Surround](https://github.com/tpope/vim-surround)
  - Surround.vim is all about "surroundings": parentheses, brackets, quotes,
    XML tags, and more. The plugin provides mappings to easily delete, change and add such surroundings in pairs.
- [Java LSP](https://github.com/mfussenegger/nvim-jdtls)
  - See [Java LSP Install](#java-lsp-install)
<!-- }}}1 -->

# Key Bindings
<!-- {{{1 -->

The following are a mixture of stadard key bindings and my own, which I find
useful like <kbd>Q</kbd>, <kbd>g</kbd><kbd>j</kbd>, <kbd>Alt</kbd>+<kbd>Up</kbd> etc. I've marked mine and other non-default
key-bindings with :heavy_check_mark: in the table below.

    <div id="insertmode">
      <h2>Insert Mode</h2>
      <table>
        <tr><th>ESC</th> <td>Exit insert mode</td></tr>
        <tr><th>i, a</th> <td>Insert before, after cursor</td></tr>
        <tr><th>I, A</th> <td>Insert start, end of line</td></tr>
        <tr><th>gI</th> <td>Insert start of line, even before whitespace</td></tr>
        <tr><th>o, O</th> <td>Insert new line below, above</td></tr>
        <tr><th>gi</th> <td>Insert at last insert point</td></tr>
        <tr><th>C</th> <td>Change to end of line</td></tr>
        <tr><th>S</th> <td>Substitute line</td></tr>
        <tr><th>s</th> <td>Substitute character</td></tr>
        <!-- <tr><th>Ctrl-o <i>cmd</i></th> <td>Run Normal <i>cmd</i>, resume Insert</td></tr> -->
        <tr><th>Ctrl-n, Ctrl-p</th> <td>Complete word</td></tr>
        <tr><th>Ctrl-x-l</th> <td>Complete line</td></tr>
        <tr><th>Ctrl-d</th> <td>Deindent</td></tr>
        <!-- <tr><th>Ctrl-t</th> <td>Increase indent</td></tr> -->
        <!-- <tr><th>Ctrl-r-<i>x</i></th> <td>Paste register <i>x</i> contents</td></tr> -->
        <tr><th></th> <td></td></tr>
      </table>
    </div>

    <div>
      <h2 id="normalmode">Normal Mode</h2>
      <!-- <p>Construct commands like:</p> -->
      <!-- <pre style="white-space:pre-wrap;">["register][operator][count][motion]</pre> -->
    </div>

    <div id="operators">
      <h3>Operators</h3>
      <table>
        <tr><th>d</th>                  <td>Delete/cut</td></tr>
        <tr><th>dd</th>                 <td>Delete current line</td></tr>
        <tr><th>D</th>                  <td>Delete to end of line</td></tr>
        <tr><th>x, X</th>               <td>Delete forward, back</td></tr>
        <tr><th>y</th>                  <td>Yank/copy</td></tr>
        <tr><th>yy</th>                 <td>Yank current line</td></tr>
        <tr><th>p, P</th>               <td>Paste before, after cursor</td></tr>
        <tr><th>c</th>                  <td>Change</td></tr>
        <tr><th>u</th>                  <td>Undo</td></tr>
        <tr><th>Ctrl-r</th>             <td>Redo</td></tr>
        <tr><th>r</th>                  <td>Replace character</td></tr>
        <tr><th>.</th>                  <td>Repeat last operation</td></tr>
        <tr><th>J</th>                  <td>Join with next line</td></tr>
        <tr><th>gJ</th>                 <td>Join without spaces</td></tr>
        <tr><th>U</th>                  <td>Undo all changes to line</td></tr>
        <tr><th>R</th>                  <td>Type over</td></tr>
        <tr><th>&gt;&gt;, &lt;&lt;</th> <td>Indent, deindent</td></tr>
        <tr><th>==</th>                 <td>Autoindent</td></tr>
        <tr><th>ZZ</th>                 <td>Save and close</td></tr>
        <tr><th>ZQ</th>                 <td>Close without saving</td></tr>
      </table>
    </div>

    <div id="textobjects">
      <h4>Text Objects</h4>
      <table>
        <tr><th>daw</th>                <td>Delete around word</td></tr>
        <tr><th>cis</th>                <td>Change in sentence</td></tr>
        <tr><th>dap</th>                <td>Delete around paragraph</td></tr>
        <tr><th>dtX</th>                <td>Delete forward to char X</td></tr>
        <tr><th>yi"</th>                <td>Yank in quotes</td></tr>
        <tr><th>ci{</th>                <td>Change in brackets</td></tr>
        <tr><th>cit</th>                <td>Change in tags (HTML)</td></tr>
        <tr><th>vib</th>                <td>Visual in block</td></tr>
        <tr><th>:h text-objects</th>    <td></td></tr>
      </table>
    </div>

    <div id="motions">
      <h3>Motions</h3>
      <table>
        <tr><th>h, j, k, l</th>         <td>Char left, down, up, right</td></tr>
        <tr><th>0, gm, $</th>           <td>Start, midule, end of line</td></tr>
        <tr><th>^</th>                  <td>First non-white character of line</td></tr>
        <tr><th>[ENTER]</th>            <td>First non-white char of next line</td></tr>
        <tr><th>*, #</th>               <td>Next, last word under cursor</td></tr>
        <tr><th>b, w</th>               <td>Word left, right</td></tr>
        <tr><th>B, W</th>               <td>Whitespaced word left, right</td></tr>
        <tr><th>n, N</th>               <td>Next, previous search result</td></tr>
        <!-- <tr><th>ge, e</th>              <td>Word end left, right</td></tr> -->
        <!-- <tr><th>gE, E</th>              <td>Whitespaced word end left, right</td></tr> -->
        <tr><th>f<i>x</i>, F<i>x</i></th> <td>Next, previous character <i>x</i></td></tr>
        <!-- <tr><th>; ,</th>                <td>Repeat last t<i>x</i> or T<i>x</i>; comma: opposite direction</td></tr> -->
        <tr><th>H, M, L</th>            <td>Top, midule, bottom of screen</td></tr>
        <tr><th>zz, zt, zb</th>         <td>View line center, top, bottom</td></tr>
        <tr><th>Ctrl-f, Ctrl-b</th>     <td>Next, previous screen</td></tr>
        <tr><th>Ctrl-d, Ctrl-u</th>     <td>Next, previous half-screen</td></tr>
        <tr><th>gg, G</th>              <td>Start, end of file</td></tr>
        <tr><th>g;, g,</th>             <td>Previous, next change</td></tr>
        <tr><th>%</th>                  <td>Matching brace</td></tr>
        <tr><th>{, }</th>               <td>Next, previous empty line</td></tr>
        <tr><th>(, )</th>               <td>Next, previous sentence</td></tr>
        <tr><th><i>n</i>G, :n</th>      <td>Goto line number <i>n</i></td></tr>
        <tr><th><i>n</i>|</th>          <td>Column <i>n</i></td></tr>
        <tr><th>]s, [s</th>             <td>Next, last misspelled</td></tr>

        <tr><th><kbd>g</kbd><kbd>j</kbd> </th><td>:heavy_check_mark:|
        JUMP!
          <ul>
            <li>If line contains a url jump to this in browser.
            <li>else if line contains a hex colour, `#AABBCC`jump to that colour on [ColorHexa.com](https://www.colorhexa.com)
            <li>Else if line contains a github project name of the format `user/repository` then jump to this GitHub project.
            <li>Else if try and open the current word in [cheat.sh](https://cheat.sh) uses the buffers language to help get the right command.
          </ul
        </td></tr>

        <tr><th><kbd>g</kbd><kbd>f</kbd> </th><td>Open file under cursor</td></tr>
      </table>
    </div>

    <div id="Macros">
      <h4>Macros</h4>
      <table>
        <tr><th>q<i>x</i></th>          <td>Record to <i>x</i></td></tr>
        <tr><th>q</th>                  <td>Stop recording</td></tr>
        <tr><th>@<i>x</i></th>          <td>Execute <i>x</i></td></tr>
        <tr><th>@@</th>                 <td>Repeat last macro</td></tr>
        <tr><th><kbd>q</kbd><kbd>q</kbd></th><td>Record macro (as q), double q is a quick shortcut.</td></tr>
        <tr><th><kbd>Q</kbd></th>       <td>:heavy_check_mark:| Play macro q, shortcut for `@q`.</td></tr>
        <tr><th>:%norm @<i>x</i></th>   <td>Run macro @x on all lines</td></tr>
        <tr><th>:5,10norm @<i>x</i></th><td>Run macro @x on lines 5-10</td></tr>
        <!-- <tr><th>"<i>a-z</i></th>        <td>Registers <i>a-z</i></td></tr> -->
        <!-- <tr><th>"<i>0-9</i></th>        <td>Delete registers <i>0-9</i></td></tr> -->
        <!-- <tr><th>:reg</th>               <td>Show register contents</td></tr> -->
        <!-- <tr><th>Ctrl-r-<i>x</i></th>    <td>Paste <i>x</i> (Insert mode)</td></tr> -->
      </table>
    </div>

    <div id="marks">
      <h4>Marks</h4>
      <table>
        <!-- <tr><th><kbd>m</kbd><kbd>/</kbd>                     </th><td>Display marks.</td></tr> -->
        <tr><th><kbd>m</kbd><kbd>space</kbd>                 </th><td>Remove all marks.</td></tr>
        <tr><th><kbd>m</kbd><kbd>x</kbd>                     </th><td>Toggle mark <kbd>x</kbd></td></tr>
        <tr><th>'<i>x</i> `x</th>       <td>Goto to mark <i>x</i> (a-z), '=start of line, `=end</td></tr>
        <tr><th>m<i>X</i></th>          <td>Set GLOBAL mark <i>X</i> (A-Z)</td></tr>
        <tr><th>:Telescope marks</th>   <td>List marks, select and jump</td></tr>
        <tr><th>:marks</th>             <td>List marks</td></tr>
        <tr><th>:'<i>x</i>,'<i>y</i> s/<i>foo</i>/<i>bar</i>/g</th>  <td>Replace between marks <i>x</i> and <i>y</i></td></tr>
        <tr><th>:'&lt;,'&gt; s/<i>foo</i>/<i>bar</i>/g</th>          <td>Replace between selected text</td></tr>
        <!-- <tr><th>``</th>                 <td>Last jump</td></tr> -->
        <!-- <tr><th>Ctrl-o, Ctrl-i</th>     <td>Older, newer jump</td></tr> -->
      </table>
    </div>

    <div id="surround">
      <h3>Surround</h3>
      <table>
        <tr><th><kbd>c</kbd><kbd>s</kbd><kbd>"</kbd><kbd>'</kbd> </th><td>:heavy_check_mark: "aWord" to 'aWord'</td></tr>
        <tr><th><kbd>c</kbd><kbd>s</kbd><kbd>'</kbd><kbd>"</kbd> </th><td>:heavy_check_mark: 'aWord' to "aWord"</td></tr>
        <tr><th><kbd>c</kbd><kbd>s</kbd><kbd>'</kbd><kbd>&lt;</kbd><kbd>q</kbd><kbd>&gt;</kbd> </th><td>:heavy_check_mark: 'aWord' to &lt;q&gt;aWord&lt;/q&gt;</td></tr>
        <tr><th><kbd>d</kbd><kbd>s</kbd><kbd>'</kbd>             </th><td>:heavy_check_mark: 'aWord' to aWord</td></tr>
        <tr><th><kbd>y</kbd><kbd>s</kbd><kbd>i</kbd><kbd>w</kbd><kbd>]</kbd> </th><td>:heavy_check_mark: aWord to [aWord]</td></tr>
        <tr><th><kbd>y</kbd><kbd>s</kbd><kbd>s</kbd><kbd>)</kbd> </th><td>:heavy_check_mark: Whole-Line to (Whole-Line)</td></tr>
        <tr><th><kbd>y</kbd><kbd>s</kbd><kbd>s</kbd><kbd>"</kbd> </th><td>:heavy_check_mark: Whole-Line to "Whole-Line"</td></tr>
      </table></div></tr>
    </div>

    <div id="commandmode">
      <h2>Command Mode</h2>
      <table>
        <tr><th>:10,20 d</th>           <td>Delete line 10 to 20</td></tr>
        <tr><th>:'x,'y d</th>           <td>Delete mark x to y</td></tr>
        <tr><th>:'&lt;,'&gt;w d</th>    <td>Delete selection</td></tr>
        <tr><th>:'&lt;,'&gt;w new.txt</th>                  <td>Write selection to new file</td></tr>
        <tr><th>:ls (or :buffers)</th>  <td>List buffers</td></tr>
        <tr><th>:changes</th>           <td>Show changes</td></tr>
        <tr><th>:map</th>               <td>Show custom key mappings</td></tr>
        <tr><th>:reg</th>               <td>Show register contents</td></tr>
        <tr><th>:history</th>           <td>Show command history</td></tr>
        <tr><th>:jumps</th>             <td>Show jump list</td></tr>
        <tr><th>/<i>foo</i></th>        <td>Search <i>foo</i> forward</td></tr>
        <tr><th>?<i>foo</i></th>        <td>Search <i>foo</i> backward</td></tr>
        <tr><th>:%s/<i>foo\(\d\+\)</i>/<i>bar\1</i>/gic</th>                  <td>Replace all, ignore case, confirm each. Note backreference and escaped parens.</td></tr>
        <tr><th>:s/<i>foo</i>/<i>bar</i>/gI</th>                  <td>Replace all on current line, mind case</td></tr>
        <tr><th>:s/\%V<i>foo</i>/<i>bar</i>/g</th>                  <td>Match only within visual selection with \%V</td></tr>
        <tr><th>&amp;</th>              <td>Repeat last :s</td></tr>
      </table>
    </div>

    <div>
      <h4>File Commands</h4>
      <table>
        <tr><th>:e <i>file</i></th>     <td>Open <i>file</i></td></tr>
        <tr><th>:enew</th>              <td>New file</td></tr>
        <tr><th>:e .</th>               <td>Explore dir</td></tr>
        <tr><th>:e <i>sftp://me@example.com/myfile</i></th>                  <td>Open sftp</td></tr>
        <tr><th>:e!</th>                <td>Revert to saved</td></tr>
        <tr><th>:w <i>file</i></th>     <td>Save <i>file</i></td></tr>
        <tr><th>:wq</th>                <td>Save, close</td></tr>
        <tr><th>:q!</th>                <td>Close, don't save</td></tr>
        <tr><th>:qa</th>                <td>Close all</td></tr>
        <tr><th>:qa!</th>               <td>Close all, don't save</td></tr>
        <tr><th>:SudoWrite</th>         <td>Eunuch : Write even if you don't have permission.</td></tr>
      </table>
    </div>

    <div id="options">
      <h4>Options</h4>
      <table>
        <tr><th>:set number</th>        <td>Show line numbers</td></tr>
        <tr><th>:set rnu</th>           <td>Show relative line numbers</td></tr>
        <tr><th>:set paste</th>         <td>Autoindent off</td></tr>
        <tr><th>:set hlsearch</th>      <td>Highlight matches</td></tr>
        <tr><th>:set syntax=perl</th>   <td>Set syntax</td></tr>
        <tr><th>:set no<i>opt</i></th>  <td>Turn off <i>opt</i></td></tr>
        <tr><th>:set <i>opt</i>?</th>   <td>Show value of <i>opt</i></td></tr>
        <tr><th>:help options</th>      <td></td></tr>
        <tr><th>:set</th>               <td>Show current options</td></tr>
      </table>
    </div>

    <div id="ranges">
      <h4>Ranges</h4>
      <table>
        <tr><th>:help ranges</th>       <td></td></tr>
        <tr><th>:5,10d</th>             <td>delete lines 5–10</td></tr>
        <tr><th>:*d</th>                <td>delete last VISUAL selection</td></tr>
        <tr><th>:.,.+10</th>            <td>delete current and next 10 lines</td></tr>
        <tr><th>:/foo/+1d</th>          <td>delete line after next line containing <i>foo</i></td></tr>
        <tr><th>:.,'td</th>             <td>delete current line to mark <i>t</i></td></tr>
      </table>
    </div>

    <div id="visual">
      <h2>Visual Mode And Selection</h2>
      <table>
        <tr><th>v</th>                  <td>Enter visual mode</td></tr>
        <tr><th>V</th>                  <td>Enter line-wise visual mode</td></tr>
        <tr><th>Ctrl-v</th>             <td>Visual block-wise mode</td></tr>
        <tr><th>I, A, x</th>               <td>Prepend, append, delete block selection</td></tr>
        <tr><th>&lt;, &gt;</th>         <td>Indent selection</td></tr>
        <tr><th>ggVG</th>               <td>Select all</td></tr>
        <tr><th>=</th>                  <td>Auto format selected</td></tr>
        <tr><th>gv</th>                 <td>Re-select visual area</td></tr>
        <tr><th>vip</th>                <td>Select paragraph</td></tr>
      </table>
    </div>

    <div id="buffers">
      <h3>Buffers and Windows</h3>
      <table>
        <tr><th><kbd>tab</kbd>, <kbd>shift</kbd>+<kbd>tab</kbd>, <kbd>b</kbd><kbd>d</kbd>    </th><td>              | Buffer next, previous, delete (close).</td></tr>
        <tr><th>:sp, :vsp</th>          <td>Split view horizontal, vertical</td></tr>
        <tr><th>Ctrl-w Ctrl-w</th>      <td>Move cursor viewport</td></tr>
        <tr><th>Ctrl-w q</th>           <td>Close viewport</td></tr>
        <tr><th>Ctrl-w <span class="font2">[</span>-+=_<span class="font2">]</span></th>                  <td>Resize viewport</td></tr>
        <tr><th>:bufdo <i>%s/foo/bar</i></th>                  <td>Do to all buffers</td></tr>
      </table>
    </div>

    <div id="fold">
      <h3>Folding</h3>
      <table>
        <tr><th>&lt;F2&gt;</th>         <td> Cycle through fold methods</td></tr>
        <tr><th>:set foldmethod=manual</th>                  <td> or syntax, indent, etc.</td></tr>
        <tr><th>:[range]fold</th>       <td> Create fold on range or selection</td></tr>
        <tr><th>zf[move]</th>           <td> Create fold</td></tr>
        <tr><th>za</th>                 <td>Toggle fold</td></tr>
        <tr><th>zo</th>                 <td> Open fold</td></tr>
        <tr><th>zc</th>                 <td> Close fold</td></tr>
        <tr><th>zd</th>                 <td> Delete this fold</td></tr>
        <tr><th>zE</th>                 <td> Delete all folds</td></tr>
        <tr><th>zR</th>                 <td> Fold open </td></tr>
        <tr><th>zM</th>                 <td> Fold collapse </td></tr>
        <tr><th>:help folding</th>      <td></td></tr>
      </table>
    </div>

    <div id="help">
      <h3>Help</h3>
      <table>
        <tr><th>:h <i>topic</i></th>    <td>Help on <i>topic</i></td></tr>
        <tr><th>:h quickref</th>        <td>Quick reference</td></tr>
        <tr><th>Ctrl-]</th>             <td>Follow help link</td></tr>
        <tr><th>Ctrl-t</th>             <td>Back to previous</td></tr>
      </table>
    </div>

    <!-- <div id="commandlinewindow"> -->
      <!-- <h3>Command-Line Window</h3> -->
      <!-- <table> -->
        <!-- <tr><th>q:</th>                 <td> Edit command-mode history</td></tr> -->
        <!-- <tr><th>q/</th>                 <td> Edit search strings</td></tr> -->
        <!-- <tr><th>:h command-line</th>    <td></td></tr> -->
        <!-- <tr><th>Ctrl-f</th>             <td>Edit from command mode</td></tr> -->
        <!-- <tr><th>Ctrl-c</th>             <td>Abort edit</td></tr> -->
      <!-- </table> -->
    <!-- </div> -->


    <!-- <div id="pastebuffers"> -->
      <!-- <h3>OS copy/paste buffers</h3> -->
      <!-- <p> -->
        <!-- <span style="font-weight:bold;font-size:1.3em;">*</span> is the X11 primary/selection buffer (middle-click/shift-insert). <span style="font-weight:bold;font-size:1.3em;">+</span> is the clipboard/cut buffer (ctrl-c/ctrl-v).</p> -->
      <!-- <pre> -->
      <!-- "*p -->
      <!-- "+y -->
      <!-- "*dd -->
      <!-- :%y +</pre> -->
      <!-- <p> -->
      <!-- Under Windows, the * and + registers are equivalent.</p> -->
    <!-- </div> -->

    <div id="exandnomral">
      <h3>Formatting</h3>
      <table>
        <tr><th>:help formatoptions</th><td></td></tr>
        <tr><th>:set textwidth=80</th>  <td>My default</td></tr>
        <tr><th>set formatprg=par\ -w79</th><td>Format using paragraph to at most 79 chars</td></tr>
        <tr><th>vvVG</th>               <td>Select whole file</td></tr>
        <tr><th>gq{motion}</th>         <td> like gqip to format around paragraph </td></tr>
        <tr><th>Ctrl-w</th>             <td>does a gqip</td></tr>
      </table>
    </div>

    <div id="exandnomral">
      <h3>Commenting</h3>
      <table>
        <tr><th><kbd>Ctrl</kbd>+<kbd>/</kbd>                 </th><td>:heavy_check_mark:| (un)Comment a line and move to the next.<br/> - I've tweaked the commenter to comment the currentline (or uncomment) and then move to the next.  <br/> - I find this really handy!</td></tr>
      </table>
    </div>

    <div id="exandnomral">
      <h3>Moving a Line</h3>
      <table>
        <tr><th><kbd>Alt</kbd>+<kbd>Up</kbd>                 </th><td>:heavy_check_mark:| Move current line up.</td></tr>
        <tr><th><kbd>Alt</kbd>+<kbd>Down</kbd>               </th><td>:heavy_check_mark:| Move current line down.</td></tr>
      </table>
    </div>


    <div id="case">
      <h3>Changing case</h3>
      <table>
        <tr><th>~</th>                  <td>Change case</td></tr>
        <tr><th>gUU, guu, g~~</th>      <td>Upper, lower, flip case whole line</td></tr>
        <tr><th><kbd>g</kbd><kbd>~</kbd><kbd>{movement}</kbd></th> <td>Togglecase, movement is <kbd>w</kbd> or <kbd>}</kbd> etc.</td></tr>
        <tr><th><kbd>g</kbd><kbd>u</kbd><kbd>{movement}</kbd></th> <td>Lowercase</td></tr>
        <tr><th><kbd>g</kbd><kbd>U</kbd><kbd>{movement}</kbd></th> <td>Uppercase</td></tr>
        <tr><th>:s/\<\(\w\)\(\w\*\)\>/\u\1\L\2/g</th>              <td>Title Case regex</td></tr>
      </table>
    </div>

    <div id="exandnomral">
      <h3>Increment/Dec a value</h3>
      <table>
        <tr><th><kbd>Ctrl</kbd>+<kbd>a</kbd>                 </th><td>Increment value under cursor by 1.  Also works with Dates/times....</td></tr>
        <tr><th><kbd>Ctrl</kbd>+<kbd>x</kbd>                 </th><td>Decrement value under cursor by 1.<br/>`:let i=1 \| g/foo/s//\=i/ \| let i=i+1`<br/>`:let i=1 \| g/foo/s//\="morestuff".i."morestuff"/ \| let i=i+1`</td></tr>
      </table>
    </div>


    <div id="exandnomral">
      <h3>Formatting</h3>
      <table>
        <tr><th><kbd>g</kbd><kbd>g</kbd><kbd>=</kbd><kbd>G</kbd> </th><td>          | auto (re)indent entire document.</td></tr>
        <tr><th><kbd>=</kbd>                                 </th><td>              | (re)indent the text on the current line or on the area selected (SUPER).</td></tr>
        <tr><th><kbd>=</kbd><kbd>%</kbd>                     </th><td>              | (re)indent the current braces { ... }.</td></tr>
        <tr><th>`:%!par`                                     </th><td>              | Format range, in this case whole doument.</td></tr>
        <tr><th>`:%!par j1w80`                               </th><td>              | Format range to j1w80.</td></tr>
        <tr><th><kbd>Ctrl</kbd>+<kbd>w</kbd>                 </th><td>:heavy_check_mark:| Wrap, quick format current paragraph.</td></tr>
        <tr><th>&nbsp;                                       </th><td>              | `:[range]ce[nter] [width] center lines :.,+3 center 80`</td></tr>
        <tr><th>&nbsp;                                       </th><td>              | `:[range] ri[ght] [right edge] right alignment :% right`</td></tr>
        <tr><th>&nbsp;                                       </th><td>              | `:[range] le[ft] [indent] left alignment.(Unit of identation is space) :% left 4`</td></tr>
      </table>
    </div>

    <!-- <div id="exandnomral"> -->
      <!-- <h3>Repeat plugin</h3> -->
      <!-- <table> -->
        <!-- <tr><th>Not tested yet                               </th><td>              | Todo</td></tr> -->
      <!-- </table> -->
    <!-- </div> -->

    <div id="exandnomral">
      <h3>Function Keys</h3>
      <table>
        <tr><th><kbd>F1</kbd>                                </th><td>:heavy_check_mark:| Help, open this page</td></tr>
        <tr><th><kbd>F2</kbd>                                </th><td>:heavy_check_mark:| Cycle through different folding methods.</td></tr>
        <tr><th><kbd>F3</kbd>                                </th><td>:heavy_check_mark:| Toggle most visual items.</td></tr>
        <tr><th><kbd>F4</kbd>                                </th><td>:heavy_check_mark:| Open left file menu</td></tr>
        <tr><th><kbd>F9</kbd>                                </th><td>:heavy_check_mark:| Open Telescope</td></tr>
        <tr><th><kbd>F10</kbd>                               </th><td>:heavy_check_mark:| Kitty command - New terminal in new tab</td></tr>
        <tr><th><kbd>F11</kbd>                               </th><td>:heavy_check_mark:| Toggle right tagbar</td></tr>
        <tr><th><kbd>F12</kbd>                               </th><td>:heavy_check_mark:| Toggle ranger</td></tr>
      </table>
    </div>

    <div id="misc">
      <h2>Miscellaneous</h2>
      <table>
        <tr><th>`:set number!`                               </th><td>              | Toggle line numbers.</td></tr>
        <tr><th>`:set relativenumber!`                       </th><td>              | Toggle relative line numbers.</td></tr>
        <tr><th>`:set ft={markdown\|java\|...}`              </th><td>              | Set file type.</td></tr>
        <tr><th>`:set ff={unix\|html\|dos}`                  </th><td>              | Set file format.</td></tr>
        <tr><th>`:set syntax?`                               </th><td>              | Syntax type.</td></tr>
        <tr><th>z=</th>                 <td>suggest spelling</td></tr>
        <tr><th>zg, zug</th>            <td>Add to dict, undo add</td></tr>
        <tr><th>Ctrl-a</th>             <td>Increment number under cursor</td></tr>
        <tr><th>Ctrl-x</th>             <td>Decrement number under cursor</td></tr>
        <tr><th>ci<span class="font2">[</span><i>)"}</i><span class="font2">]</span></th>   <td>Delete inside ()/"/{} and insert</td></tr>
        <tr><th>:[range]w !{cmd}</th>   <td> Execute cmd with range as stdin, like <code>:w !sbcl</code> or <code>:'&lt;,'&gt;w !python</code></td></tr>
        <tr><th>g Ctrl-g</th>           <td>Word count</td></tr>
        <tr><th>g?</th>                 <td>Rot 13</td></tr>
        <tr><th>:ce <i>80</i></th>      <td>Center line <i>columns</i></td></tr>
        <tr><th>:r !date</th>           <td>Insert external command output (e.g. date)</td></tr>
        <tr><th>:%! <i>filter</i></th>  <td>Filter whole file</td></tr>
        <tr><th>:| <i>filter</i></th>   <td>Same as above</td></tr>
        <tr><th>:'&lt;,'&gt;! <i>filter</i></th>                  <td>Filter visual selection</td></tr>
        <tr><th>:'&lt;,'&gt;! sort</th> <td>Example of above</td></tr>
        <tr><th>:ab <i>lw LongWord</i></th>                  <td>Abbreviate <i>LongWord</i></td></tr>
        <tr><th>:una lw</th>            <td>Unset abbreviation</td></tr>
        <tr><th>:%s/pattern//gn</th>    <td>Count matches</td></tr>
        <tr><th>:so ~/.vimrc</th>       <td>Reload .vimrc</td></tr>
        <!-- <tr><th>:redraw! <span class="font1">or</span> Ctrl-l<dt> <dd> Clean up the screen</td></tr> -->
        <!-- <tr><th>:retab</th>             <td>Apply current tabstop settings</td></tr> -->
        <tr><th>:[range]g[lobal]/<i>pattern</i>/[command]</dt> <dd style="font-weight:bold;">Run the Ex command on all lines in [range] matching <i>pattern</i></td></tr>
        <tr><th>:[9,20]g/^/d A</th>     <td>Delete lines 9–20.
        <tr><th>:g/foobar/y A</th>      <td>Yank all lines matching <i>foobar</i> into copy buffer</td></tr>
        <tr><th>:g/^Foo/norm <i>0xxxBar</i></th>                  <td>norm runs commands as if you typed them</td></tr>
        <tr><th>:v/<i>pattern</i>/[command]</th>                  <td>Like :g but finds NON-matching lines</td></tr>
        <tr><th><kbd>Ctrl</kbd>+<kbd>l</kbd> </th><td>:heavy_check_mark:| Redraws the screen and removes any search highlighting</td></tr>
        <tr><th><kbd>Ctrl</kbd>+<kbd>s</kbd> </th><td>:heavy_check_mark:| Save the current file.</td></tr>
        <tr><th><kbd>g</kbd><kbd>r</kbd> </th><td>:heavy_check_mark:| Run line under cursor in shell, **USE WITH CARE!**</td></tr>
        <tr><th><kbd>Alt</kbd>+<kbd>r</kbd> </th><td>:heavy_check_mark:| Run the current file.</td></tr>
        <tr><th><kbd>Alt</kbd>+<kbd>e</kbd> </th><td>:heavy_check_mark:| Make the current file executable `chmod a+x file`<br/>The Eunuch plugin also makes files starting with `#!` executable.</td></tr>
        <tr><th><kbd>d</kbd><kbd>t</kbd><kbd>char</kbd>      </th><td>Delete to `char`.</td></tr>
        <tr><th><kbd>d</kbd><kbd>^</kbd>                     </th><td>Delete to start of line.</td></tr>
        <tr><th><kbd>D</kbd>                                 </th><td>Delete to end of line.</td></tr>
        <tr><th>:ascii or <kbd>g</kbd><kbd>a</kbd>           </th><td>Ascii, octal val of char under cursor.</td></tr>
        <tr><th><kbd>c</kbd><kbd>a</kbd><kbd>t</kbd>, <kbd>c</kbd><kbd>i</kbd><kbd>t</kbd>           </th><td>              | etc for change insert tags etc.</td></tr>
        <tr><th><kbd>c</kbd><kbd>i</kbd><kbd>'</kbd>, <kbd>c</kbd><kbd>a</kbd><kbd>(</kbd>, <kbd>c</kbd><kbd>i</kbd><kbd>{</kbd>      </th><td>              | Change stuff in between ' (also works for ", [, (, {).</td></tr>
        <tr><th><kbd>c</kbd><kbd>c</kbd>                     </th><td>              | Change current line.</td></tr>
        <tr><th><kbd>c</kbd><kbd>f</kbd><kbd>char</kbd>      </th><td>              | Change to `char` (any char).</td></tr>
        <tr><th><kbd>g</kbd><kbd>d</kbd>                     </th><td>              | Goto definition.</td></tr>
      </table>
    </div>

      <!-- <p>Pipe to vim like:<br /> <code>$ grep 'foo*bar' file.txt | vim -</code></p> -->
      <!-- <p>Type <b>ctrl-v ESC</b> to insert an escape keystroke in the norm argument.</p> -->

<!-- }}}1 -->

# Some Useful Links
<!-- {{{1 -->
| [![NeoVim](https://img.shields.io/badge/NeoVim-website-red)](https://neovim.io) | [![Lunar Vim](https://img.shields.io/badge/Lunar%20Vim-website-red)](https://github.com/ChristianChiarulli/LunarVim) | [![Vim Sheet](https://img.shields.io/badge/Vim%20Sheet-website-red)](http://vimsheet.com)
| :--: | :--: | :--:
| [![Vim Cheatsheet](https://img.shields.io/badge/Vim%20CheatSheet.wtf-website-red)](https://www.cheatsheet.wtf/vim/) | [![Quick ref](https://img.shields.io/badge/Quick%20Ref-website-red)](http://tnerual.eriogerg.free.fr/vimqrc.html) | [![Cheatsheet](https://img.shields.io/badge/Cheatsheet-website-red)](https://paulgorman.org/technical/vim.html)
| [![100 Essential commands](https://img.shields.io/badge/100%20Essential%20Commands-website-red)](https://catswhocode.com/vim-commands/) | [![Vim tutorial](https://img.shields.io/badge/Vim%20Tutorial-website-red)](https://www.openvim.com/) | [![Vim cookbook](https://img.shields.io/badge/Vim%20Cookbook-website-red)](http://www.oualline.com/vim-cook.html)
| [![VimAwesome](https://img.shields.io/badge/NeoVim-website-red)](https://vimawesome.com) | &nbsp; | &nbsp;
<!-- }}}1 -->

<!--
TODO: https://github.com/tpope/vim-repeat
-->
