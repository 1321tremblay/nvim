return {

  {
    "nyoom-engineering/oxocarbon.nvim",
    init = function()
      vim.cmd.colorscheme "oxocarbon"
      -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      -- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    end,
  },
  -- {
  --   "EdenEast/nightfox.nvim",
  --   init = function()
  --     vim.cmd.colorscheme "carbonfox"
  --   end,
  -- },
  -- {
  --   "ellisonleao/gruvbox.nvim",
  --   priority = 1000,
  --   config = function()
  --   end,
  --   init = function()
  --     vim.cmd.colorscheme "gruvbox"
  --
  --     vim.api.nvim_set_hl(0, "SnacksPicker", {
  --       bg = "#282828", -- Example background color, replace with your desired color
  --     })
  --
  --     vim.api.nvim_create_autocmd("ColorScheme", {
  --       pattern = "*",
  --       callback = function()
  --         vim.cmd "highlight WinSeparator guibg=bg guifg=bg"
  --       end,
  --     })
  --
  --     vim.cmd "highlight WinSeparator guibg=bg guifg=bg"
  --
  --     vim.api.nvim_create_autocmd("WinEnter", {
  --       callback = function()
  --         vim.cmd "highlight Normal guibg=#282828" -- Focused window background
  --       end,
  --     })
  --
  --     vim.api.nvim_create_autocmd("WinLeave", {
  --       callback = function()
  --         vim.cmd "highlight NormalNC guibg=#1d2021" -- Unfocused window background
  --       end,
  --     })
  --
  --     vim.api.nvim_create_autocmd("ColorScheme", {
  --       pattern = "*",
  --       callback = function()
  --         vim.api.nvim_set_hl(0, "Pmenu", { bg = "#282828" })
  --       end,
  --     })
  --     -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  --     -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  --     -- vim.cmd.hi "Comment gui=none"
  --   end,
  -- },
}
