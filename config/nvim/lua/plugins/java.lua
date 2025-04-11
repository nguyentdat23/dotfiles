return {
  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" }, -- Load only for Java files
    dependencies = {
      "mfussenegger/nvim-dap", -- Optional: for debugging support
      -- Add spring-boot plugin if you're using it (ensure it's installed)
      -- Replace with actual repo if needed, e.g., "someone/spring-boot.nvim"
    },
    config = function()
      local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
      local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspaces/" .. project_name
      local jdtls_path = require("mason-registry").get_package("jdtls"):get_install_path()
      local vs_spring_boot_tools = require("mason-registry").get_package("vscode-spring-boot-tools"):get_install_path()

      local lombok_path = jdtls_path .. "/lombok.jar"
      local equinox_launcher_path = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")

      local jdtls = require("jdtls")
      local extendedClientCapabilities = jdtls.extendedClientCapabilities

      local jdtls_config = {
        cmd = {
          "java",
          "-Declipse.application=org.eclipse.jdt.ls.core.id1",
          "-Dosgi.bundles.defaultStartLevel=4",
          "-Declipse.product=org.eclipse.jdt.ls.core.product",
          "-Dlog.protocol=true",
          "-Dlog.level=ALL",
          "-Xmx2g",
          "--add-modules=ALL-SYSTEM",
          "--add-opens",
          "java.base/java.util=ALL-UNNAMED",
          "--add-opens",
          "java.base/java.lang=ALL-UNNAMED",
          "-javaagent:" .. lombok_path,
          "-jar",
          equinox_launcher_path,
          "-configuration",
          jdtls_path .. "/config_mac_arm",
          "-data",
          workspace_dir,
        },
        root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),
        settings = {
          java = {
            server = { launchMode = "Hybrid" },
            completion = {
              enabled = true,
              guessMethodArguments = true,
            },
            signatureHelp = { enabled = true },
            format = {
              settings = {
                url = "~/Developer/config/java-google-style.xml",
                profile = "GoogleStyle",
              },
            },
            maven = {
              downloadSources = true,
            },
            references = {
              includeDecompiledSources = true,
            },
            configuration = {
              runtimes = {
                {
                  name = "Java-21",
                  path = "/usr/bin/java",
                },
              },
            },
            redhat = { telemetry = { enabled = false } },
          },
        },
        init_options = {
          extendedClientCapabilities = extendedClientCapabilities,
          -- Spring Boot extensions (uncomment if using spring_boot.nvim)
          bundles = require("spring_boot").java_extensions(),
        },
        -- Optional: Customize handlers or capabilities
        handlers = {
          ["language/status"] = function() end, -- Suppress status messages
        },
      }

      -- Automatically start jdtls for Java files
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "java",
        callback = function()
          jdtls.start_or_attach(jdtls_config)
          -- Initialize Spring Boot commands (uncomment if using spring_boot.nvim)
          require("spring_boot").setup({
            ls_path = vs_spring_boot_tools .. "/extension/language-server",
          })
        end,
      })
    end,
  },
  {
    "JavaHello/spring-boot.nvim",
    ft = "java",
    dependencies = {
      "mfussenegger/nvim-jdtls", -- or nvim-java, nvim-lspconfig
    },
  },
}
