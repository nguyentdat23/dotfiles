return {
  {
    "mfussenegger/nvim-dap",
    optional = true,
    opts = function()
      -- Simple configuration to attach to remote java debug process
      -- Taken directly from https://github.com/mfussenegger/nvim-dap/wiki/Java
      local dap = require("dap")
      dap.configurations.java = {}
    end,
    dependencies = {
      {
        "mason-org/mason.nvim",
        registries = {
          "github:indika-dev/personal-mason-registry",
          "github:mason-org/mason-registry",
        },
        opts = { ensure_installed = { "java-debug-adapter", "java-test" } },
      },
    },
  },
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
