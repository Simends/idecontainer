
" Load Plugins

" Vimplug
call plug#begin()

" Colorschemes
Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'
Plug 'tssm/fairyfloss.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'drewtempelmeyer/palenight.vim'

" Emacs-style undotree
Plug 'mbbill/undotree'

" Telescope fuzzy-finder
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Plug 'junegunn/fzf.vim'

" Easily comment lines
Plug 'preservim/nerdcommenter'

" Easy search
Plug 'justinmk/vim-sneak'

" Icons
Plug 'ryanoasis/vim-devicons'

" Quick overview of project
Plug 'preservim/nerdtree'|
            \ Plug 'Xuyuanp/nerdtree-git-plugin'|
            \ Plug 'PhilRunninger/nerdtree-visual-selection'|
            \ Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Git in vim
Plug 'tpope/vim-fugitive'

" Minimap
Plug 'wfxr/minimap.vim', { 'on': ['Minimap', 'MinimapToggle'] }

" TODO Debug in vim
Plug 'puremourning/vimspector', { 'on': ['<Plug>vimspector#Launch()', 'VimspectorInstall', 'VimspectorUpdate'] }

" Snippets in vim
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Tag list
Plug 'majutsushi/tagbar', { 'on': ['TagbarOpen', 'TagbarToggle'] }

" Better statusline
Plug 'hoob3rt/lualine.nvim'

" Maximize window
Plug 'szw/vim-maximizer'

" Better notetaking
" Plug 'vimwiki/vimwiki'
" Plug 'tools-life/taskwiki'
" Plug 'powerman/vim-plugin-AnsiEsc'
" Plug 'godlygeek/tabular'|
            " \ Plug 'plasticboy/vim-markdown'

" Zen-mode in vim
Plug 'junegunn/goyo.vim'

" TODO Show list of available keybindings
" Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

" TODO Tmux integration
Plug 'christoomey/vim-tmux-navigator'
Plug 'jpalardy/vim-slime'
Plug 'preservim/vimux'

" Automatic pair
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'

" Better statusline
Plug 'hoob3rt/lualine.nvim'

" Coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
