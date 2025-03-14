return {
  -- Bufferline {{{
  {
    "akinsho/bufferline.nvim",
    dependencies = {
      "moll/vim-bbye",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers", -- set to "tabs" to only show tabpages instead
          themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
          numbers = "buffer_id", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
          close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
          buffer_close_icon = "✗",
          close_icon = "✗",
          path_components = 1, -- Show only the file name without the directory
          modified_icon = "●",
          left_trunc_marker = "",
          right_trunc_marker = "",
          max_name_length = 30,
          max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
          tab_size = 21,
          diagnostics = false,
          diagnostics_update_in_insert = false,
          color_icons = true,
          show_buffer_icons = true,
          show_buffer_close_icons = false,
          show_close_icon = false,
          persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
          separator_style = { "│", "│" }, -- | "thick" | "thin" | { 'any', 'any' },
          enforce_regular_tabs = true,
          always_show_bufferline = true,
          show_tab_indicators = false,
          -- offsets = {
          --   {
          --     filetype = "snacks_picker", -- Hides Snacks Explorer from the tabline
          --     text = "",
          --     separator = false,
          --   },
          -- },
          indicator = {
            -- icon = '▎', -- this should be omitted if indicator style is not 'icon'
            style = "none", -- Options: 'icon', 'underline', 'none'
          },
          icon_pinned = "󰐃",
          minimum_padding = 1,
          maximum_padding = 5,
          maximum_length = 15,
          sort_by = "insert_at_end",
        },
        highlights = {
          separator = {
            bg = "none",
            fg = "#525252",
          },
          buffer_selected = {
            bold = true,
            italic = false,
            fg = "#ebdbb2",
          },
          -- separator_selected = {},
          -- tab_selected = {},
          background = {
            bg = "none",
          },
          fill = {
            bg = "none",
          },
          -- indicator_selected = {},
          -- fill = {},
        },
      })
    end,
  },
  --}}}

  -- Statusline {{{
  {
    "nvim-lualine/lualine.nvim",
    opts = function()
      return {
        options = {
          section_separators = "|",
          component_separators = "|",
          -- theme = {
          --   normal = { c = { bg = "NONE" } },
          -- },
        },
        sections = {
          lualine_y = {
            function()
              if vim.fn.reg_recording() ~= "" then
                return "Recording @" .. vim.fn.reg_recording()
              else
                return ""
              end
            end,
          },
          lualine_z = {},
        },
      }
    end,
  },
  --}}}

  -- Colorscheme {{{
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function() end,
    init = function()
      vim.cmd.colorscheme("gruvbox")

      vim.api.nvim_set_hl(0, "SnacksPicker", {
        bg = "#282828", -- Example background color, replace with your desired color
      })

      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = function()
          vim.cmd("highlight WinSeparator guibg=bg guifg=bg")
        end,
      })

      vim.cmd("highlight WinSeparator guibg=bg guifg=bg")

      vim.api.nvim_create_autocmd("WinEnter", {
        callback = function()
          vim.cmd("highlight Normal guibg=#282828") -- Focused window background
        end,
      })

      vim.api.nvim_create_autocmd("WinLeave", {
        callback = function()
          vim.cmd("highlight NormalNC guibg=#1d2021") -- Unfocused window background
        end,
      })

      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = function()
          vim.api.nvim_set_hl(0, "Pmenu", { bg = "#282828" })
        end,
      })
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { fg = "none", bg = "none" })
      vim.cmd.hi("Comment gui=none")
    end,
  },
  --}}}

  -- Noice {{{
  {
    "folke/noice.nvim",
    event = "VeryLazy",

    opts = {
      notify = { enabled = false },
      cmdline = {
        enabled = true,
        view = "cmdline",
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
  },
  --}}}

  -- Gitsigns {{{
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
      signs_staged = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
    },
  },
  --}}}

  -- Which-key {{{
  { -- Useful plugin to show you pending keybinds.
    "folke/which-key.nvim",
    event = "VimEnter", -- Sets the loading event to 'VimEnter'
    opts = {
      -- delay between pressing a key and opening which-key (milliseconds)
      -- this setting is independent of vim.opt.timeoutlen
      delay = 0,
      icons = {
        -- set icon mappings to true if you have a Nerd Font
        mappings = vim.g.have_nerd_font,
        -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
        -- default which-key.nvim defined Nerd Font icons, otherwise define a string table
        keys = vim.g.have_nerd_font and {} or {
          Up = "<Up> ",
          Down = "<Down> ",
          Left = "<Left> ",
          Right = "<Right> ",
          C = "<C-…> ",
          M = "<M-…> ",
          D = "<D-…> ",
          S = "<S-…> ",
          CR = "<CR> ",
          Esc = "<Esc> ",
          ScrollWheelDown = "<ScrollWheelDown> ",
          ScrollWheelUp = "<ScrollWheelUp> ",
          NL = "<NL> ",
          BS = "<BS> ",
          Space = "<Space> ",
          Tab = "<Tab> ",
          F1 = "<F1>",
          F2 = "<F2>",
          F3 = "<F3>",
          F4 = "<F4>",
          F5 = "<F5>",
          F6 = "<F6>",
          F7 = "<F7>",
          F8 = "<F8>",
          F9 = "<F9>",
          F10 = "<F10>",
          F11 = "<F11>",
          F12 = "<F12>",
        },
      },

      -- Document existing key chains
      spec = {
        -- { "<leader>c", group = "[C]ode", mode = { "n", "x" } },
        -- { "<leader>gh", group = "Git [H]unk", mode = { "n", "v" } },
        { "<leader>h", group = "Harpoon" },
        { "<leader>hv", group = "Harpoon Vertical" },
        { "<leader>t", group = "Toggle" },
        { "<leader>s", group = "Search" },
        { "<leader>f", group = "Find" },
        { "<leader>g", group = "Git" },
        { "<leader>n", group = "Notes" },
        { "<leader>b", group = "Buffer" },
        { "<leader>x", group = "Extra" },

        { "<leader>r", group = "Rename" },
      },
    },
  },
  --}}}

  -- Pretty-fold {{{
  -- {
  --   "anuvyklack/pretty-fold.nvim",
  --   config = function()
  --     require("pretty-fold").setup({
  --       config = {
  --         sections = {
  --           left = {
  --             "content",
  --           },
  --           right = {
  --             " ",
  --             "number_of_folded_lines",
  --             ": ",
  --             "percentage",
  --             " ",
  --             function(config)
  --               return config.fill_char:rep(3)
  --             end,
  --           },
  --         },
  --         fill_char = "•",
  --
  --         remove_fold_markers = true,
  --
  --         -- Keep the indentation of the content of the fold string.
  --         keep_indentation = true,
  --
  --         -- Possible values:
  --         -- "delete" : Delete all comment signs from the fold string.
  --         -- "spaces" : Replace all comment signs with equal number of spaces.
  --         -- false    : Do nothing with comment signs.
  --         process_comment_signs = "spaces",
  --
  --         -- Comment signs additional to the value of `&commentstring` option.
  --         comment_signs = {},
  --
  --         -- List of patterns that will be removed from content foldtext section.
  --         stop_words = {
  --           "@brief%s*", -- (for C++) Remove '@brief' and all spaces after.
  --         },
  --
  --         add_close_pattern = true, -- true, 'last_line' or false
  --
  --         matchup_patterns = {
  --           { "{", "}" },
  --           { "%(", ")" }, -- % to escape lua pattern char
  --           { "%[", "]" }, -- % to escape lua pattern char
  --         },
  --
  --         ft_ignore = { "neorg" },
  --       },
  --     })
  --   end,
  -- },
  --}}}

  -- Foldtext {{{

  -- {
  --   "OXY2DEV/foldtext.nvim",
  --   lazy = false,
  --   opts = {
  --     default = {
  --       -- Add indentation for the fold text
  --       { type = "indent" },
  --
  --       -- Show the heading title (first non-empty line of the fold)
  --       {
  --         type = "raw",
  --         text = function(_)
  --           local lines = vim.api.nvim_buf_get_lines(0, vim.v.foldstart - 1, vim.v.foldend + 1, false)
  --           local offset = 1
  --
  --           while lines[offset]:find "%w" == nil do
  --             offset = offset + 1
  --           end
  --
  --           local heading = lines[offset]:match "^%s*(.-)%s*$"
  --
  --           local icons = {
  --             "󰲡 ", -- for level 1 heading
  --             "󰲣 ", -- for level 2 heading
  --             "󰲥 ", -- for level 3 heading
  --             "󰲧 ", -- for level 4 heading
  --             "󰲩 ", -- for level 5 heading
  --             "󰲫 ", -- for level 6 heading
  --           }
  --
  --           local level = heading:match "^(#*)"
  --           local icon_index = #level
  --           icon_index = math.min(icon_index, #icons)
  --           local left_padding = " "
  --
  --           return left_padding .. icons[icon_index] .. heading:sub(#level + 1)
  --         end,
  --
  --         hl = "string",
  --         gradient_repeat = true,
  --       },
  --     },
  --   },
  -- },
  --}}}
}
