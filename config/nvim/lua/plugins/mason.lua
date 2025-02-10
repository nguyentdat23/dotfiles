return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "jdtls",
        "vtsls",
        "java-test",
        "java-debug-adapter",
      },
    },
  },
}
