return {
  {
    "williamboman/mason.nvim",
    opts = {
      registries = {
        "github:indika-dev/personal-mason-registry",
        "github:mason-org/mason-registry",
      },
      ensure_installed = {
        "jdtls",
        "java-test",
        "java-debug-adapter",
      },
    },
  },
}
