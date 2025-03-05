return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      heading = {
        position = "inline",
        width = "block",
        icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
        left_pad = 2,
        right_pad = 2,
      },
      code = {
        width = "block",
        left_pad = 2,
        right_pad = 2,
      },
    },
  },

  {
    "OXY2DEV/foldtext.nvim",
    lazy = false,
    opts = {
      default = {
        -- Add indentation for the fold text
        { type = "indent" },

        -- Show the heading title (first non-empty line of the fold)
        {
          type = "raw",
          text = function(_)
            local lines = vim.api.nvim_buf_get_lines(0, vim.v.foldstart - 1, vim.v.foldend + 1, false)
            local offset = 1

            while lines[offset]:find "%w" == nil do
              offset = offset + 1
            end

            local heading = lines[offset]:match "^%s*(.-)%s*$"

            local icons = {
              "󰲡 ", -- for level 1 heading
              "󰲣 ", -- for level 2 heading
              "󰲥 ", -- for level 3 heading
              "󰲧 ", -- for level 4 heading
              "󰲩 ", -- for level 5 heading
              "󰲫 ", -- for level 6 heading
            }

            local level = heading:match "^(#*)"
            local icon_index = #level
            icon_index = math.min(icon_index, #icons)
            local left_padding = " "

            return left_padding .. icons[icon_index] .. heading:sub(#level + 1)
          end,

          hl = "string",
          gradient_repeat = true,
        },
      },
    },
  },

  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = { -- Example mapping to toggle outline
      { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle [O]utline" },
    },
    opts = {
      symbol_folding = {
        -- Unfold entire symbol tree by default with false, otherwise enter a
        -- number starting from 1
        autofold_depth = false,
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
}
