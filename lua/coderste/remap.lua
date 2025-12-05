vim.g.mapleader = " "
vim.keymap.set("n", "<leader>q", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz", {
    noremap = true,
    silent = true
})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {
    noremap = true,
    silent = true
})
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<CR>")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- the best for cleaning logs from Grafana
vim.keymap.set("n", "<leader>cl", ":CleanLogJson<CR>", {
    desc = "Clean escaped JSON log"
})

-- Focus neo-tree from any window
vim.keymap.set('n', '<leader>nt', ':Neotree focus<CR>', {
    desc = 'Focus Neo-tree'
})

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", {
    silent = true
})

vim.keymap.set('n', '<C-[>', '<C-O>', {
    noremap = true,
    silent = true
})
vim.keymap.set('n', '<C-]>', '<C-I>', {
    noremap = true,
    silent = true
})

vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>")

vim.keymap.set("n", "<leader>bn", ":bnext<CR>", {
    desc = "Next buffer"
})
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", {
    desc = "Previous buffer"
})
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", {
    desc = "Delete buffer"
})
vim.keymap.set("n", "<Tab>", ":bnext<CR>", {
    desc = "Next buffer"
})
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", {
    desc = "Previous buffer"
})

-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", {
    desc = "Split vertically"
})
vim.keymap.set("n", "<leader>sh", "<C-w>s", {
    desc = "Split horizontally"
})
vim.keymap.set("n", "<leader>sx", ":close<CR>", {
    desc = "Close split"
})
vim.keymap.set("n", "<leader>se", "<C-w>=", {
    desc = "Equal split sizes"
})
