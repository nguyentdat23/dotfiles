return {
  { "vimpostor/vim-lumen" },
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
                -- IblIndent = { fg = colors.overlay0 },
                -- IblScope = { fg = colors.overlay0 },
              }
            end,
          },
          frappe = {
            rosewater = "#f2836f",
            flamingo = "#d08bc4",
            pink = "#e17167",
            mauve = "#a4aa5f",
            red = "#da6b5d",
            maroon = "#76b57f",
            peach = "#977db1",
            yellow = "#e49557",
            green = "#9ab868",
            teal = "#9eb46f",
            sky = "#80b8ba",
            sapphire = "#d5ba8d",
            blue = "#d29f60",
            lavender = "#d17c51",
            text = "#b9b6ab",
            subtext1 = "#a7a397",
            subtext0 = "#9c998c",
            overlay2 = "#c6bda3",
            overlay1 = "#b8ae91",
            overlay0 = "#68665c",
            surface2 = "#47463f",
            surface1 = "#504f4d",
            surface0 = "#232221",
            base = "#1c1c1c",
            mantle = "#191919",
            crust = "#3a3933",
          },
        },
      }
    end,
  },
}
