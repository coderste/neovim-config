return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
      require("nvim-tree").setup({
        filters = {
            dotfiles = false,
            custom = { "^.git$", "^node_modules$", "^vendor$", "^.DS_Store$" },
            exclude = { ".gitignore", ".env", ".env.example", ".env.testing" }
        },
        renderer = {
            highlight_git = false,
            icons = {
                show = {
                    file = true,
                    folder = true,
                    folder_arrow = true,
                    git = true,
                },
            },
        },
    })
    end,
}