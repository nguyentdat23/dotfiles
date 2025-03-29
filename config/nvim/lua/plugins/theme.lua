return {
  { "vimpostor/vim-lumen" },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = function()
      ---@type CatppuccinOptions
      return {
        highlight_overrides = {
          latte = function(colors)
            return {
              NeoTreeDirectoryIcon = { fg = colors.overlay0 },
              NeoTreeFileNameOpened = { bg = colors.subtext0 },
              NeoTreeCursorLine = {
                fg = colors.text,
                bg = colors.surface1,
                style = {
                  "bold",
                },
              },
              NeoTreeIndent = { fg = colors.surface0 },
              CursorLine = { bg = colors.mantle },
            }
          end,
        },
        color_overrides = {
          mocha = {
            rosewater = "#dc8a78",
            flamingo = "#dd7878",
            pink = "#dd7878",
            mauve = "#a49ae8",
            red = "#f07a7f",
            maroon = "#e48684",
            peach = "#ef7e7c",
            yellow = "#eb9058",
            green = "#73cf93",
            teal = "#1db0b8",
            sky = "#56a2cd",
            sapphire = "#4184a2",
            blue = "#83abed",
            lavender = "#a19cd2",
          },
          latte = {
            rosewater = "#dc8a78",
            flamingo = "#dd7878",
            pink = "#dd7878",
            mauve = "#8475d1",
            red = "#e75f68",
            maroon = "#d86363",
            peach = "#ea6062",
            yellow = "#de8044",
            green = "#53a872",
            teal = "#179299",
            sky = "#56a2cd",
            sapphire = "#4184a2",
            blue = "#5080d2",
            lavender = "#5c5f77",
            text = "#585c78",
            subtext1 = "#5c5f77",
            subtext0 = "#6c6f85",
            overlay2 = "#7c7f93",
            overlay1 = "#8c8fa1",
            overlay0 = "#9ca0b0",
            surface2 = "#c0c3cf",
            surface1 = "#cbcfd8",
            surface0 = "#e1e4ea",
            base = "#eff1f5",
            mantle = "#e6e9ef",
            crust = "#acb0be",
          },
        },
      }
    end,
  },
}
