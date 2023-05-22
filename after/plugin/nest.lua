local nest = require("nest")

local neotest = require("neotest")

nest.applyKeymaps({
	-- Remove silent from ; : mapping, so that : shows up in command mode
	{ ";", ":", options = { silent = false } },
	{ ":", ";" },
	{
		"<leader>",
		{
			{
				"n",
				{
					{
						"a",
						function()
							neotest.run.attach()
						end,
						options = { desc = "Attach" },
					},
					{
						"f",
						function()
							neotest.run.run(vim.fn.expand("%"))
						end,
						options = { desc = "Run File" },
					},
					{
						"F",
						function()
							neotest.run.run({ vim.fn.expand("%"), strategy = "dap" })
						end,
						options = { desc = "Debug File" },
					},
					{
						"l",
						function()
							neotest.run.run_last()
						end,
						options = { desc = "Run Last" },
					},
					{
						"L",
						function()
							neotest.run.run_last({ strategy = "dap" })
						end,
						options = { desc = "Debug Last" },
					},
					{
						"n",
						function()
							neotest.run.run()
						end,
						options = { desc = "Run Nearest" },
					},
					{
						"N",
						function()
							neotest.run.run({ strategy = "dap" })
						end,
						options = { desc = "Debug Nearest" },
					},
					{
						"o",
						function()
							neotest.output.open({ enter = true })
						end,
						options = { desc = "Output" },
					},
					{
						"s",
						function()
							neotest.summary.toggle()
						end,
						options = { desc = "Summary" },
					},
					{
						"S",
						function()
							neotest.run.stop()
						end,
						options = { desc = "Stop" },
					},
				},
			},
		},
	},
})

-- nest.applyKeymaps({
-- 	{
-- 		"<leader>",
-- 		{
-- 			{
-- 				"n",
-- 				{
-- 					{ "f", neotest.run.run(vim.fn.expand("%")), options = { desc = "Run File" } },
-- 				},
-- 			},
-- 		},
-- 	},
-- })
