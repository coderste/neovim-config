local builtin = require('telescope.builtin')
local telescope = require('telescope')

-- keymaps
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})

-- Telescope setup
telescope.setup {
	defaults = {
		file_ignore_patterns = {
			"node_modules",
			"vendor",
            "%.DS_Store"
		},
		color_devicons = true,
		set_env = { ['COLORTERM'] = 'truecolor' },
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.55,
			},
			vertical = {
				mirror = false,
			},
			width = 0.87,
			height = 0.80,
			preview_cutoff = 120,
		},
		-- Use transparent background
		winblend = 10,
	},
	pickers = {
		find_files = {
			hidden = true
		}
	}
}

-- Applying colors to Telescope, respecting transparent background
vim.cmd([[
  highlight TelescopeBorder guifg=#3e3e3e guibg=NONE
  highlight TelescopePromptBorder guifg=#3e3e3e guibg=NONE
  highlight TelescopeResultsBorder guifg=#3e3e3e guibg=NONE
  highlight TelescopePreviewBorder guifg=#3e3e3e guibg=NONE
  highlight TelescopeMatching guifg=#eb6f92
  highlight TelescopePromptPrefix guifg=#9ccfd8
  highlight TelescopeNormal guibg=NONE
  highlight TelescopePromptNormal guibg=NONE
  highlight TelescopeResultsNormal guibg=NONE
  highlight TelescopePreviewNormal guibg=NONE
]])
