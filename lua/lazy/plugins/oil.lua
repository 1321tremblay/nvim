return {
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      default_file_explorer = false,
      view_options = {
        show_hidden = true,
      },
    },
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,

    vim.keymap.set("n", "-", function()
      require("oil").open()

      -- vim.wait(1000, function()
      --   return require("oil").get_cursor_entry() ~= nil
      -- end)
      --
      -- if require("oil").get_cursor_entry() then
      --   require("oil").open_preview()
      -- end
    end, { desc = "Open parent directory" }),
  },
}
