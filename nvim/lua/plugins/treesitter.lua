return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    -- Change this line to match the new docs!
    local configs = require("nvim-treesitter")

    configs.setup({
      highlight = {
        enable = true,
      },
      indent = { enable = true },
      autotag = { enable = true },
      ensure_installed = {
        "lua",
        "qml",
        "qmljs",
        "javascript",
        "python",
      },
      auto_install = false,
    })
  end
}
