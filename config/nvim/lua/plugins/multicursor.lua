return {
  "jake-stewart/multicursor.nvim",
  branch = "1.0",
  config = function()
    local mc = require("multicursor-nvim")
    -- Add or skip cursor above/below the main cursor.
    set({ "n", "x" }, "<up>", function()
      mc.lineAddCursor(-1)
    end)
    set({ "n", "x" }, "<down>", function()
      mc.lineAddCursor(1)
    end)
    set({ "n", "x" }, "<leader><up>", function()
      mc.lineSkipCursor(-1)
    end)
    set({ "n", "x" }, "<leader><down>", function()
      mc.lineSkipCursor(1)
    end)

    -- Add or skip adding a new cursor by matching word/selection
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

    mc.setup()
  end,
}
