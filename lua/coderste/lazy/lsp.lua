local secrets = require("coderste.secrets")

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
    },

    config = function()
        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "gopls",
                -- "phpactor",
                "intelephense",
                "pyright",
                "ts_ls",
                "terraformls",
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,

                -- ["phpactor"] = function()
                --     require("lspconfig").phpactor.setup {
                --         capabilities = capabilities,
                --         init_options = {
                --             ["language_server_phpstan.enabled"] = false,
                --             ["language_server_psalm.enabled"] = false,
                --         }
                --     }
                -- end,

                ["intelephense"] = function()
                    require("lspconfig").intelephense.setup {
                        capabilities = capabilities,
                        settings = {
                            intelephense = {
                                licenceKey = secrets.intelephense_license_key,
                                stubs = {
                                    "apache", "bcmath", "bz2", "calendar", "com_dotnet", "Core", "curl", "date",
                                    "dba", "dom", "enchant", "fileinfo", "filter", "ftp", "gd", "gettext",
                                    "hash", "iconv", "imap", "intl", "json", "ldap", "libxml", "mbstring",
                                    "mcrypt", "mysql", "mysqli", "password", "pcntl", "pcre", "PDO",
                                    "pdo_mysql", "Phar", "readline", "recode", "Reflection", "regex",
                                    "session", "SimpleXML", "soap", "sockets", "sodium", "SPL", "standard",
                                    "superglobals", "sysvmsg", "sysvsem", "sysvshm", "tidy", "tokenizer",
                                    "xml", "xdebug", "xmlreader", "xmlrpc", "xmlwriter", "xsl", "Zend OPcache",
                                    "zip", "zlib",
                                    "laravel", "phpstan", "pint"
                                },
                                environment = {
                                    includePaths = {
                                        vim.fn.getcwd() .. '/vendor/laravel/framework/src'
                                    }
                                },
                                files = {
                                    maxSize = 5000000,
                                },
                            }
                        }
                    }
                end,

                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = { version = "Lua 5.1" },
                                diagnostics = {
                                    globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                                }
                            }
                        }
                    }
                end,
            }
        })

        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    vim.snippet.expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ["<C-Space>"] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
            })
        })

        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}
