--test
-- Keymaps

-- Move selection up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- Append line below to end of current line
vim.keymap.set("n", "J", "mzJ`z")
-- Put cursor in the middle when searching using /
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- Put cursor in the middle when going up or down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Copy selection in + register
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank selection into + register" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank line into + register" })

-- Tmux
vim.keymap.set("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", { silent = true })
vim.keymap.set("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", { silent = true })
vim.keymap.set("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>", { silent = true })
vim.keymap.set("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", { silent = true })

-- Delete into black hole register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete into black hole register" })

vim.keymap.set("n", "<leader>rn", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Rename in current file" })

vim.keymap.set("n", "<leader>xc", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<space>xx", "<cmd>source %<CR>")

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Source change in config w/o reloading
vim.keymap.set("n", "<space>xs", ":.lua<CR>")
vim.keymap.set("v", "<space>xs", ":lua<CR>")

-- Key mapping for hover
vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })

-- Navigate buffer
vim.keymap.set("n", "<Tab>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", opts)

-- git
vim.keymap.set("n", "<leader>ga", ":!git add .<CR>", { desc = "Git add all" })
-- Git commit (opens commit message in Neovim)
vim.keymap.set("n", "<leader>gc", function()
  vim.cmd "tabnew" -- Open a new tab
  vim.cmd "terminal git commit" -- Run `git commit` inside the terminal
  vim.cmd "startinsert" -- Enter insert mode automatically
end, { desc = "Git commit with message buffer" })

-- vim.keymap.set("n", "<leader>gc", ":!git commit<cr>", { desc = "Git commit" })
vim.keymap.set("n", "<leader>gp", function()
  local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD"):gsub("\n", "")
  vim.cmd("!git push origin " .. branch)
end, { desc = "Git push to origin" })

vim.keymap.set("n", "<leader>gP", function()
  local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD"):gsub("\n", "")
  vim.cmd("!git pull origin " .. branch)
end, { desc = "Git pull to origin" })
