return {
  {
    "ibhagwan/fzf-lua",
    cmd = "FzfLua",
    opts = {
      winopts = {
        layout = "vertical",
        -- height is number of items minus 15 lines for the preview, with a max of 80% screen height
        preview = {
          hidden = "hidden",
        },
      },
      defaults = {
        formatter = "path.filename_first",
      },
    },
  },
}
