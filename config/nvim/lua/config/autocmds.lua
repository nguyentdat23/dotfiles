-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- attach blink to dap-repl
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "dap-repl", "dapui_watches", "dapui_hover" },
  callback = function()
    vim.b.completion = true
  end,
  desc = "Enable completion for DAP-REPL filetypes",
})
