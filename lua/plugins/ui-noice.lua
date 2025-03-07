return {
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
}
