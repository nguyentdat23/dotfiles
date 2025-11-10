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
        buffer_selected = {
          bold = true,
          italic = true,
        },
      },
    },
  },
}
