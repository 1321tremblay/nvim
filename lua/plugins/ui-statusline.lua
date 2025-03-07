return {
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
}
