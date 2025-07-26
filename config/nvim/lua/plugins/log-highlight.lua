return {
  {
    "fei6409/log-highlight.nvim",
    config = function()
      require("log-highlight").setup({
        extension = { "dapui_console" },
      })
    end,
    opts = {
      extension = { "dapui_console", "log" },
    },
  },
}
