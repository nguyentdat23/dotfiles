return {
  { "vimpostor/vim-lumen" },
  {
    "sainnhe/edge",
    lazy = false,
    priority = 1000,
    opts = {
      better_performance = 1,
      enable_italic = 1,
    },
    config = function()
      vim.cmd.colorscheme("edge")
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = function()
      ---@type CatppuccinOptions
      return {
        background = {
          dark = "frappe",
          light = "latte",
        },
        color_overrides = {
          highlight_overrides = {
            all = function(colors)
              return {
                IblIndent = { fg = colors.surface0 },
                IblScope = { fg = colors.overlay0 },
              }
            end,
          },
          latte = {
            rosewater = "#dc8a78",
            flamingo = "#dd7878",
            pink = "#ea76cb",
            mauve = "#9a61f9",
            red = "#d20f39",
            maroon = "#e64553",
            peach = "#fe640b",
            yellow = "#e79832",
            green = "#39ab60",
            teal = "#24aad9",
            sky = "#5ca1f3",
            sapphire = "#1aab8f",
            blue = "#2d6be5",
            lavender = "#5767ef",
          },
        },
      }
    end,
  },
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
  },
  {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
    config = function() end,
  },
  {
    "ayu-theme/ayu-vim",
    name = "ayu-vim",
    priority = 1000,
  },
}
