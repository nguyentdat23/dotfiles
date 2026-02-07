-- Allow clipboard copy paste in neovim
vim.api.nvim_set_keymap("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })

-- Set theme light/dark using lumen-nvim
vim.g.lumen_light_colorscheme = "catppuccin-mocha"
vim.g.lumen_dark_colorscheme = "catppuccin-macchiato"

vim.g.dbs = {
  { name = "eoffice_dev", url = "postgres://dev_eoffice:658JyBlPxWEuH15@10.0.193.182:5432/sit_eoffice_new" },
  { name = "eoffice_uat", url = "postgres://dev_eoffice:eT276O9bmLU8Zos@10.0.26.110:5432/uat_eoffice" },
}

-- NEOVIDE CONFIGURATIONS
if vim.g.neovide then
  -- Font & Scaling
  vim.opt.guifont = "Iosevka Nerd Font Mono:h18" -- Set your preferred font and size
  vim.g.neovide_scale_factor = 1.2 -- Default scale, adjust for zoom

  vim.g.neovide_cursor_vfx_mode = "railgun"
end
