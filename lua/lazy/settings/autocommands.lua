vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

local group = vim.api.nvim_create_augroup("HelpWindow", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = "help",
  callback = function()
    vim.cmd("wincmd L")
    vim.cmd("vertical resize 85")
  end,
})
-- Close help window with 'q'
vim.api.nvim_create_autocmd("FileType", {
  pattern = "help",
  callback = function()
    vim.api.nvim_buf_set_keymap(0, "n", "q", ":bd<CR>", { noremap = true, silent = true })
  end,
})

-- vim.api.nvim_create_user_command("CopenV", function()
--   vim.cmd("vertical botright copen")
--   vim.cmd("vertical resize 85")
-- end, {})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    -- Only move if quickfix is not already a vertical split
    if vim.fn.winwidth(0) > vim.fn.winheight(0) then
      vim.cmd("wincmd J") -- Move it back down first (if needed)
      vim.cmd("wincmd H") -- Move to left
      vim.cmd("wincmd L") -- Then move to right
      vim.cmd("vertical resize 85")
      vim.opt_local.colorcolumn = ""
      vim.opt_local.wrap = false
    end
  end,
})
