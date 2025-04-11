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
        "vtsls",
        "java-test",
        "java-debug-adapter",
      },
    },
  },
}
