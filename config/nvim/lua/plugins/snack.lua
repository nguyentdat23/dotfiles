local snacks = require("snacks")
return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      picker = {

        sources = {
          files = {
            layout = {
              layout = {
                box = "horizontal",
                backdrop = false,
                width = 0.65,
                height = 0.75,
                border = "none",
                {
                  box = "vertical",
                  {
                    win = "input",
                    height = 1,
                    border = true,
                    title = "{title} {live} {flags}",
                    title_pos = "center",
                  },
                  { win = "list", title = " Results ", title_pos = "center", border = true },
                },
              },
            },
          },
          grep = {
            layout = {
              preset = "telescope",
              layout = {
                reverse = true,
                layout = {
                  box = "horizontal",
                  backdrop = false,
                  width = 0.8,
                  height = 0.9,
                  border = "none",
                  {
                    box = "vertical",
                    width = 0.75,
                    { win = "list", title = " Results ", title_pos = "center", border = true },
                    {
                      win = "input",
                      height = 1,
                      border = true,
                      title = "{title} {live} {flags}",
                      title_pos = "center",
                    },
                  },
                  {
                    win = "preview",
                    title = "{preview:Preview}",
                    width = 1,
                    border = true,
                    title_pos = "center",
                  },
                },
              },
            },
          },
        },
      },

      indent = {
        indent = {
          priority = 1,
          enabled = true, -- enable indent guides
          char = "│",
          only_scope = true,
          only_current = true,
          hl = { "SnacksIndent3", "SnacksIndent5", "SnacksIndent6" },
        },
        animate = {
          enabled = vim.fn.has("nvim-0.10") == 1,
          style = "up_down",
          easing = "linear",
          duration = {
            step = 20, -- ms per step
            total = 200, -- maximum duration
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
          enabled = true,
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
    },
  },
}
