-- cmp-nvim-lspを安全にインポートする
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
    return
end

-- typescriptプラグインを安全にインポートする
local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
    return
end

local keymap = vim.keymap
local on_attach = function(client)
    -- TypeScript固有のキーマップ（ファイル名の変更、インポートの更新など）
    if client.name == "tsserver" then
        keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- ファイルの名前を変更し、import を更新する
        keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- import を整理
        keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- 未使用の変数を削除
    end
end

-- オートコンプリートを有効にするために使用（すべてのLSPサーバー設定に割り当て）
local capabilities = cmp_nvim_lsp.default_capabilities()

-- 記号列（ガター）のDiagnosticシンボルを変更
local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

return {
    mappings = {
        n = {
            -- ["<leader>lf"] = false -- disable formatting keymap
        },
    },
    on_attach = on_attach,
    -- 各サーバーを設定
    server_registration = function(server, opts)
        require("lspconfig")[server].setup(opts)
        -- require("lspconfig")["html"].setup({
        --   capabilities = capabilities,
        --   on_attach = on_attach,
        -- })
        require("lspconfig")["emmet_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
        })
        -- プラグインでtypescriptサーバを設定
        typescript.setup({
            server = {
                capabilities = capabilities,
                on_attach = on_attach,
            },
        })
    end,

    ["server-settings"] = {
        sumneko_lua = {
            settings = { -- luaのカスタム設定
                Lua = {
                    -- 言語サーバーが "vim "をグローバルに認識するようにする
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        -- 言語サーバにランタイムファイルを認識させる
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                    },
                },
            },
        },
        yamlls = {
            settings = {
                yaml = {
                    schemas = {
                        ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
                        ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
                        ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
                    },
                },
            },
        },
    },
}
