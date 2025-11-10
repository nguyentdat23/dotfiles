return {
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "nvim-neotest/nvim-nio" },
    opts = {
      layouts = {
        {
          elements = {
            {
              id = "breakpoints",
              size = 0.2,
            },
            {
              id = "watches",
              size = 0.2,
            },
            {
              id = "scopes",
              size = 0.3,
            },
            {
              id = "repl",
              size = 0.3,
            },
          },
          position = "right",
          size = 40,
        },
        {
          elements = {
            {
              id = "console",
              size = 1,
            },
          },
          position = "bottom",
          size = 15,
        },
      },
      mappings = {
        edit = "E",
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "O",
        remove = "D",
        repl = "R",
        toggle = "T",
      },
    },
  },
}
