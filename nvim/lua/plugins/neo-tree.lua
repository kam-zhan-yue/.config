return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<C-n>", function()
			require("neo-tree.command").execute({
				toggle = true,
				dir = vim.loop.cwd(),
				source = "filesystem",
				position = "right",
				reveal = true,
			})
		end)
	end,
}
