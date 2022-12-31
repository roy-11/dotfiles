-- lualineを安全にインポート
local status, lualine = pcall(require, "lualine")
if not status then
  return
end

-- lualineでnightflyのテーマを使用する
local lualine_nightfly = require("lualine.themes.nightfly")

-- 新しく用意したcolors
local new_colors = {
  blue = "#65D1FF",
  green = "#3EFFDC",
  violet = "#FF61EF",
  yellow = "#FFDA7B",
  black = "#000000",
}

-- nightflyの色を変更する
lualine_nightfly.normal.a.bg = new_colors.blue
lualine_nightfly.insert.a.bg = new_colors.green
lualine_nightfly.visual.a.bg = new_colors.violet
lualine_nightfly.command = {
  a = {
    gui = "bold",
    bg = new_colors.yellow,
    fg = new_colors.black,
  },
}

-- 変更したnightflyを適用する
lualine.setup({
  options = {
    theme = lualine_nightfly,
  },
})
