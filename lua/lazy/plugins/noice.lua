return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",

    opts = {
      rotify = { enabled = false },
      cmdline = {
        enabled = true,
        view = "cmdline",
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
  },
}
