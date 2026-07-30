return {
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G" },
    keys = {
      { "<leader>gs", "<cmd>Git<cr>",      desc = "Git Status" },
      { "<leader>gp", "<cmd>Git push<cr>", desc = "Git Push" },
    },
  },
}
