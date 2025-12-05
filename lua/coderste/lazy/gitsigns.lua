return {
    'lewis6991/gitsigns.nvim',
    config = function()
        require('gitsigns').setup({
            current_line_blame = true,
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = 'eol',
                delay = 500,
            },
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns
                vim.keymap.set('n', '<leader>gb', gs.toggle_current_line_blame, {
                    buffer = bufnr,
                    desc = "Toggle git blame"
                })
                vim.keymap.set('n', '<leader>gB', gs.blame_line, {
                    buffer = bufnr,
                    desc = "Git blame popup"
                })
                vim.keymap.set('n', '<leader>gp', gs.preview_hunk, {
                    buffer = bufnr,
                    desc = "Preview hunk"
                })
                vim.keymap.set('n', '[c', gs.prev_hunk, {
                    buffer = bufnr,
                    desc = "Previous hunk"
                })
                vim.keymap.set('n', ']c', gs.next_hunk, {
                    buffer = bufnr,
                    desc = "Next hunk"
                })
            end
        })
    end
}
