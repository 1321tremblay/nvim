return {

  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    -- "luisiacc/gruvbox-baby",
    "ellisonleao/gruvbox.nvim",
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      -- contrast = "hard"
    end,
    init = function()
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      -- vim.cmd.colorscheme "gruvbox-baby"
      vim.cmd.colorscheme "gruvbox"

      vim.api.nvim_set_hl(0, "SnacksPicker", {
        bg = "#282828", -- Example background color, replace with your desired color
      })

      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = function()
          vim.cmd "highlight WinSeparator guibg=bg guifg=bg"
        end,
      })

      vim.cmd "highlight WinSeparator guibg=bg guifg=bg"

      vim.api.nvim_create_autocmd("WinEnter", {
        callback = function()
          vim.cmd "highlight Normal guibg=#282828" -- Focused window background
        end,
      })

      vim.api.nvim_create_autocmd("WinLeave", {
        callback = function()
          vim.cmd "highlight NormalNC guibg=#1d2021" -- Unfocused window background
        end,
      })

      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = function()
          vim.api.nvim_set_hl(0, "Pmenu", { bg = "#282828" })
        end,
      })
      -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      --
      -- -- You can configure highlights by doing something like:
      -- vim.cmd.hi "Comment gui=none"
    end,
  },
}
