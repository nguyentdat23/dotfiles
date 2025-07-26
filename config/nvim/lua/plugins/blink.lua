return {
  {
    "saghen/blink.compat",
    version = "2.*",
    lazy = true,
    opts = {},
  },
  {
    "saghen/blink.cmp",
    version = "*",
    dependencies = {
      "mikavilpas/blink-ripgrep.nvim",
      "rcarriga/cmp-dap",
      "Kaiser-Yang/blink-cmp-avante",
    },
    opts_extend = { "sources.default" },
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        per_filetype = {
          codecompanion = { "codecompanion" },
          ["dap-repl"] = {
            "dap",
            score_offset = 200,
          },
          ["dapui_watches"] = { "dap", score_offset = 200 },
          ["dapui_hover"] = { "dap", score_offset = 200 },
          sql = { "snippets", "dadbod", "buffer" },
        },
        providers = {
          avante = {
            module = "blink-cmp-avante",
            name = "Avante",
            opts = {},
          },
          ripgrep = {
            module = "blink-ripgrep",
            name = "Ripgrep",
            opts = {
              project_root_marker = { ".git", "package.json", ".root", "pom.xml" },
            },
          },
          dap = {
            name = "dap",
            module = "blink.compat.source",
            max_items = 20,

            enabled = function()
              return require("cmp_dap").is_dap_buffer()
            end,
            transform_items = function(_, items)
              return vim.tbl_filter(function(item)
                return item.kind ~= require("blink.cmp.types").CompletionItemKind.Module
              end, items)
            end,
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
  config = function() end,
}
