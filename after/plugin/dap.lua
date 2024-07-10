local dap = require('dap')
local dapui = require("dapui")

dapui.setup()

vim.keymap.set('n', '<leader>dt', dap.toggle_breakpoint, {})
vim.keymap.set('n', '<leader>dc', dap.continue, {})

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end

-- LLDB
dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/local/bin/lldb-dap',
  name = 'lldb'
}

-- C++
dap.configurations.cpp = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
  },
}

vim.keymap.set('n', '<leader>dap', dapui.toggle, {})
