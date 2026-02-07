return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      interactions = {
        chat = {
          adapter = "gemini_cli",
        },
      },
      adapters = {
        acp = {
          kimi_cli = function()
            return require("codecompanion.adapters").extend("kimi_cli", {
              commands = {
                default = {
                  "kimi",
                },
              },
            })
          end,
        },
      },
    },
  },
}
