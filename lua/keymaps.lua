-- Setting <leader> key
vim.g.mapleader = " "

local map = vim.keymap.set

-- 📂 Neo-tree toggle
map("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle Neo-tree" })

-- ⬅️ Switch to the Neo-tree panel (or open it if it's closed)
map("n", "<C-h>", function()
  local found = false
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win))
    if bufname:match("neo%-tree filesystem") then
      vim.api.nvim_set_current_win(win)
      found = true
      break
    end
  end
  if not found then
    vim.cmd("Neotree toggle left filesystem")
  end
end, { desc = "Focus or open Neo-tree", noremap = true, silent = true })

-- ➡️ Go back to the file from Neo-tree
map("n", "<C-l>", function()
  local cur_win = vim.api.nvim_get_current_win()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if win ~= cur_win then
      local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win))
      if not bufname:match("neo%-tree") then
        vim.api.nvim_set_current_win(win)
        break
      end
    end
  end
end, { desc = "Focus file buffer from Neo-tree", noremap = true, silent = true })