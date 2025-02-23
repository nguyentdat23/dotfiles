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
      -- use_default = false,
      style_map = {
        italic = {
          Comment = true,
          Todo = true,
          SpecialComment = true,
          ["@comment"] = true,
          ["@comment.documentation"] = true,
          ["@comment.error"] = true,
          ["@comment.warning"] = true,
          ["@comment.todo"] = true,
          ["@comment.hint"] = true,
          ["@comment.info"] = true,
          ["@comment.note"] = true,
          ["@lsp.type.comment"] = true,
          ["@lsp.type.comment.c"] = true,
          ["@lsp.type.comment.cpp"] = true,
          ["@string.documentation"] = true,
          LspCodeLens = true,
          LspInlayHint = true,
          StatusLineTermNC = false,
        },
      },
    },
  },
}
