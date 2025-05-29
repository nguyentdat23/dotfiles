return {
  {
    "mfussenegger/nvim-dap",
    optional = true,
    opts = function()
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
      {
        "igorlfs/nvim-dap-view",
        opts = {
          winbar = {
            controls = {
              enabled = true,
            },
          },
        },
      },
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "nvim-neotest/nvim-nio" },
    enabled = false,
  },
  {
    "igorlfs/nvim-dap-view",
    ---@module 'dap-view'
    ---@type dapview.Config
    opts = {},
  },
}
