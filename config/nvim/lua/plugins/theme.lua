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
    config = function()
      require("catppuccin").setup({
        term_colors = true,
      })
    end,
  },
  {
    "jackplus-xyz/monaspace.nvim",
    lazy = false,
    opts = {
      -- Add your configuration here
    },
  },
}
