return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    lazy = false, -- neo-tree will lazily load itself
    ---@module "neo-tree"
    ---@type neotree.Config?
    opts = {
      default_component_configs = {
        container = {
          enable_character_fade = true,
        },
        -- icon = {
        --   folder_closed = "",
        --   folder_open = "󰝰",
        --   folder_empty = "󰜌",
        -- },
        name = {
          use_git_status_colors = false,
        },
      },
      popup_border_style = "NC", -- or "" to use 'winborder' on Neovim v0.11+
      -- fill any relevant options here
      filesystem = {
        group_empty_dirs = true,
      },
      window = {
        mappings = {
          ["R"] = {
            function(state)
              local node = state.tree:get_node()
              local path = node:get_id()

              require("snacks").picker("grep", {
                cwd = path,
              })
            end,
            desc = "live_grep in current dir",
          },
          ["F"] = {
            function(state)
              local node = state.tree:get_node()
              local path = node:get_id()

              require("snacks").files("files", {
                cwd = path,
              })
            end,
            desc = "live_grep in current dir",
          },

          ["/"] = {
            function(state)
              require("snacks").picker("files", {
                layout = {
                  hidden = { "preview" },
                  width = 0.5,
                },
              })
            end,
            desc = "live_grep in current dir",
          },
        },
      },
    },
  },
}
