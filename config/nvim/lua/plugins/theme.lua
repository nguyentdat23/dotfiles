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
          all = function(colors)
            return {
              NeoTreeDirectoryIcon = { fg = colors.subtext1 },
              NeoTreeDirectoryName = { fg = colors.text },
              NeoTreeFileNameOpened = { bg = colors.subtext0 },
              NeoTreeGitModified = { fg = colors.sky },
              LineNr = {
                fg = colors.subtext1,
              },
              Keyword = { fg = colors.pink, style = {
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
              ["@variable.member"] = {
                fg = colors.text,
              },
              Type = {
                fg = colors.sapphire,
                style = {
                  "bold",
                },
              },
              NeoTreeCursorLine = {
                fg = colors.peach,
                bg = colors.surface0,
                style = {
                  "bold",
                },
              },
              NeoTreeIndentMarker = { fg = colors.surface1 },
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
            rosewater = "#5090b9",
            flamingo = "#d7644a",
            pink = "#d65a71",
            mauve = "#6f802c",
            red = "#e55142",
            maroon = "#e56464",
            peach = "#d04946",
            yellow = "#e19b3f",
            green = "#4d8d56",
            teal = "#3a9a7f",
            sky = "#4184a2",
            sapphire = "#528555",
            blue = "#c9611d",
            lavender = "#ca7b37",
            text = "#615a57",
            subtext1 = "#7f7674",
            subtext0 = "#99908e",
            overlay2 = "#ada7a5",
            overlay1 = "#c0bbb9",
            overlay0 = "#b0aaa8",
            surface2 = "#e4d7d1",
            surface1 = "#eae1dc",
            surface0 = "#f3ece9",
            base = "#fcfaf8",
            mantle = "#f5f2ef",
            crust = "#e5e2df",
          },
          frappe = {
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
