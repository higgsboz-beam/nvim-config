require("neotest").setup({
	adapters = {
		require("neotest-rspec"),
		require("neotest-plenary"),
		require("neotest-vim-test")({
			ignore_file_types = { "ruby", "vim", "lua" },
		}),
	},
})
