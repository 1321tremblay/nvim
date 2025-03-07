return {
  {
    "MagicDuck/grug-far.nvim",
    config = function()
      require("grug-far").setup {
        -- options, see Configuration section below
        -- there are no required options atm
        -- engine = 'ripgrep' is default, but 'astgrep' can be specified
      }
    end,
    vim.keymap.set("n", "<leader>rg", function()
      require("grug-far").open()
    end, { desc = "Rename with grug-far" }),
  },
}
