return {
  "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically

  -- Autopairs DISABLED {{{
  -- { -- automatically pair parenthesis, brackets, etc ...
  --   "windwp/nvim-autopairs",
  --   event = "insertenter",
  --   -- optional dependency
  --   dependencies = { "hrsh7th/nvim-cmp" },
  --   config = function()
  --     require("nvim-autopairs").setup {}
  --     -- if you want to automatically add `(` after selecting a function or method
  --     local cmp_autopairs = require "nvim-autopairs.completion.cmp"
  --     local cmp = require "cmp"
  --     cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  --   end,
  -- },
  --}}}

  -- Tmux-navigation {{{
  {
    "alexghergh/nvim-tmux-navigation",
    event = "VeryLazy",
    config = function()
      local nvim_tmux_nav = require("nvim-tmux-navigation")
      nvim_tmux_nav.setup({
        disable_when_zoomed = true,
        -- defaults to false
        keybindings = {
          left = "<C-h>",
          down = "<C-j>",
          up = "<C-k>",
          right = "<C-l>",
          last_active = "<C-\\>",
          next = "<C-Space>",
        },
      })
    end,
  },
  --}}}

  -- Grug-far {{{
  {
    "MagicDuck/grug-far.nvim",
    config = function()
      require("grug-far").setup({
        -- options, see Configuration section below
        -- there are no required options atm
        -- engine = 'ripgrep' is default, but 'astgrep' can be specified
      })
    end,
    vim.keymap.set("n", "<leader>rg", function()
      require("grug-far").open()
    end, { desc = "Rename with grug-far" }),
  },
  --}}}

  -- Harpoon {{{
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      require("harpoon"):setup() -- Using colon to call the setup method on the harpoon module

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
  --}}}

  -- Render-Markdown {{{
  -- {
  --   "MeanderingProgrammer/render-markdown.nvim",
  --   dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
  --   -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
  --   -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  --   ---@module 'render-markdown'
  --   ---@type render.md.UserConfig
  --   opts = {
  --     heading = {
  --       position = "inline",
  --       width = "block",
  --       icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
  --       left_pad = 2,
  --       right_pad = 2,
  --     },
  --     code = {
  --       width = "block",
  --       left_pad = 2,
  --       right_pad = 2,
  --     },
  --   },
  -- },
  --}}}

  -- Outline {{{
  {
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
  },
  --}}}

  -- Notes {{{
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
    end,
  },
  --}}}

  -- Notes dev DISABLED {{{

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
  --}}}

  -- Oil {{{
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
  --}}}
}
