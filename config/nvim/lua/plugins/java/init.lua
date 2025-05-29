-- This is the same as in lspconfig.configs.jdtls, but avoids
-- needing to require that when this module loads.
local java_filetypes = { "java", "properties" }

-- Utility function to extend or override a config table, similar to the way
-- that Plugin.opts works.
---@param config table
---@param custom function | table | nil
local function extend_or_override(config, custom, ...)
  if type(custom) == "function" then
    config = custom(config, ...) or config
  elseif custom then
    config = vim.tbl_deep_extend("force", config, custom) --[[@as table]]
  end
  return config
end

return {
  recommended = function()
    return LazyVim.extras.wants({
      ft = "java",
      root = {
        "build.gradle",
        "build.gradle.kts",
        "build.xml", -- Ant
        "pom.xml", -- Maven
        "settings.gradle", -- Gradle
        "settings.gradle.kts", -- Gradle
      },
    })
  end,

  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = { ensure_installed = { "java-debug-adapter", "java-test" } },
      },
    },
  },
  {
    "mfussenegger/nvim-jdtls",
    dependencies = { "folke/which-key.nvim" },
    ft = java_filetypes,
    opts = function()
      local cmd = { vim.fn.exepath("jdtls") }
      table.insert(cmd, "-Dlog.protocol=false")
      table.insert(cmd, "--jvm-arg=-Xms2G")

      if LazyVim.has("mason.nvim") then
        local lombok_jar = LazyVim.get_pkg_path("jdtls", "/lombok.jar")
        table.insert(cmd, string.format("--jvm-arg=-javaagent:%s", lombok_jar))
      end

      return {
        root_dir = LazyVim.lsp.get_raw_config("jdtls").default_config.root_dir,
        project_name = function(root_dir)
          return root_dir and vim.fs.basename(root_dir)
        end,

        jdtls_config_dir = function(project_name)
          return vim.fn.stdpath("cache") .. "/jdtls/config/" .. project_name
        end,
        jdtls_workspace_dir = function(project_name)
          return vim.fn.stdpath("cache") .. "/jdtls/workspace/" .. project_name
        end,
        cmd = cmd,
        full_cmd = function(opts)
          local fname = vim.api.nvim_buf_get_name(0)
          local root_dir = opts.root_dir(fname)
          local project_name = opts.project_name(root_dir)
          local cmd = vim.deepcopy(opts.cmd)
          if project_name then
            vim.list_extend(cmd, {
              "-configuration",
              opts.jdtls_config_dir(project_name),
              "-data",
              opts.jdtls_workspace_dir(project_name),
            })
          end
          return cmd
        end,
        dap = { hotcodereplace = "auto", config_overrides = {} },
        dap_main = {},
        test = true,
        settings = {
          java = {
            completion = {
              matchCase = "firstletter",
              maxResults = 50,
              importOrder = {
                "#",
                "java",
                "javax",
                "org",
                "com",
              },
            },
            contentProvider = { preferred = "fernflower" },
            flags = {
              allow_incremental_sync = false,
              server_side_fuzzy_completion = true,
            },
            maven = {
              downloadSources = true,
            },
            references = {
              includeDecompiledSources = true,
            },
            edit = {
              validateAllOpenBuffersOnChanges = false,
            },
          },
        },
      }
    end,
    config = function(_, opts)
      ---@type string[]
      local bundles = require("spring_boot").java_extensions()

      if LazyVim.has("mason.nvim") then
        local mason_registry = require("mason-registry")
        if opts.dap and LazyVim.has("nvim-dap") and mason_registry.is_installed("java-debug-adapter") then
          local java_dbg_path = LazyVim.get_pkg_path("java-debug-adapter")

          local jar_patterns = {
            java_dbg_path .. "/extension/server/com.microsoft.java.debug.plugin-*.jar",
          }
          -- java-test also depends on java-debug-adapter.
          if opts.test and mason_registry.is_installed("java-test") then
            local java_test_path = LazyVim.get_pkg_path("java-test")

            vim.list_extend(jar_patterns, {
              java_test_path .. "/extension/server/*.jar",
            })
          end
          for _, jar_pattern in ipairs(jar_patterns) do
            for _, bundle in ipairs(vim.split(vim.fn.glob(jar_pattern), "\n")) do
              table.insert(bundles, bundle)
            end
          end
        end
      end

      local function attach_jdtls()
        local fname = vim.api.nvim_buf_get_name(0)
        local extendedClientCapabilities = vim.tbl_deep_extend("force", require("jdtls").extendedClientCapabilities, {
          resolveAdditionalTextEditsSupport = true,
          progressReportProvider = false,
        })

        local config = extend_or_override({
          cmd = opts.full_cmd(opts),
          root_dir = opts.root_dir(fname),
          init_options = {
            bundles = bundles,
            extendedClientCapabilities = extendedClientCapabilities,
          },
          settings = opts.settings,
          capabilities = require("blink.cmp").get_lsp_capabilities(),
        }, opts.jdtls)

        require("jdtls").start_or_attach(config)

        local function first(glob_pattern)
          -- {list=1} ⇒ returns newline-separated list, we take the first entry
          return vim.split(vim.fn.glob(glob_pattern), "\n")[1] or ""
        end

        -- the Mason package root:
        local boot_pkg_root = LazyVim.get_pkg_path("vscode-spring-boot-tools")

        -- glob for *any* version of the exec-jar (works with Mason v2 layout)
        local boot_ls_path = first(boot_pkg_root .. "extension/language-server/spring-boot-language-server-*-exec.jar")

        require("spring_boot").setup({
          ls_path = boot_ls_path,
        })
      end

      vim.api.nvim_create_autocmd("FileType", {
        pattern = java_filetypes,
        callback = attach_jdtls,
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client.name == "jdtls" then
            local wk = require("which-key")
            wk.add({
              {
                mode = "n",
                buffer = args.buf,
                { "<leader>cx", group = "extract" },
                { "<leader>cxv", require("jdtls").extract_variable_all, desc = "Extract Variable" },
                { "<leader>cxc", require("jdtls").extract_constant, desc = "Extract Constant" },
                { "<leader>cgs", require("jdtls").super_implementation, desc = "Goto Super" },
                { "<leader>cgS", require("jdtls.tests").goto_subjects, desc = "Goto Subjects" },
                { "<leader>co", require("jdtls").organize_imports, desc = "Organize Imports" },
              },
            })
            wk.add({
              {
                mode = "v",
                buffer = args.buf,
                { "<leader>cx", group = "extract" },
                {
                  "<leader>cxm",
                  [[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]],
                  desc = "Extract Method",
                },
                {
                  "<leader>cxv",
                  [[<ESC><CMD>lua require('jdtls').extract_variable_all(true)<CR>]],
                  desc = "Extract Variable",
                },
                {
                  "<leader>cxc",
                  [[<ESC><CMD>lua require('jdtls').extract_constant(true)<CR>]],
                  desc = "Extract Constant",
                },
              },
            })

            if LazyVim.has("mason.nvim") then
              local mason_registry = require("mason-registry")

              if opts.dap and LazyVim.has("nvim-dap") and mason_registry.is_installed("java-debug-adapter") then
                require("jdtls").setup_dap(opts.dap)
                if opts.dap_main then
                  require("jdtls.dap").setup_dap_main_class_configs(opts.dap_main)

                  vim.api.nvim_create_autocmd("FileType", {
                    pattern = "dap-repl",
                    callback = function()
                      local clients = vim.lsp.get_active_clients({ name = "jdtls" })
                      for _, client in ipairs(clients) do
                        vim.lsp.buf_attach_client(0, client.id)
                      end
                    end,
                  })
                end
              end
            end

            -- User can set additional keymaps in opts.on_attach
            if opts.on_attach then
              opts.on_attach(args)
            end
          end
        end,
      })

      attach_jdtls()
    end,
  },
}
