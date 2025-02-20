return {
  { "LazyVim/LazyVim", import = "lazyvim.plugins" },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "html",
        "javascript",
        "lua",
        "tsx",
        "typescript",
        "vim",
        "java",
      },
    },
  },
}
