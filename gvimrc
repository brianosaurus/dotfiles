map <D-S-RIGHT> :tabnext<CR>
map <D-S-LEFT> :tabprevious<CR>

set guifont=Monaco:h12
"highlight ColorColumn guibg=dimgray
map <C-P> :CtrlP<CR>

if has("gui_running")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    set guifont=Inconsolata\ for\ Powerline:h15
  endif
endif
