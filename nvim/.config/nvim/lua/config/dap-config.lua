local dap = require("dap")
local dapui = require("dapui")

dapui.setup()

-- Setup the codelldb adapter
dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    command = vim.fn.expand("~/.local/share/nvim/mason/bin/codelldb"), -- Ensure the path is expanded correctly
    args = { "--port", "${port}" },
  },
}

-- Function to get the correct path to the executable
local function get_program_path(default_path)
  return vim.fn.input("Path to executable: ", default_path, "file")
end

-- Setup the DAP configuration for C/C++ using Clang
dap.configurations.cpp = {
  {
    name = "Launch",
    type = "codelldb",
    request = "launch",
    cwd =  "${workspaceFolder}",
    program = function()
      return get_program_path(vim.fn.getcwd() .. "/bazel-bin/NESMint/Main")
    end,
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
}

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

