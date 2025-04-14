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
      explorer = { enabled = false },
      indent = {
        indent = {
          priority = 1,
          enabled = true, -- enable indent guides
          char = "│",
          only_scope = true, -- only show indent guides of the scope
          only_current = true, -- only show indent guides in the current window
          hl = { "SnacksIndent3", "SnacksIndent5", "SnacksIndent6" }, ---@type string|string[] hl groups for indent guides
        },
        ---@class snacks.indent.animate: snacks.animate.Config
        ---@field enabled? boolean
        ---@field style? "out"|"up_down"|"down"|"up"
        animate = {
          enabled = vim.fn.has("nvim-0.10") == 1,
          style = "up_down",
          easing = "linear",
          duration = {
            step = 20, -- ms per step
            total = 500, -- maximum duration
          },
        },
        ---@class snacks.indent.Scope.Config: snacks.scope.Config
        scope = {
          enabled = true, -- enable highlighting the current scope
          priority = 200,
          char = "┊",
          underline = false, -- underline the start of the scope
          only_current = true, -- only show scope in the current window
          hl = "SnacksIndentScope", ---@type string|string[] hl group for scopes
        },
        chunk = {
          -- when enabled, scopes will be rendered as chunks, except for the
          -- top-level scope which will be rendered as a scope.
          enabled = true,
          -- only show chunk scopes in the current window
          only_current = true,
          priority = 200,
          hl = "SnacksIndentChunk", ---@type string|string[] hl group for chunk scopes
          char = {
            corner_top = "╭",
            corner_bottom = "╰",
            horizontal = "─",
            vertical = "┊",
            arrow = ">",
          },
        },
        filter = function(buf)
          return vim.g.snacks_indent ~= false and vim.b[buf].snacks_indent ~= false and vim.bo[buf].buftype == ""
        end,
      },
      input = { enabled = true },
      picker = {
        enabled = true,
        sources = {
          files = {
            layout = {
              preview = false,
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
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    },
  },
}
