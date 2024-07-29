local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
-- Sntup language servers.
local lspconfig = require('lspconfig')
lspconfig.pyright.setup {}
lspconfig.clangd.setup {}
lspconfig.tsserver.setup {}
lspconfig.prismals.setup {}
lspconfig.cssls.setup {
    capabilities = capabilities
}
lspconfig.golangci_lint_ls.setup {}
lspconfig.rust_analyzer.setup {
  settings = {
    ['rust-analyzer'] = {
            diagnostics = {
                enable = true,
                experimental = {
                    enable = true,
                },
            },
    },
  },
}
-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<leader>lD', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>ld', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        local opts = {buffer = ev.buf}
        vim.keymap.set('n', 'gd', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        -- vim.keymap
        --     .set('n', '<Leader>sa', vim.lsp.buf.add_workspace_folder, opts)
        -- vim.keymap.set('n', '<Leader>sr', vim.lsp.buf.remove_workspace_folder,
        --                opts)
        -- vim.keymap.set('n', '<Leader>sl', function()
        --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        -- end, opts)
        -- vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<Leader>lr', vim.lsp.buf.rename, opts)
        vim.keymap.set({'n', 'v'}, '<Leader>la', vim.lsp.buf.code_action, opts)
        -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<Leader>lf',
                       function() vim.lsp.buf.format {async = true} end, opts)
    end
})


--return {
--    "neovim/nvim-lspconfig",
--    dependencies = {
--        "williamboman/mason.nvim",
--        "williamboman/mason-lspconfig.nvim",
--        "hrsh7th/cmp-nvim-lsp",
--        "hrsh7th/cmp-buffer",
--        "hrsh7th/cmp-path",
--        "hrsh7th/cmp-cmdline",
--        "hrsh7th/nvim-cmp",
--        "L3MON4D3/LuaSnip",
--        "saadparwaiz1/cmp_luasnip",
--        "j-hui/fidget.nvim",
--    },
--
--    config = function()
--        local cmp = require('cmp')
--        local cmp_lsp = require("cmp_nvim_lsp")
--        local capabilities = vim.tbl_deep_extend(
--            "force",
--            {},
--            vim.lsp.protocol.make_client_capabilities(),
--            cmp_lsp.default_capabilities())
--
--        require("fidget").setup({})
--        require("mason").setup()
--        require("mason-lspconfig").setup({
--            ensure_installed = {
--                "lua_ls",
--                "rust_analyzer",
--                "gopls",
--            },
--            handlers = {
--                function(server_name) -- default handler (optional)
--                    require("lspconfig")[server_name].setup {
--                        capabilities = capabilities
--                    }
--                end,
--
--                zls = function()
--                    local lspconfig = require("lspconfig")
--                    lspconfig.zls.setup({
--                        root_dir = lspconfig.util.root_pattern(".git", "build.zig", "zls.json"),
--                        settings = {
--                            zls = {
--                                enable_inlay_hints = true,
--                                enable_snippets = true,
--                                warn_style = true,
--                            },
--                        },
--                    })
--                    vim.g.zig_fmt_parse_errors = 0
--                    vim.g.zig_fmt_autosave = 0
--
--                end,
--                ["lua_ls"] = function()
--                    local lspconfig = require("lspconfig")
--                    lspconfig.lua_ls.setup {
--                        capabilities = capabilities,
--                        settings = {
--                            Lua = {
--                                runtime = { version = "Lua 5.1" },
--                                diagnostics = {
--                                    globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
--                                }
--                            }
--                        }
--                    }
--                end,
--            }
--        })
--
--        local cmp_select = { behavior = cmp.SelectBehavior.Select }
--
--        cmp.setup({
--            snippet = {
--                expand = function(args)
--                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
--                end,
--            },
--            mapping = cmp.mapping.preset.insert({
--                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
--                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
--                ["<C-Space>"] = cmp.mapping.complete(),
--            }),
--            sources = cmp.config.sources({
--                { name = 'nvim_lsp' },
--                { name = 'luasnip' }, -- For luasnip users.
--            }, {
--                { name = 'buffer' },
--            })
--        })
--
--        vim.diagnostic.config({
--            -- update_in_insert = true,
--            float = {
--                focusable = false,
--                style = "minimal",
--                border = "rounded",
--                source = "always",
--                header = "",
--                prefix = "",
--            },
--        })
--    end
--}
