return { {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons"                                                              -- optional, but recommended
    },
    config = function()
        require("neo-tree").setup({
            close_if_last_window = false,
            window = {
                width = 30
            },
            filesystem = {
                follow_current_file = {
                    enabled = true
                },
                filtered_items = {
                    hide_dotfiles = false,
                    hide_gitignored = false,
                    hide_by_name = {
                        ".git",
                        "node_modules",
                    },
                    never_show = {
                        ".DS_Store",
                        "thumbs.db",
                    },
                },
            }
        })

        -- Keybindings
        vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', {
            desc = "Toggle Neo-tree"
        })
        vim.keymap.set('n', '<leader>pv', ':Neotree reveal<CR>', {
            desc = "Reveal file in Neo-tree"
        })
    end,
    lazy = false
} }
