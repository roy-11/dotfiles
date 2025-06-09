-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  -- local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  -- if not keys.active[keys.parse({ lhs, mode = mode }).id] then
  opts = opts or {}
  opts.silent = opts.silent ~= false
  vim.keymap.set(mode, lhs, rhs, opts)
  -- end
end

---------------------
-- General Keymaps
---------------------

map("n", "x", '"_x', { desc = "x but not register" })
map("n", "PP", '"0p', { desc = "paste the last y yunk" })
map("n", "<Space><CR>", "O<ESC>", { desc = "create new line" })
map("n", "<Space>o", "<C-O>", { desc = "back to previous line" })
map("n", "<Space>cp", "<cmd>let @+=expand('%:p')<CR>", { desc = "copy file path" })

-- shiit
-- map("n", "<C-S-k>", ":m .-2<CR>==", { desc = "shift up one line", noremap = true, silent = false })
-- map("v", "<Space><C-k>", ":m '<-2<CR>gv-gv", { desc = "shift up one line in visual" })
-- map("n", "<Space><C-j>", ":m .+1<CR>==", { desc = "shift down one line" })
-- map("v", "<Space><C-j>", ":m '>+1<CR>gv-gv", { desc = "shift down one line in visual" })

-- multi-cursor
map("n", "<C-k>", "<cmd>call vm#commands#add_cursor_up(0, v:count1)<CR>", { desc = "create multi-cursor up" })
map("n", "<C-j>", "<cmd>call vm#commands#add_cursor_down(0, v:count1)<CR>", { desc = "create multi-cursor down" })

----------------------
-- Plugin Keybinds
----------------------

map("n", "<leader><Space>", LazyVim.pick("auto", { root = false }), { desc = "Find Files (cwd)" })
map("n", "<Space>rf", "<cmd>QuickRun<CR>", { desc = "run this file" })

-- 検索
map("n", "<leader>sq", "<cmd>Telescope quickfix<CR>", { desc = "quickfix" })
map(
  "n",
  "<leader>sl",
  "<cmd>lua require('telescope.builtin').live_grep({ additional_args = function() return {'--multiline'} end })<CR>",
  { desc = "multiline" }
)

-- Image
-- map("n", "<Space>ri", '<cmd>lua require("image").setup()<CR>', { desc = "show image" })
-- map(
--   "n",
--   "<Space>fi",
--   "<cmd>lua require('telescope').extensions.media_files.media_files()<CR>",
--   { desc = "preview images" }
-- )
