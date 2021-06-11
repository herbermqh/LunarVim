let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/bin/dotfiles/bin
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +300 ~/.config/LunarVim/user.vim
badd +130 ~/.config/LunarVim/lua/plugins.lua
badd +20 ~/.config/LunarVim/init.lua
badd +444 ~/.config/LunarVim/lua/lv-galaxyline/init.lua
badd +92 ~/.config/LunarVim/README.md
badd +167 ~/.config/LunarVim/lua/lv-which-key/init.lua
badd +75 jump
argglobal
%argdel
$argadd ~/.config/LunarVim/init.lua
edit ~/.config/LunarVim/user.vim
argglobal
balt ~/.config/LunarVim/init.lua
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
255
normal! zo
let s:l = 333 - ((12 * winheight(0) + 20) / 40)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 333
normal! 038|
lcd ~/bin/dotfiles/bin
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0&& getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOFIAc
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
