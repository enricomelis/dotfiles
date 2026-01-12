return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		local conf = require("telescope.config").values

		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for i, item in ipairs(harpoon_files.items) do
				-- Format the display string with the index
				table.insert(file_paths, string.format("%d: %s", i, item.value))
			end

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = require("telescope.finders").new_table({
						results = file_paths,
					}),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
					attach_mappings = function(prompt_bufnr, map)
						-- Define what happens when you press Enter
						local actions = require("telescope.actions")
						local action_state = require("telescope.actions.state")

						actions.select_default:replace(function()
							local selection = action_state.get_selected_entry()
							if selection == nil then
								return
							end

							actions.close(prompt_bufnr)

							-- Extract the file path by removing the "index: " prefix
							-- This matches everything after the first space
							local _, _, _, path = string.find(selection.value, "(%d+):%s+(.*)")

							if path then
								vim.cmd("edit " .. path)
							else
								-- Fallback if regex fails
								vim.cmd("edit " .. selection.value)
							end
						end)
						return true
					end,
				})
				:find()
		end
		vim.keymap.set("n", "<leader>ht", function()
			toggle_telescope(harpoon:list())
		end, { desc = "Open harpoon window (telescope)" })

		local map = vim.keymap.set
		map("n", "<leader>hm", function()
			harpoon:list():add()
		end, { desc = "Mark this file" })

		map("n", "<leader>hq", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Open quick menu" })

		map("n", "<leader>hs1", function()
			harpoon:list():select(1)
		end, { desc = "Select 1st file from list" })
		map("n", "<leader>hs2", function()
			harpoon:list():select(2)
		end, { desc = "Select 2nd file from list" })
		map("n", "<leader>hs3", function()
			harpoon:list():select(3)
		end, { desc = "Select 3rd file from list" })

		map("n", "<leader>hr1", function()
			harpoon:list():remove(1)
		end, { desc = "Remove 1st file from list" })
		map("n", "<leader>hr2", function()
			harpoon:list():remove(2)
		end, { desc = "Remove 2nd file from list" })
		map("n", "<leader>hr3", function()
			harpoon:list():remove(3)
		end, { desc = "Remove 3rd file from list" })

		map("n", "<leader>hp", function()
			harpoon:list():prev()
		end, { desc = "Go to previous marked file" })
		map("n", "<leader>hn", function()
			harpoon:list():next()
		end, { desc = "Go to next marked file" })
	end,
}
