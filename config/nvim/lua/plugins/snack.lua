return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bigfile = { enabled = true },
      dashboard = { enabled = true },
      explorer = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      picker = {
        enabled = true,
        sources = {
          files = {
            layout = {
              preview = false,
              layout = {
                box = "vertical",
                backdrop = false,
                width = 0.5,
                height = 0.5,
                border = "none",
              },
            },
          },
          grep = {
            hidden = true,
            layout = {
              reverse = true,
              layout = {
                box = "vertical",
                backdrop = false,
                width = 0.8,
                height = 0.9,
                border = "none",
                {
                  box = "vertical",
                  { win = "list", height = 0.3, title = " Results ", title_pos = "center", border = "rounded" },
                  {
                    win = "input",
                    height = 1,
                    border = "rounded",
                    title = "{title} {live} {flags}",
                    title_pos = "center",
                  },
                  {
                    win = "preview",
                    title = "{preview:Preview}",
                    height = 0.7,
                    border = "rounded",
                    title_pos = "center",
                  },
                },
              },
            },
          },
        },
      },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    },
  },
}
