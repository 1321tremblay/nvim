return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function() end,
    init = function()
      vim.cmd.colorscheme("gruvbox")

      vim.api.nvim_set_hl(0, "SnacksPicker", { bg = "none" })
      -- Set the cursor line highlight to a custom color
      vim.api.nvim_set_hl(0, "CursorLine", { bg = "#111111" })
      vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "#111111", fg = "#d79921" })
      vim.api.nvim_set_hl(0, "visual", { bg = "#1e1e1e" })

      vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
      vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })

      -- vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })

      vim.api.nvim_set_hl(0, "DiagnosticSignError", { bg = "none", fg = "#cc241d" })
      vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { bg = "none", fg = "#d79921" })
      vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { bg = "none", fg = "#d65d0e" })
      vim.api.nvim_set_hl(0, "DiagnosticSignHint", { bg = "none", fg = "#98971a" })

      vim.api.nvim_set_hl(0, "WinSeparator", { bg = "none", fg = "#111111" })
      vim.api.nvim_set_hl(0, "PMenu", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { fg = "none", bg = "none" })
      vim.cmd.hi("Comment gui=none")
    end,
  },
}
