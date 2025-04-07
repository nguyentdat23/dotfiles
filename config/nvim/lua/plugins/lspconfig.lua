return {
  { "LazyVim/LazyVim", import = "lazyvim.plugins" },
  {

    "neovim/nvim-lspconfig",
    event = "LazyFile",
    dependencies = {
      "mason.nvim",
      { "williamboman/mason-lspconfig.nvim", config = function() end },
    },
    opts = {
      diagnostics = {
        underline = true,
        virtual_text = {
          spacing = 2,
          prefix = "icons",
        },
      },
      inlay_hints = {
        enabled = false,
      },
    },
  },
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
