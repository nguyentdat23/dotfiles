return {
  { "vimpostor/vim-lumen" },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = function()
      ---@type CatppuccinOptions
      return {
        integrations = { blink_cmp = true },
        highlight_overrides = {
          all = function(colors)
            return {
              NeoTreeDirectoryIcon = { fg = colors.subtext1 },
              NeoTreeDirectoryName = { fg = colors.text },
              NeoTreeFileNameOpened = { bg = colors.subtext0 },
              NeoTreeGitModified = { fg = colors.sky },
              LineNr = {
                fg = colors.subtext1,
              },
              Keyword = { style = {
                "italic",
              } },
              Function = {
                style = {
                  "bold",
                },
              },
              String = {
                fg = colors.rosewater,
                style = {
                  "italic",
                },
              },
              ["@keyword.return"] = {
                fg = colors.text,
              },
              ["@variable.member"] = {
                fg = colors.text,
              },
              Type = {
                fg = colors.mauve,
                style = {
                  "bold",
                },
              },
              NeoTreeCursorLine = {
                fg = colors.blue,
                style = {
                  "bold",
                  "italic",
                },
              },
              NeoTreeIndentMarker = { fg = colors.surface1 },
              CursorLine = { bg = colors.mantle },
            }
          end,
        },
        color_overrides = {
          latte = {
            rosewater = "#4b94ab",
            flamingo = "#d7644a",
            pink = "#d65a71",
            mauve = "#5da55a",
            red = "#d76052",
            maroon = "#df636e",
            peach = "#4679b6",
            yellow = "#d79700",
            green = "#47a457",
            teal = "#3a9a7f",
            sky = "#4c94b5",
            sapphire = "#43856f",
            blue = "#e38049",
            lavender = "#755646",
            text = "#57504d",
            subtext1 = "#7f7674",
            subtext0 = "#99908e",
            overlay2 = "#ada7a5",
            overlay1 = "#a9a3a1",
            overlay0 = "#b0aaa8",
            surface2 = "#f1ebe8",
            surface1 = "#fae7dc",
            surface0 = "#fefaf8",
            base = "#fefcfa",
            mantle = "#fcf8f7",
            crust = "#e5e2df",
          },
          frappe = {
            rosewater = "#61c0a2",
            flamingo = "#ce8cb0",
            pink = "#d65a71",
            mauve = "#80b86c",
            red = "#f76c5c",
            maroon = "#eea665",
            peach = "#e5797b",
            yellow = "#ddb660",
            green = "#6cbf78",
            teal = "#49ba9b",
            sky = "#66b1d3",
            sapphire = "#83bc6f",
            blue = "#e3845c",
            lavender = "#e0b961",
            text = "#c8c4b7",
            subtext1 = "#a7a397",
            subtext0 = "#9c998c",
            overlay2 = "#9e9477",
            overlay1 = "#877d61",
            overlay0 = "#817f74",
            surface2 = "#47463f",
            surface1 = "#535250",
            surface0 = "#232221",
            base = "#353535",
            mantle = "#3a3a3a",
            crust = "#47463f",
          },
          mocha = {
            rosewater = "#61c0a2",
            flamingo = "#ce8cb0",
            pink = "#d65a71",
            mauve = "#83bc6f",
            red = "#f76c5c",
            maroon = "#eea665",
            peach = "#e5797b",
            yellow = "#ddb660",
            green = "#6cbf78",
            teal = "#49ba9b",
            sky = "#66b1d3",
            sapphire = "#83bc6f",
            blue = "#e3845c",
            lavender = "#e0b961",
            text = "#c8c4b7",
            subtext1 = "#a7a397",
            subtext0 = "#9c998c",
            overlay2 = "#9e9477",
            overlay1 = "#877d61",
            overlay0 = "#68665c",
            surface2 = "#47463f",
            surface1 = "#504f4d",
            surface0 = "#232221",
            base = "#141414",
            mantle = "#1a1a1a",
            crust = "#3a3933",
          },
        },
      }
    end,
  },
}
