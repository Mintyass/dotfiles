local dap = require("dap")
local dapui = require("dapui")

dapui.setup()

-- Setup the codelldb adapter
dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    command = "~/.local/share/nvim/mason/bin/codelldb", -- Update this path to where codelldb is installed
    args = { "--port", "${port}" },
  },
}

-- Setup the DAP configuration for C/C++ using Clang
dap.configurations.cpp = {
  {
    name = "Launch",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/bazel-bin/NESMint/Main", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    setupCommands = {
      {
        text = '-enable-pretty-printing',
        description = 'enable pretty printing',
        ignoreFailures = false
      },
    },
    args = {},

    -- Source mapping to resolve breakpoints correctly
    sourceMap = {
      ["/proc/self/cwd"] = vim.fn.getcwd(),
    },

    runInTerminal = false,
  },
  {
    name = "Launch NESMintApp",
    type = "codelldb",
    request = "launch",
    program = vim.fn.getcwd() .. "/bazel-bin/NESMintApp/NESMintApp",
    cwd = "${workspaceFolder}",
    stopOnEntry = false,

    setupCommands = {
      {
        text = '-enable-pretty-printing',
        description = 'enable pretty printing',
        ignoreFailures = false
      },
    },
    args = {},

    -- Source mapping to resolve breakpoints correctly
    sourceMap = {
      ["/proc/self/cwd"] = vim.fn.getcwd(),
    },

    runInTerminal = false,
  }
}

-- Key mappings
vim.api.nvim_set_keymap('n', '<F5>', '<Cmd>lua require"dap".continue()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F10>', '<Cmd>lua require"dap".step_over()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F11>', '<Cmd>lua require"dap".step_into()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F12>', '<Cmd>lua require"dap".step_out()<CR>', { noremap = true, silent = true })

-- Apply the same configuration to C files
dap.configurations.c = dap.configurations.cpp

-- Enable logging for debugging DAP issues
dap.set_log_level("DEBUG")

-- Automatically open and close dap-ui
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
