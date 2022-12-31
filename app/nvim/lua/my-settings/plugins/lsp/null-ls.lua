-- null-lsを安全にインストール
local setup, null_ls = pcall(require, "null-ls")
if not setup then
	return
end

local formatting = null_ls.builtins.formatting -- フォーマッターをセットアップ
local diagnostics = null_ls.builtins.diagnostics -- リンターをセットアップ

-- 保存時にフォーマットをセットアップ
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- null_lsを設定する
null_ls.setup({
	-- フォーマットとリンターをセットアップ
	sources = {
		--  特定のファイルタイプを無効にするには
		--  "formatting.prettier.with({disabled_filetypes: {}})" を使用 (null-ls docs を参照)
		formatting.prettier, -- js/tsのフォーマッター
		formatting.stylua, -- luaのフォーマッター
		diagnostics.eslint_d.with({ -- js/tsのリンター
			-- root に.eslintrc.js がある場合のみeslintを有効にする
			condition = function(utils)
				return utils.root_has_file(".eslintrc.js") -- 他のものを使用する場合はファイル拡張子を変更させる
			end,
		}),
	},
	-- 保存時のフォーマットを設定
	on_attach = function(current_client, bufnr)
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							-- lspサーバの代わりにnull-lsをフォーマット用に使うのみ
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
				end,
			})
		end
	end,
})
