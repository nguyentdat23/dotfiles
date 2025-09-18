return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    init = function()
      local bufline = require("catppuccin.groups.integrations.bufferline")

      function bufline.get()
        return bufline.get_theme()
      end
    end,
  },
}
