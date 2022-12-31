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
})
