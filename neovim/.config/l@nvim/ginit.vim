set go-=T
set go-=e
set go-=m
set guitablabel=%M\ %t
set mouse=a

let s:font = "Inconsolata Nerd Font:h"
let s:fontsize = 12
:execute "GuiFont! " . s:font s:fontsize

GuiTabline 0
GuiScrollBar 1

nmap gx                  :silent execute "!xdg-open " . shellescape("<cWORD>")<cr>
nmap <C-leftmouse>       gx

