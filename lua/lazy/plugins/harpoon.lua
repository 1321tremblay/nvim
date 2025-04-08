return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      require("harpoon"):setup()

      vim.keymap.set("n", "<leader>H", function()
        harpoon:list():add()
      end, { desc = "Harpoon [A]dd" })

      vim.keymap.set("n", "<leader>hc", function()
        harpoon:list():clear()
      end, { desc = "Harpoon [C]lear" })

      vim.keymap.set("n", "<leader>hm", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = "Harpoon [M]enu" })

      vim.keymap.set("n", "<leader>j", function()
        harpoon:list():select(1)
      end, { desc = "Harpoon [1]" })

      vim.keymap.set("n", "<leader>k", function()
        harpoon:list():select(2)
      end, { desc = "Harpoon [2]" })

      vim.keymap.set("n", "<leader>l", function()
        harpoon:list():select(3)
      end, { desc = "Harpoon [3]" })

      vim.keymap.set("n", "<leader>;", function()
        harpoon:list():select(4)
      end, { desc = "Harpoon [4]" })
    end,
  },
}
