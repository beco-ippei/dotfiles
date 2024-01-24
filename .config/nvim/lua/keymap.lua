-- kaymap config
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

local km = vim.api.nvim_set_keymap

km('n', '<c-j>', '5j', opts)
km('n', '<c-k>', '5k', opts)

-- Stay in indent mode
km("v", "<", "<gv", opts)
km("v", ">", ">gv", opts)

