return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {
      options = {
        separator_style = "cus",
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
