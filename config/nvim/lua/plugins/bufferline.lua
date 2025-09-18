return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {
      options = {
        separator_style = "cus", -- Options: "slant", "thick", "thin", or custom
        indicator = {
          style = "underline",
        },
      },
      highlights = {
        -- Customize highlight groups to enhance the rounded appearance
        buffer_selected = {
          bold = true,
          italic = true,
          -- Add other styling as needed
        },
        -- Define other highlight groups as needed
      },
    },
  },
}
