return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require "harpoon"
      require("harpoon"):setup() -- Using colon to call the setup method on the harpoon module

      vim.keymap.set("n", "<leader>ha", function()
        harpoon:list():add()
      end, { desc = "Harpoon [A]dd" })

      vim.keymap.set("n", "<leader>hc", function()
        harpoon:list():clear()
      end, { desc = "Harpoon [C]lear" })

      vim.keymap.set("n", "<leader>hm", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = "Harpoon [M]enu" })

      vim.keymap.set("n", "<leader>1", function()
        harpoon:list():select(1)
      end, { desc = "Harpoon [1]" })

      vim.keymap.set("n", "<leader>2", function()
        harpoon:list():select(2)
      end, { desc = "Harpoon [2]" })

      vim.keymap.set("n", "<leader>3", function()
        harpoon:list():select(3)
      end, { desc = "Harpoon [3]" })

      vim.keymap.set("n", "<leader>4", function()
        harpoon:list():select(4)
      end, { desc = "Harpoon [4]" })

      vim.keymap.set("n", "<leader>5", function()
        harpoon:list():select(5)
      end, { desc = "Harpoon [5]" })

      vim.keymap.set("n", "<leader>hv1", function()
        harpoon:list():select(1, { vsplit = true })
      end, { desc = "Harpoon vertical [1]" })

      vim.keymap.set("n", "<leader>hv2", function()
        harpoon:list():select(2, { vsplit = true })
      end, { desc = "Harpoon vertical [2]" })

      vim.keymap.set("n", "<leader>hv3", function()
        harpoon:list():select(3, { vsplit = true })
      end, { desc = "Harpoon vertical [3]" })

      vim.keymap.set("n", "<leader>hv4", function()
        harpoon:list():select(4, { vsplit = true })
      end, { desc = "Harpoon vertical [4]" })

      vim.keymap.set("n", "<leader>hv5", function()
        harpoon:list():select(5, { vsplit = true })
      end, { desc = "Harpoon vertical [5]" })
    end,
  },
}
