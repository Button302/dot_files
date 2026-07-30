return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 20,
        open_mapping = [[<C-\>]], -- Ctrl + \ toggles a normal terminal
        direction = "float",
      })

      -- Custom keybind to run current Python file
      vim.keymap.set("n", "<leader>pr", function()
        local file = vim.fn.expand("%")
        require("toggleterm").exec("python3 " .. file)
      end, { desc = "Python Run File" })
    end,
  },
}
