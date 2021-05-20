let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"
" let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.2"}
let g:slime_default_config = {"socket_name": "default", "target_pane": "1"}
let g:slime_no_mappings = 1
let g:slime_dont_ask_default = 1
let g:slime_cell_delimiter = "#%%"
let g:slime_python_ipython = 1

" function! TmuxOrSplitSwitch(wincmd, tmuxdir)
  " let previous_winnr = winnr()
  " silent! execute "wincmd " . a:wincmd
  " if previous_winnr == winnr()
    " call system("tmux select-pane -" . a:tmuxdir)
    " redraw!
  " endif
" endfunction

" let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
" let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
" let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

" nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
" nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
" nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
" nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
