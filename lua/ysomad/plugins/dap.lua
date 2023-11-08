return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
    "leoluz/nvim-dap-go"
  },
  config = function ()
    local dap = require("dap")
    local dapui = require("dapui")
    local dap_go = require("dap-go")

    dap_go.setup()
    dapui.setup()

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    vim.keymap.set("n", "<F5>", function () dap.continue() end)
    vim.keymap.set("n", "<F3>", function () dap.step_over() end)
    vim.keymap.set("n", "<F2>", function () dap.step_into() end)
    vim.keymap.set("n", "<F12>", function () dap.step_out() end)
    vim.keymap.set("n", "<leader>b", function () dap.toggle_breakpoint() end)
    vim.keymap.set("n", "<leader>B", function ()
      dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
    end)
    vim.keymap.set("n", "<leader>lp", function ()
      dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
    end)
    vim.keymap.set("n", "<leader>dr", function () dap.repl.open() end)
    vim.keymap.set("n", "<leader>dt", function () dap_go.debug_test() end)
  end
}

