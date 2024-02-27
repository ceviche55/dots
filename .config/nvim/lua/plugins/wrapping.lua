return {
	"andrewferrier/wrapping.nvim",
	config = function()
		require("wrapping").setup()
	end,
	keys = function()
		return {
			{ "<leader>ws", "<cmd>SoftWrapMode<cr>", desc = "Soft Wrap" },
			{ "<leader>wh", "<cmd>HardWrapMode<cr>", desc = "Hard Wrap" },
			{ "<leader>wt", "<cmd>ToggleWrapMode<cr>", desc = "Toggle Wrap" },
		}
	end,
	opts = {
		notify_on_switch = false,
	},
}
