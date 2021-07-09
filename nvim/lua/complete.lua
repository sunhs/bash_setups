vim.api.nvim_exec([[
autocmd BufEnter * lua require'completion'.on_attach()

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert

" Avoid showing message extra message when using completion
set shortmess+=c

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']
" let g:completion_matching_strategy_list = ['exact']
let g:completion_matching_smart_case = 1
let g:completion_timer_cycle = 100 "default value is 80
let g:completion_trigger_keyword_length = 2 " default = 1

let g:completion_auto_change_source = 1
" let g:completion_chain_complete_list = {'TelescopePrompt': [], 'default': [{'complete_items': ['lsp']}, {'complete_items': ['snippet']}, {'mode': '<c-p>'}, {'mode': '<c-n>'}] }

imap <c-j> <Plug>(completion_next_source) "use <c-j> to switch to previous completion
imap <c-k> <Plug>(completion_prev_source) "use <c-k> to switch to next completion

]], true)
