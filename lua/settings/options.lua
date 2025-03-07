vim.g.mapleader = " "

vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

-- Enable line number
vim.opt.number = true

--  enable relative lie number
vim.opt.relativenumber = true

-- Enable mouse mode
vim.opt.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Set undo history file path
vim.opt.undodir = os.getenv "HOME" .. "/.local/share/nvim/undodir"

-- Add @ and - to valid filename
vim.opt.isfname:append "@-@"

-- Set line break
vim.opt.linebreak = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "auto"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 3

-- set fillchars characters
vim.opt.fillchars:append {
  horiz = " ", -- Horizontal split
  horizup = " ",
  horizdown = " ",
  vert = " ", -- Vertical split
  vertleft = " ",
  vertright = " ",
  verthoriz = " ",
}

-- Set termguicolors to enable highlight groups (default: false)
vim.opt.termguicolors = true
