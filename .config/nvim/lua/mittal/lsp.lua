-- ~/.config/nvim/lua/plugins/lsp.lua
require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = {
    "lua_ls",         -- Lua Language Server
    "clangd",         -- C/C++ Language Server
    "yamlls",         -- YAML Language Server
    "pyright",        -- Python Language Server
    "ansiblels",      -- Ansible Language Server
    "jsonls",         -- JSON Language Server
    "taplo"           -- TOML Language Server
  }
}

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Setup language servers with configurations
lspconfig.lua_ls.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }
      }
    }
  }
}

lspconfig.clangd.setup {
  capabilities = capabilities,
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--completion-style=detailed",
    "--function-arg-placeholders=true",  -- FIXED: Added =true
    "--header-insertion=iwyu",           -- Added for better includes
    "--fallback-style=llvm",              -- Added for consistent formatting
    "--pch-storage=memory",               -- Added for better performance
  },
  init_options = {
    usePlaceholders = true,
    completeUnimported = true,
    clangdFileStatus = true,
  },
  root_dir = lspconfig.util.root_pattern(
    "compile_commands.json",
    "compile_flags.txt",
    ".git",
    "CMakeLists.txt",
    "Makefile"
  ),
}

lspconfig.yamlls.setup {
  capabilities = capabilities,
  settings = {
    yaml = {
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        ["https://json.schemastore.org/github-action.json"] = "/action.{yml,yaml}",
        ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = "/.gitlab-ci.yml",
        ["https://json.schemastore.org/circleciconfig.json"] = "/.circleci/config.yml",
      }
    }
  }
}

lspconfig.pyright.setup {
  capabilities = capabilities,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
        autoSearchPaths = true
      }
    }
  }
}

lspconfig.ansiblels.setup {
  capabilities = capabilities,
  filetypes = { "yaml.ansible" }
}

lspconfig.jsonls.setup {
  capabilities = capabilities
}

lspconfig.taplo.setup {
  capabilities = capabilities
}

-- Keymaps
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  end
})
