return {
  "jay-babu/mason-nvim-dap.nvim",
  opts = {
    handlers = {
      codelldb = function(config)
        local dap = require("dap")

        dap.adapters.codelldb = {
          type = "executable",
          command = "codelldb",
        }

        dap.configurations.rust = {
          {
            name = "Launch file (Executable)",
            type = "codelldb",
            request = "launch",
            program = '${workspaceFolder}/target/debug/${workspaceFolderBasename}',
            cwd = '${workspaceFolder}',
            stopOnEntry = false,
          },
          {
            name = "Launch file (Select executable)",
            type = "codelldb",
            request = "launch",
            program = function()
              local abs_path = vim.fn.getcwd()
              local basename = string.gsub(abs_path, "(.*/)(.*)", "%2")

              return vim.fn.input(
                'Path to executable: ',
                abs_path .. '/target/debug/' .. basename,
                'file'
              )
            end,
            cwd = '${workspaceFolder}',
            stopOnEntry = false,
          },
        }

        require('mason-nvim-dap').default_setup(config)
      end,
    },
  },
}
