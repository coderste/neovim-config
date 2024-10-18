return {
    {
        'stevearc/conform.nvim',
        opts = {
            formatters_by_ft = {
                php = { "pint" },
                terraform = { "terraform_fmt" }
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
                pattern = "*.php, *.tf",
                callback = function(args)
                    require("conform").format({ bufnr = args.buf })
                end,
            })

            -- Set up keymap for manual formatting
            vim.keymap.set("n", "<leader>fmt", function()
                require("conform").format({
                    lsp_fallback = true,
                    async = false,
                    timeout_ms = 500,
                })
            end, { desc = "Format file" })
        end,
    }
}
