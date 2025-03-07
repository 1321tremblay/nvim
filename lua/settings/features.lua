-- [[ Fold headings]]
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldenable = true
vim.opt.foldlevel = 99

local function fold_headings_of_level(level)
  local total_lines = vim.fn.line "$"
  for line = 1, total_lines do
    local line_content = vim.fn.getline(line)
    if line_content:match("^" .. string.rep("#", level) .. "%s") then
      vim.fn.cursor(line, 1)
      if vim.fn.foldclosed(line) == -1 then
        vim.cmd "normal! za"
      end
    end
  end
end

local function fold_markdown_headings(levels)
  local saved_view = vim.fn.winsaveview()
  for _, level in ipairs(levels) do
    fold_headings_of_level(level)
  end
  vim.cmd "nohlsearch"
  vim.fn.winrestview(saved_view)
end

vim.keymap.set("n", "z2", function()
  fold_markdown_headings { 2 }
end, { desc = "Fold Markdown H2+" })

vim.keymap.set("n", "zu", function()
  vim.cmd "normal! zR"
end, { desc = "Unfold all" })
