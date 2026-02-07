return {
  "jake-stewart/multicursor.nvim",
  branch = "1.0",
  config = function()
    local mc = require("multicursor-nvim")
    mc.setup()

    local set = vim.keymap.set

    -- Add cursors above/below the main cursor.
    vim.keymap.set({ "n", "v" }, "<M-Up>", function()
      mc.addCursor("k")
    end)
    vim.keymap.set({ "n", "v" }, "<M-Down>", function()
      mc.addCursor("j")
    end)

    set({ "n", "x" }, "<leader><up>", function()
      mc.lineSkipCursor(-1)
    end)
    set({ "n", "x" }, "<leader><down>", function()
      mc.lineSkipCursor(1)
    end)

    -- Add and remove cursors with control + left click.
    vim.keymap.set("n", "<c-leftmouse>", mc.handleMouse)

    set({ "n", "x" }, "<leader>n", function()
      mc.matchAddCursor(1)
    end)
    set({ "n", "x" }, "<leader>s", function()
      mc.matchSkipCursor(1)
    end)
    set({ "n", "x" }, "<leader>N", function()
      mc.matchAddCursor(-1)
    end)
    set({ "n", "x" }, "<leader>S", function()
      mc.matchSkipCursor(-1)
    end)
  end,
}
