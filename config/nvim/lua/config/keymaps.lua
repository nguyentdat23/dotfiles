-- Multicursor
local mc = require("multicursor-nvim")

-- Add and remove cursors with control + left click.
vim.keymap.set("n", "<c-leftmouse>", mc.handleMouse)

vim.keymap.set({ "n", "v" }, "<c-q>", function()
  if mc.cursorsEnabled() then
    -- Stop other cursors from moving.
    -- This allows you to reposition the main cursor.
    mc.disableCursors()
  else
    mc.addCursor()
  end
end)

vim.keymap.set("n", "<esc>", function()
  if not mc.cursorsEnabled() then
    mc.enableCursors()
  elseif mc.hasCursors() then
    mc.clearCursors()
  else
    -- Default <esc> handler.
  end
end)

-- Align cursor columns.
vim.keymap.set("n", "<leader>a", mc.alignCursors)

-- Split visual selections by regex.
vim.keymap.set("v", "S", mc.splitCursors)

-- Append/insert for each line of visual selections.
vim.keymap.set("v", "<M-I>", mc.insertVisual)
vim.keymap.set("v", "<M-A>", mc.appendVisual)

-- match new cursors within visual selections by regex.
vim.keymap.set("v", "M", mc.matchCursors)

-- Rotate visual selection contents.
vim.keymap.set("v", "<leader>t", function()
  mc.transposeCursors(1)
end)
vim.keymap.set("v", "<leader>T", function()
  mc.transposeCursors(-1)
end)

-- show duration to save current buffer
vim.keymap.set("", "<C-s>", function()
  local start_time = vim.loop.hrtime()
  vim.cmd("write")
  local elapsed = (vim.loop.hrtime() - start_time) / 1e6

  print(string.format("Saved in %.2f ms", elapsed))
end, { desc = "Save with timing" })

-- typescript-tools: remove all unused
vim.keymap.set("", "<leader>cm", function()
  vim.cmd("TSToolsRemoveUnused")
end, { desc = "TS remove unused" })
