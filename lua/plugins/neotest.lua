return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    'thenbe/neotest-playwright',
    -- dependencies = {
    --   'nvim-telescope/telescope.nvim',
    -- },
  },
  keys = {
    {
      "<leader>ter",
      function()
        require('neotest').run.run()
      end,
      desc = "Run tests"
    },
    {
      "<leader>tet",
      function()
        require("neotest").summary.toggle()
      end,
    },
  },
  config = function()
    require("neotest").setup({
      consumers = {
		    playwright = require('neotest-playwright.consumers').consumers,
	    },
			adapters = {
				require("neotest-playwright").adapter({
					options = {
						persist_project_selection = true,
						enable_dynamic_test_discovery = true,
					},
				}),
			},
		})
  end,
}
