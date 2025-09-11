function ColorMyPencils(color)
    color = color or "ayu-dark"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    {
        'projekt0n/github-nvim-theme',
        name = 'github-theme',
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require('github-theme').setup({
                options = {
                    transparent = true,
                }
            })

            ColorMyPencils()
        end,
    },
    {
        'no-clown-fiesta/no-clown-fiesta.nvim',
        name = 'no-clown-fiesta',
        lazy = false,
        priority = 1000,
        config = function()
            require('no-clown-fiesta').setup({
                transparent = true -- enables transparent background
            })
            ColorMyPencils()
        end,
    },
    {
        'shaunsingh/nord.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.nord_contrast = true
            vim.g.nord_borders = false
            vim.g.nord_disable_background = true
            vim.g.nord_italic = false
            require('nord').set()
            ColorMyPencils("nord")
        end,
    },
    {
        "Shatur/neovim-ayu",
        name = "ayu",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
        require('ayu').setup({
            mirage = false, -- Set to true for mirage variant
            terminal = true, -- Configure terminal colors
            overrides = {
            -- You can add custom overrides here if needed
            }
        })
        ColorMyPencils()
        end,
    }
}
