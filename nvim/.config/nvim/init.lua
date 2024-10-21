-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DapBreakpointCondition', { text = '', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DapLogPoint', { text = '', texthl = 'DiagnosticSignInfo' })

vim.g.dap = {
  justMyCode = false,
}

