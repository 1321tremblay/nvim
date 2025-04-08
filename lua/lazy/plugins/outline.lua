return {
  "hedyhli/outline.nvim",
  lazy = true,
  cmd = { "Outline", "OutlineOpen" },
  keys = { -- Example mapping to toggle outline
    { "<leader>to", "<cmd>Outline<CR>", desc = "Toggle Outline" },
  },
  opts = {
    symbol_folding = {
      -- Unfold entire symbol tree by default with false, otherwise enter a
      -- number starting from 1
      autofold_depth = 1,
      -- autofold_depth = 1,
    },
    outline_window = {
      -- Percentage or integer of columns
      width = 33,
      show_numbers = true,
      show_relative_numbers = true,
      wrap = true,
      auto_close = true,
    },
  },
}
