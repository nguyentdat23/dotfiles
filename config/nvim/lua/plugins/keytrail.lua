return {
  {
    "jfryy/keytrail.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("keytrail").setup()
    end,
  },
}
