function ColorMyPencils(color)
    color = color or "ayu-dark"
    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, "Normal", {
        bg = "none"
    })
    vim.api.nvim_set_hl(0, "NormalFloat", {
        bg = "none"
    })
end

return {{
    'projekt0n/github-nvim-theme',
    name = 'github-theme',
    lazy = true, -- Changed to true
    config = function()
        require('github-theme').setup({
            options = {
                transparent = true
            }
        })
    end
}, {
    'no-clown-fiesta/no-clown-fiesta.nvim',
    name = 'no-clown-fiesta',
    lazy = true, -- Changed to true
    config = function()
        require('no-clown-fiesta').setup({
            transparent = true -- enables transparent background
        })
    end
}, {
    'shaunsingh/nord.nvim',
    lazy = true, -- Changed to true
    config = function()
        vim.g.nord_contrast = true
        vim.g.nord_borders = false
        vim.g.nord_disable_background = true
        vim.g.nord_italic = false
        require('nord').set()
    end
}, {
    "Shatur/neovim-ayu",
    name = "ayu",
    lazy = false, -- This stays false as your main theme
    priority = 1000,
    config = function()
        require('ayu').setup({
            mirage = false,
            terminal = true,
            overrides = {}
        })
        ColorMyPencils("ayu-dark") -- Make sure this is "ayu-dark"
    end
}}
