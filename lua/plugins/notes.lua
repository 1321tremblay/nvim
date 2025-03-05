return {
  {
    "1321tremblay/notes.nvim",
    branch = "master",
    config = function()
      require("notes").setup {
        notes_dir = "$HOME/personal/notes",
        todo_file = "todo.md",
        file_explorer = "oil",
        fuzzy_finder = "picker",
      }
      -- key mappings using plug
      vim.keymap.set("n", "<leader>no", "<Plug>(OpenNotes)", { desc = "[O]pen" })
      vim.keymap.set("n", "<leader>nc", "<Plug>(CloseNotes)", { desc = "[C]lose" })
      vim.keymap.set("n", "<leader>nt", "<Plug>(OpenTodo)", { desc = "[T]odo" })
      vim.keymap.set("n", "<leader>ns", "<Plug>(SearchNotes)", { desc = "[S]earch" })
    end,
  },

  -- {
  --   dir = "~/projects/notes.nvim/",
  --   branch = "refactor",
  --   config = function()
  --     require("notes").setup {
  --       notes_dir = "~/personal/notes",
  --       todo_file = "todo.md",
  --       file_explorer = "oil",
  --     }
  --
  --     -- Key mappings
  --     vim.keymap.set("n", "<leader>no", "<Plug>(OpenNotes)", { desc = "[N]otes [O]pen" })
  --     vim.keymap.set("n", "<leader>nc", "<Plug>(CloseNotes)", { desc = "[N]otes [C]lose" })
  --     vim.keymap.set("n", "<leader>nt", "<Plug>(OpenTodo)", { desc = "[N]otes [T]odo" })
  --     vim.keymap.set("n", "<leader>ns", "<Plug>(SearchNotes)", { desc = "[N]otes [S]earch" })
  --     vim.keymap.set("n", "<leader>nr", ":ReloadNotes<CR>", { desc = "Reload Notes Plugin" })
  --   end,
  -- },
}
