-- Map the left mouse button to pressing Enter while in oil buffer
vim.api.nvim_create_augroup("OilMouseBindings", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	group = "OilMouseBindings",
	pattern = "oil",
	callback = function()
		vim.api.nvim_buf_set_keymap(
			0,
			"n",
			"<LeftMouse>",
			[[<Cmd>lua local mouse = vim.fn.getmousepos(); vim.api.nvim_win_set_cursor(0, { mouse.line, mouse.column }); require("oil").select()<CR>]],
			{ noremap = true, silent = true }
		)
	end,
})

return {
	{
		"stevearc/oil.nvim",
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup({
				-- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
				-- Set to false if you still want to use netrw.
				default_file_explorer = true,
				-- Id is automatically added at the beginning, and name at the end
				-- See :help oil-columns
				columns = {
					"icon",
					-- "permissions",
					-- "size",
					-- "mtime",
				},
				-- Window-local options to use for oil buffers
				win_options = {
					signcolumn = "yes",
				},
				-- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
				delete_to_trash = false,
				-- Skip the confirmation popup for simple operations (:help oil.skip_confirm_for_simple_edits)
				skip_confirm_for_simple_edits = true,
				-- Selecting a new/moved/renamed file or directory will prompt you to save changes first
				-- (:help prompt_save_on_select_new_entry)
				prompt_save_on_select_new_entry = true,
				-- See :help oil-actions for a list of all available actions
				keymaps = {
					["<C-h>"] = false,
					["<C-l>"] = false,
				},
				view_options = {
					show_hidden = true,
				},
				override = function(conf)
					return conf
				end,

				-- Custom keymaps in oil buffer
			})
		end,
	},
}
