"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Script: ColorV 
"    File: plugin/ColorV.vim
" Summary: A Color Viewer and Color Picker for Vim
"  Author: Rykka.Krin <rykka.krin@gmail.com>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:save_cpo = &cpo
set cpo&vim
if !has("gui_running")
    " "GUI MODE ONLY"
    finish
endif
if v:version < 700
    finish
endif

command! -nargs=*  ColorV call ColorV#Win("",<q-args>)
command! -nargs=*  ColorVnorm call ColorV#Win("",<q-args>)
command! -nargs=*  ColorVmini call ColorV#Win("min",<q-args>)
command! -nargs=0  ColorVword call ColorV#open_word()
command! -nargs=0  ColorVchange call ColorV#change_word()
command! -nargs=0  ColorVchangeAll call ColorV#change_word("all")
command! -nargs=0  ColorVclear call ColorV#clear_all()

if has('python')
command! -nargs=0  ColorVdropper call ColorV#Dropper()
endif

if !hasmapto(':ColorV<CR>')
  silent! nmap <unique> <silent> <Leader>cv :ColorV<CR>
endif

if !hasmapto(':ColorVmini<CR>')
  silent! nmap <unique> <silent> <Leader>cm :ColorVmini<CR>
endif

if !hasmapto(':ColorVword<CR>')
  silent! nmap <unique> <silent> <Leader>cw :ColorVword<CR>
endif

if !hasmapto(':ColorVchange<CR>')
  silent! nmap <unique> <silent> <Leader>cg :ColorVchange<CR>
endif

if !hasmapto(':ColorVchangeALl<CR>')
  silent! nmap <unique> <silent> <Leader>ca :ColorVchangeAll<CR>
endif

if !hasmapto(':ColorVdropper<CR>') && has('python')
  silent! nmap <unique> <silent> <Leader>cd :ColorVdropper<CR>
endif

let &cpo = s:save_cpo
unlet s:save_cpo
