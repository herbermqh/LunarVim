let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +41 .config/LunarVim/init.lua
badd +105 .config/LunarVim/lua/plugins.lua
badd +217 .config/LunarVim/README.md
badd +268 .config/LunarVim/user.vim
badd +3 .config/LunarVim/lua/lsp/sql-ls.lua
badd +380 .config/LunarVim/JimsCheatsheet.htm
argglobal
%argdel
$argadd .config/LunarVim/init.lua
edit .config/LunarVim/JimsCheatsheet.htm
argglobal
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
82
normal! zo
87
normal! zo
427
normal! zo
427
normal! zc
487
normal! zo
489
normal! zo
501
normal! zo
503
normal! zo
533
normal! zo
87
normal! zc
556
normal! zo
556
normal! zo
556
normal! zo
556
normal! zo
562
normal! zo
let s:l = 217 - ((24 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 217
normal! 014|
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
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
