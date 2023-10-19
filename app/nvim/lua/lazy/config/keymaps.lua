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
map("n", "<Space>cp", "<cmd>let @+=expand('%:p')<CR>", { desc = "copy file path" })
map("n", "∂", ":m .-2<CR>==", { desc = "shift up one line" }) -- alt + kがyabaiとの競合で使用できないためalt + d
map("v", "∂", ":m '<-2<CR>gv-gv", { desc = "shift up one line in visual" }) -- alt + kがyabaiとの競合で使用できないためalt + d
map("n", "ƒ", ":m .+1<CR>==", { desc = "shift down one line" }) -- alt + jがyabaiとの競合で使用できないためalt + f
map("v", "ƒ", ":m '>+1<CR>gv-gv", { desc = "shift down one line in visual" }) -- alt + jがyabaiとの競合で使用できないためalt + f

----------------------
-- Plugin Keybinds
----------------------

map("n", "<Space>r", "<cmd>QuickRun<CR>", { desc = "run this file" })

map("n", "<leader>;", function()
  return require("debugprint").debugprint({ variable = true })
end, {
  expr = true,
  desc = "print a variable",
})

-- vim-tmux-navigatorとの競合のためCtrl-j,kは使用できないためalt + c,kに変更
-- 一行上下にマルチカーソルを作成
map("n", "ç", "<cmd>call vm#commands#add_cursor_up(0, v:count1)<CR>", { desc = "● Create multi-cursor up" })
map("n", "√", "<cmd>call vm#commands#add_cursor_down(0, v:count1)<CR>", { desc = "● Create multi-cursor down" })

-- ChatGPT.nvim
map("n", "<Space>cgi", "<cmd>ChatGPT<CR>", { desc = "normal interactive window" })
map("n", "<Space>cga", "<cmd>ChatGPTActAs<CR>", { desc = "open prompt selection" })
map("n", "<Space>cge", "<cmd>ChatGPTEditWithInstructions<CR>", { desc = "edit interactive window" })
map("n", "<Space>cgrg", "<cmd>ChatGPTRun grammar_correction<CR>", { desc = "grammar_correction" })
map("n", "<Space>cgrt", "<cmd>ChatGPTRun translate<CR>", { desc = "translate" })
map("n", "<Space>cgrk", "<cmd>ChatGPTRun keywords<CR>", { desc = "keywords" })
map("n", "<Space>cgrd", "<cmd>ChatGPTRun docstring<CR>", { desc = "docstring" })
map("n", "<Space>cgra", "<cmd>ChatGPTRun add_tests<CR>", { desc = "add_tests" })
map("n", "<Space>cgrs", "<cmd>ChatGPTRun summarize<CR>", { desc = "summarize" })
map("n", "<Space>cgrf", "<cmd>ChatGPTRun fix_bugs<CR>", { desc = "fix_bugs" })
map("n", "<Space>cgre", "<cmd>ChatGPTRun explain_code<CR>", { desc = "explain_code" })
map("n", "<Space>cgrr", "<cmd>ChatGPTRun roxygen_edit<CR>", { desc = "roxygen_edit" })
map("n", "<Space>cgrc", "<cmd>ChatGPTRun code_readability_analysis<CR>", { desc = "code_readability_analysis" })

-- Image
map(
  "n",
  "<Space>fi",
  "<cmd>lua require('telescope').extensions.media_files.media_files()<CR>",
  { desc = "preview images" }
)
