local opts = { noremap = true, silent = true }
vim.g.mapleader = ' '
vim.api.nvim_set_keymap('i', '<C-c>', '<Esc>', opts)

-- switching keys for my ease of use
vim.api.nvim_set_keymap('n', 'j', 'k', opts)
vim.api.nvim_set_keymap('n', 'k', 'j', opts)
vim.api.nvim_set_keymap('v', 'j', 'k', opts)
vim.api.nvim_set_keymap('v', 'k', 'j', opts)
vim.api.nvim_set_keymap('n', '0', '^', opts)
vim.api.nvim_set_keymap('n', '^', '0', opts)

-- switching windows
vim.api.nvim_set_keymap('n', 'J', '<C-W><C-K>', opts)
vim.api.nvim_set_keymap('n', 'K', '<C-W><C-J>', opts)
vim.api.nvim_set_keymap('n', 'L', '<C-W><C-L>', opts)
vim.api.nvim_set_keymap('n', 'H', '<C-W><C-H>', opts)

-- makes brackets more accessible (swiss keyboard)
-- vim.api.nvim_set_keymap('i', 'ç', '!', opts)
-- vim.api.nvim_set_keymap('i', 'è', '[', opts)
-- vim.api.nvim_set_keymap('i', '!', ']', opts)
-- vim.api.nvim_set_keymap('i', 'à', '{', opts)
-- vim.api.nvim_set_keymap('i', '£', '}', opts)
-- vim.api.nvim_set_keymap('v', 'ç', '!', opts)
-- vim.api.nvim_set_keymap('v', 'è', '[', opts)
-- vim.api.nvim_set_keymap('v', '!', ']', opts)
-- vim.api.nvim_set_keymap('v', 'à', '{', opts)
-- vim.api.nvim_set_keymap('v', '£', '}', opts)
-- vim.api.nvim_set_keymap('c', 'ç', '!', opts)
-- vim.api.nvim_set_keymap('c', 'è', '[', opts)
-- vim.api.nvim_set_keymap('c', '!', ']', opts)
-- vim.api.nvim_set_keymap('c', 'à', '{', opts)
-- vim.api.nvim_set_keymap('c', '£', '}', opts)

-- Telescope mappings
vim.api.nvim_set_keymap('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
vim.api.nvim_set_keymap('n', '<leader>lg', "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
vim.api.nvim_set_keymap('n', '<leader>gs', "<cmd>lua require('telescope.builtin').git_status()<cr>", opts)
vim.api.nvim_set_keymap('n', '<leader>gc', "<cmd>lua require('telescope.builtin').git_commits()<cr>", opts)

-- LSP mappings
vim.keymap.set('n', 'gE', vim.diagnostic.goto_next) -- [g]o to [E]rror
vim.keymap.set('n', 'gD', vim.lsp.buf.definition) -- [g]o to [D]efintion
vim.keymap.set('n', 'gT', vim.lsp.buf.type_definition) -- [g]o to [T]ypedefintion
vim.keymap.set('n', 'I', vim.lsp.buf.hover) -- [I]nformation
vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename)
-- Custom LSP command to toggle diagnostics
vim.api.nvim_set_keymap('n', 'tE', ':call v:lua.toggle_diagnostics()<CR>', opts) -- [t]oggle [E]rrors
