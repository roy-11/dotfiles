-- nvim-cmpを安全にインポート
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
  return
end

-- luasnipを安全にインポート
local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
  return
end

-- lspkindを安全にインポート
local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
  return
end

-- 補完内容をソートする https://github.com/hrsh7th/nvim-cmp/issues/156#issuecomment-916338617
local lspkind_comparator = function(conf)
  local lsp_types = require("cmp.types").lsp
  return function(entry1, entry2)
    if entry1.source.name ~= "nvim_lsp" then
      if entry2.source.name == "nvim_lsp" then
        return false
      else
        return nil
      end
    end
    local kind1 = lsp_types.CompletionItemKind[entry1:get_kind()]
    local kind2 = lsp_types.CompletionItemKind[entry2:get_kind()]

    local priority1 = conf.kind_priority[kind1] or 0
    local priority2 = conf.kind_priority[kind2] or 0
    if priority1 == priority2 then
      return nil
    end
    return priority2 < priority1
  end
end

local label_comparator = function(entry1, entry2)
  return entry1.completion_item.label < entry2.completion_item.label
end

-- プラグインからVSコード風のスニペットをインストール(e.g. friendly-snippets)
require("luasnip/loaders/from_vscode").lazy_load()

vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-k>"] = cmp.mapping.select_prev_item(), -- 前の提案に移動
    ["<C-j>"] = cmp.mapping.select_next_item(), -- 次の提案に移動
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(), -- 補完ウインドウを表示
    ["<C-e>"] = cmp.mapping.abort(), -- 補完ウインドウを閉じる
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
  }),
  -- 自動補完のためのソース
  sources = cmp.config.sources({
    { name = "nvim_lsp" }, -- lsp
    { name = "luasnip" }, -- スニペット
    { name = "buffer" }, -- 現在のバッファからのテキスト
    { name = "path" }, -- ファイルシステムのパス
  }),
  -- VSコード風のiconのためにlspkindlを設定
  formatting = {
    format = lspkind.cmp_format({
      maxwidth = 50,
      ellipsis_char = "...",
    }),
  },
  sorting = {
    comparators = {
      lspkind_comparator({
        kind_priority = {
          Field = 11,
          Property = 11,
          Constant = 10,
          Enum = 10,
          EnumMember = 10,
          Event = 10,
          Function = 10,
          Method = 10,
          Operator = 10,
          Reference = 10,
          Struct = 10,
          Variable = 9,
          File = 8,
          Folder = 8,
          Class = 5,
          Color = 5,
          Module = 5,
          Keyword = 2,
          Constructor = 1,
          Interface = 1,
          Snippet = 0,
          Text = 1,
          TypeParameter = 1,
          Unit = 1,
          Value = 1,
        },
      }),
      label_comparator,
    },
  },
})
