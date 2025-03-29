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
          lsp = {
            score_offset = 10,
          },
          ripgrep = {
            module = "blink-ripgrep",
            name = "Ripgrep",
            ---@module "blink-ripgrep"
            ---@type blink-ripgrep.Options
            opts = {
              prefix_min_len = 3,
              context_size = 50,
              max_filesize = "512K",
              project_root_marker = { ".git", "package.json", ".root", "pom.xml" },
              search_casing = "--ignore-case",
              additional_rg_options = {},
              fallback_to_regex_highlighting = true,
              ignore_paths = {},

              debug = false,
            },
          },
        },
      },
      appearance = {
        use_nvim_cmp_as_default = true,
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
