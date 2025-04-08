return {
  {
    "1321tremblay/notes.nvim",
    branch = "master",
    config = function()
      require("notes").setup({
        notes_dir = "$HOME/personal/notes",
        todo_file = "todo.md",
        file_explorer = "oil",
        fuzzy_finder = "picker",
      })
      -- key mappings using plug
      vim.keymap.set("n", "<leader>no", "<Plug>(OpenNotes)", { desc = "[O]pen" })
      vim.keymap.set("n", "<leader>nc", "<Plug>(CloseNotes)", { desc = "[C]lose" })
      vim.keymap.set("n", "<leader>nt", "<Plug>(OpenTodo)", { desc = "[T]odo" })
      vim.keymap.set("n", "<leader>ns", "<Plug>(SearchNotes)", { desc = "[S]earch" })
      vim.keymap.set("n", "<leader>ng", "<Plug>(GrepNotes)", { desc = "[G]rep" })
    end,
  },
}
