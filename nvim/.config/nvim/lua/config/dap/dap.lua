local dap = require("dap")

dap.adapters.python = {
  type = "executable",
  command = "python",
  args = { "-m", "debugpy.adapter"}
}

dap.configurations.python = {
    type = "python",
    request = "launch",
    name = "My Launch file",
    program = "${file}",
    pythonPath = function()
      return vim.fn.executable("python3") or vim.fn.executable("python")
    end,
    justMyCode = false,
}
