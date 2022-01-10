
set go-=T
set go-=e
set go-=m
set guitablabel=%M\ %t
set mouse=a

let s:font = "Inconsolata Nerd Font:h"
let s:fontsize = 12
let g:fontsize#timeout = 1
let g:fontsize#timeoutlen = 3000

:execute "GuiFont! " . s:font s:fontsize
GuiTabline 0
GuiScrollBar 1

nmap      <silent><leader>+         <cmd>call AdjustFontSize(1)<cr>
nmap      <silent><leader>-         <cmd>call AdjustFontSize(-1)<cr>
nmap      <silent><leader>=         <cmd>call AdjustFontSizeDefault()<cr>
noremap   <C-ScrollWheelUp>         <cmd>call AdjustFontSize(1)<cr>
noremap   <C-ScrollWheelDown>       <cmd>call AdjustFontSize(-1)<cr>
inoremap  <C-ScrollWheelUp>         <esc><cmd>call AdjustFontSize(1)<cr>a
inoremap  <C-ScrollWheelDown>       <esc><cmd>call AdjustFontSize(-1)<cr>a
nmap      gx                        :silent execute "!xdg-open " . shellescape("<cWORD>")<cr>
nmap      <C-leftmouse>             gx

let s:_fontsize = s:fontsize
function! AdjustFontSize(amount)
  let s:_fontsize = s:_fontsize+a:amount
  :execute "GuiFont! " . s:font s:_fontsize
endfunction

function! AdjustFontSizeDefault()
  let s:_fontsize = s:fontsize
  :execute "GuiFont! " . s:font s:_fontsize
endfunction

