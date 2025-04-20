return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {
      options = {
        separator_style = "thick", -- Options: "slant", "thick", "thin", or custom
      },
      highlights = {
        -- Customize highlight groups to enhance the rounded appearance
        buffer_selected = {
          gui = "bold",
          -- Add other styling as needed
        },
        -- Define other highlight groups as needed
      },
    },
  },
}
