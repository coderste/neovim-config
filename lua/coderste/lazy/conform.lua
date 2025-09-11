return {
    {
        'stevearc/conform.nvim',
        opts = {
            formatters_by_ft = {
                php = { "pint" },
                terraform = { "terraform_fmt" },
                typescript = { "prettier" },
                typescriptreact = { "prettier" },
                javascript = { "prettier" },
                javascriptreact = { "prettier" },
            },
            format_on_save = {
                timeout_ms = 2500,
                lsp_fallback = true
            },
            formatters = {
                pint = {
                    meta = {
                        url = "https://github.com/laravel/pint",
                        description = "Laravel Pint is an opinionated PHP code style fixer for minimalists. Pint is built on top of PHP-CS-Fixer and makes it simple to ensure that your code style stays clean and consistent.",
                    },
                    command = "pint",
                    args = { "--config", "pint.json" },  -- Optional: if you have a custom Pint config
                },
                terraform_fmt = {
                    meta = {
                        url = "https://www.terraform.io/docs/cli/commands/fmt.html",
                        description = "The terraform fmt command is used to rewrite Terraform configuration files to a canonical format and style.",
                    },
                    command = "terraform",
                    args = { "fmt", "-" },
                }
            }
        },
        config = function(_, opts)
            require("conform").setup(opts)

            -- Optional: Set up format-on-save
            vim.api.nvim_create_autocmd("BufWritePre", {
                pattern = "*.php,*.tf,*.tsx,*.ts,*.js,*.jsx",
                callback = function(args)
                    require("conform").format({ bufnr = args.buf, async = true })
                end,
            })

            -- Set up keymap for manual formatting
            vim.keymap.set("n", "<leader>fmt", function()
                require("conform").format({
                    lsp_fallback = true,
                    async = true,
                    timeout_ms = 2500,
                })
            end, { desc = "Format file" })
        end,
    }
}
