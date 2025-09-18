return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        sql = { "sql-formatter" },
        pgsql = { "sql-formatter" },
        xml = {
          "xmlformatter",
        },
        java = {
          "google-java-format",
        },
      },
      formatters = {
        sqlfluff = {
          command = "sqlfluff",
          args = { "format", "--dialect=postgres", "-" },
          stdin = true,
          cwd = function()
            return vim.fn.getcwd()
          end,
        },
      },
    },
  },
}
