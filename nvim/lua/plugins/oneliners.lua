return {
  { -- ssh tunneling and copy clipboard
    'ojroques/vim-oscyank',
  },
  { -- css colors
    'brenoprata10/nvim-highlight-colors',
    config = function()
      require('nvim-highlight-colors').setup({})
    end
  },
  {
    "j-hui/fidget.nvim",
    opts = {
    },
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end
  }
}
