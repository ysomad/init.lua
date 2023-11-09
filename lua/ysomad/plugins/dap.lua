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

    vim.keymap.set("n", "<F5>", dap.continue, { desc = "DAP continue" })
    vim.keymap.set("n", "<F3>", dap.step_over, { desc = "DAP step over" })
    vim.keymap.set("n", "<F2>", dap.step_into, { desc = "DAP step into" })
    vim.keymap.set("n", "<F12>", dap.step_out, { desc = "DAP step out" })
    vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "DAP toggle breakpoint" })
    vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "DAP open REPL" })
    vim.keymap.set("n", "<leader>dt", dap_go.debug_test, { desc = "DAP debug test" })

    vim.keymap.set("n", "<leader>B", function ()
      dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
    end, { desc = "DAP set breakpoint with condition" })

    vim.keymap.set("n", "<leader>lp", function ()
      dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
    end, { desc = "DAP set breakpoint with log msg" })

  end
}

