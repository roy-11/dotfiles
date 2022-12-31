-- Packerがインストールされていない場合、自動でインストール
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- packerがインストールされたらtrueになる

-- ファイル保存時にneovim を再読み込みし、プラグインをインストール/更新/削除するオートコマンド
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- packerを安全にインストールする
local status, packer = pcall(require, "packer")
if not status then
  return
end

-- インストールするプラグインのリスト
return packer.startup(function(use)
  use("wbthomason/packer.nvim") -- packer
  use("nvim-lua/plenary.nvim") -- 多くのプラグインで使用されているluaのユーティリティ関数
  use("bluz71/vim-nightfly-guicolors") -- カラースキーマ
  use("christoomey/vim-tmux-navigator") -- nvimの分割ウインドウとtmuxのpainをCtrl-hjklで移動するプラグイン
  use("szw/vim-maximizer") -- 窓を最大化して元に戻す
  use("tpope/vim-surround") -- surroundingsの追加・削除・変更
  use("inkarkat/vim-ReplaceWithRegister") -- gr + motionを使ってレギスタの内容で置換する
  use("numToStr/Comment.nvim") -- gc, gccでコメント化
  use("windwp/nvim-autopairs") -- 括弧や引用符を自動で閉じる
  use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- タグを自動で閉じる

  -- ui
  use("nvim-tree/nvim-tree.lua") -- ファイルエクスプローラ
  use("nvim-tree/nvim-web-devicons") -- vs-code風のアイコン
  use("nvim-lualine/lualine.nvim") -- ステータスライン

  -- telescopeと曖昧検索
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- ソート性能の向上のための依存性
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder

  -- 自動補完
  use("hrsh7th/nvim-cmp") -- 自動補完プラグイン
  use("hrsh7th/cmp-buffer") -- バッファ内のテキスト
  use("hrsh7th/cmp-path") -- ファイルシステムのパス

  -- スニペット
  use("L3MON4D3/LuaSnip") -- スニペットエンジン
  use("saadparwaiz1/cmp_luasnip") -- 自動補完表示
  use("rafamadriz/friendly-snippets") -- 便利なスニペット

  -- LSPサーバーとリンターとフォーマッターの管理・インストールプラグイン
  use("williamboman/mason.nvim") -- LSPサーバーとリンターとフォーマッターの管理
  use("williamboman/mason-lspconfig.nvim") --  masonとlsp configを連携させる

  -- LSPサーバーの設定
  use("neovim/nvim-lspconfig") -- lspサーバーの簡単な設定
  use("hrsh7th/cmp-nvim-lsp") -- 自動補完
  use({ "glepnir/lspsaga.nvim", branch = "main" }) -- lspのuiツール
  use("jose-elias-alvarez/typescript.nvim") -- typescriptサーバーの機能追加（ファイル名の変更、インポートの更新など）
  use("onsails/lspkind.nvim") -- オートコンプリートのためのvs-code風アイコン

  -- フォーマットとリント
  use("jose-elias-alvarez/null-ls.nvim") -- フォーマッターとリンターの設定
  use("jayp0521/mason-null-ls.nvim") -- masonとフォーマッターを連携させる

  -- treesitterの設定
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })

  -- gitとの連携
  use("lewis6991/gitsigns.nvim") -- 左側に行の変更を表示
  if packer_bootstrap then
    require("packer").sync()
  end
end)
