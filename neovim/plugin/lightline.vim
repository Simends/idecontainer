" function! CocCurrentFunction()
    " return get(b:, 'coc_current_function', '')
" endfunction

function! LightlineFugitive()
	try
	if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*FugitiveHead')
	    let mark = '  '  " edit here for cool mark
	    let branch = FugitiveHead()
	    return branch !=# '' ? mark.branch : ''
	endif
	catch
	endtry
	return ''
endfunction

function! StatusDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, '  ' . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, '  ' . info['warning'])
  endif
  return join(msgs, ' ')
endfunction

" let g:lightline.separator = { 'left': '', 'right': '' }
" let g:lightline.subseparator = { 'left': '', 'right': '' }
let g:lightline = {
      \ 'colorscheme': 'palenight',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'StatusDiagnostic',
      \   'gitbranch': 'LightlineFugitive',
      \ },
      \ 'component': { 
      \   'giticon': '',
      \ },
	  \ 'separator': { 'left': '', 'right': '' },
	  \ 'subseparator': { 'left': '|', 'right': '|' },
      \ }
