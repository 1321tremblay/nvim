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
  end,
})
-- Close help window with 'q'
vim.api.nvim_create_autocmd("FileType", {
  pattern = "help",
  callback = function()
    vim.api.nvim_buf_set_keymap(0, "n", "q", ":bd<CR>", { noremap = true, silent = true })
  end,
})
