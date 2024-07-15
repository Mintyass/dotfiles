-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here


-- Set some key mappings to make the debugging experience more convenient
vim.api.nvim_set_keymap("n", "<leader>dc", ":lua require('dap').continue()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>db", ":lua require('dap').toggle_breakpoint()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dn", ":lua require('dap').step_over()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>ds", ":lua require('dap').step_into()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>do", ":lua require('dap').step_out()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dr", ":lua require('dap').repl.toggle()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dl", ":lua require('dap').run_last()<CR>", { noremap = true })
