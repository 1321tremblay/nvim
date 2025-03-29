-- Settings

--  Autocommands {{{
-- vim.api.nvim_create_autocmd("VimEnter", {
--   callback = function()
--     local note_path = "/home/olivier/personal/notes/startup.md"
--     local current_cwd = vim.fn.getcwd() -- Save the original working directory
--     vim.cmd("edit " .. vim.fn.fnameescape(note_path))
--     vim.cmd("cd " .. vim.fn.fnameescape(current_cwd))
--   end,
-- })

-- vim.api.nvim_create_autocmd("VimEnter", {
--   callback = function()
--     local note_path = "/home/olivier/personal/notes/startup.md"
--     local dir = vim.fn.fnamemodify(note_path, ":h")
--
--     -- Create directory if it doesn't exist
--     if vim.fn.isdirectory(dir) == 0 then
--       vim.fn.mkdir(dir, "p")
--     end
--
--     vim.cmd("edit " .. vim.fn.fnameescape(note_path))
--   end,
-- })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.wo.foldmethod = "expr"
    vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.wo.foldenable = true
    vim.wo.foldlevel = 99

    local function fold_headings_of_level(level)
      local total_lines = vim.fn.line("$")
      for line = 1, total_lines do
        local line_content = vim.fn.getline(line)
        if line_content:match("^" .. string.rep("#", level) .. "%s") then
          vim.fn.cursor(line, 1)
          if vim.fn.foldclosed(line) == -1 then
            vim.cmd("normal! za")
          end
        end
      end
    end

    local function fold_markdown_headings(levels)
      local saved_view = vim.fn.winsaveview()
      for _, level in ipairs(levels) do
        fold_headings_of_level(level)
      end
      vim.cmd("nohlsearch")
      vim.fn.winrestview(saved_view)
    end

    vim.keymap.set("n", "z2", function()
      fold_markdown_headings({ 2 })
    end, { desc = "Fold Markdown H2+", buffer = true })

    vim.keymap.set("n", "zu", function()
      vim.cmd("normal! zR")
    end, { desc = "Unfold all", buffer = true })
  end,
})
-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_exec(
  [[
  augroup HelpWindow
    autocmd!
    autocmd FileType help wincmd L  " Move help window to the right (vertical split)
  augroup END
]],
  false
)

-- Close help window with 'q'
vim.api.nvim_create_autocmd("FileType", {
  pattern = "help",
  callback = function()
    vim.api.nvim_buf_set_keymap(0, "n", "q", ":quit<CR>", { noremap = true, silent = true })
  end,
})

-- }}}

-- Keymaps {{{
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

-- }}}

-- Options {{{
vim.g.mapleader = " "

vim.g.maplocalleader = " "

vim.opt.foldmethod = "marker"
vim.opt.foldcolumn = "0"
vim.opt.foldtext = ""

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
vim.opt.undodir = os.getenv("HOME") .. "/.local/share/nvim/undodir"

-- Add @ and - to valid filename
vim.opt.isfname:append("@-@")

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

-- Indent
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 3

-- set fillchars characters
vim.opt.fillchars:append({
  horiz = " ", -- Horizontal split
  horizup = " ",
  horizdown = " ",
  vert = " ", -- Vertical split
  vertleft = " ",
  vertright = " ",
  verthoriz = " ",
})

-- Set termguicolors to enable highlight groups (default: false)
vim.opt.termguicolors = true

-- }}}
