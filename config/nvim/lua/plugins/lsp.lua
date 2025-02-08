return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = false,
      },
      -- The below is to ensure eslint and eslint prettier plugin don't collide
      -- https://www.lazyvim.org/configuration/recipes#add-eslint-and-use-it-for-formatting
      servers = {
        jdtls = {
          root_dir = require("lspconfig").util.root_pattern(
            "settings.gradle",
            "settings.gradle.kts",
            "pom.xml",
            "build.gradle",
            "mvnw",
            "gradlew",
            "build.gradle",
            "build.gradle.kts",
            ".git"
          ),
        },
      },
      -- The below may no longer be needed now that LazyVim has been updated to v10
      setup = {},
    },
  },
}
