vim.g.mapleader = "<Space>"
vim.api.nvim_exec(
[[
set number
set autoindent
set expandtab
set shiftwidth=0
set ts=4
set encoding=utf-8
set fileencoding=utf-8
set autochdir
syntax on
:imap fd <Esc>

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)
]], false)

require('packer').startup(function(use)
    use 'famiu/nvim-reload'
    use 'glepnir/lspsaga.nvim'
    use 'kabouzeid/nvim-lspinstall'
    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/completion-nvim'
    use 'nvim-lua/plenary.nvim'
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    use 'rafi/awesome-vim-colorschemes'
    use 'wbthomason/packer.nvim'
    -- use 'yamatsum/nvim-cursorline'
end)
require('mappings')
require('complete')
require('lsp')

vim.api.nvim_exec([[
autocmd FileType TelescopePrompt call deoplete#custom#buffer_option('auto_complete', v:false)
colorscheme gruvbox
]], false)
