return {
  {
    "saghen/blink.cmp",
    version = "*",
    dependencies = {
      "mikavilpas/blink-ripgrep.nvim",
    },
    opts_extend = { "sources.default" },
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        providers = {
          ripgrep = {
            module = "blink-ripgrep",
            name = "Ripgrep",
            ---@module "blink-ripgrep"
            ---@type blink-ripgrep.Options
            opts = {
              project_root_marker = { ".git", "package.json", ".root", "pom.xml" },
            },
          },
        },
      },
      completion = {
        ghost_text = {
          enabled = false,
        },
        list = {
          selection = {
            auto_insert = false,
          },
        },
      },
    },
  },
}
