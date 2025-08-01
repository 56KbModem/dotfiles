" Set tabstops:
set tabstop=4       " Number of visual spaces per tab
set shiftwidth=4    " Number of spaces to use for each step of (auto)indent
set softtabstop=4   " How many spaces a <Tab> feels like in insert mode
set expandtab       " Use spaces instead of tab characters

" Set relative linenumbers:
set nu rnu

" Set syntax highlighting:
syntax on

" Define custom clipboard commands using wl-copy and wl-paste
set clipboard=unnamedplus

let g:clipboard = {
      \   'name': 'wl-clipboard',
      \   'copy': {
      \     '+': 'wl-copy',
      \     '*': 'wl-copy',
      \   },
      \   'paste': {
      \     '+': 'wl-paste --no-newline',
      \     '*': 'wl-paste --no-newline',
      \   },
      \   'cache_enabled': 0,
      \ }

