return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      "artemave/workspace-diagnostics.nvim",
    },
    opts = {
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
            },
          },
        },
        basedpyright = {
          settings = {
            basedpyright = {
              analysis = {
                typeCheckingMode = "standard",
                diagnosticSeverityOverrides = {
                  reportUnknownVariableType = "none", -- Blasts away the yellow list warnings
                },
              },
            },
          },
        },
        html = {},
        cssls = {},
        qmlls = {},
        ts_ls = {
          on_attach = function(client, bufnr)
            if client:supports_method("workspace/diagnostic", bufnr) then
              vim.lsp.buf.workspace_diagnostics({ client_id = client.id })
            else
              require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
            end
          end
        },
      },
    },
    config = function(_, opts)
      require("mason").setup()

      require("mason-lspconfig").setup({
        ensure_installed = {
          "basedpyright",
          "html",
          "cssls",
          "qmlls",
          "ts_ls",
          "lua_ls",
        },
      })

      for server, config in pairs(opts.servers) do
        --vim.lsp.config(server, config) -- Set up the options
        vim.lsp.config(server, config)
        vim.lsp.enable(server) -- Turn the server on
      end
    end
  }
}
