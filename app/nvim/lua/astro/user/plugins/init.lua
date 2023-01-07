return {
  {
    "kylechui/nvim-surround",
    tag = "*",
    config = function()
      require("nvim-surround").setup({})
    end,
  },
  { "nvim-lua/plenary.nvim" },
  { "szw/vim-maximizer" },
  { "rafamadriz/friendly-snippets" },
  { "inkarkat/vim-ReplaceWithRegister" },
  { "jose-elias-alvarez/typescript.nvim" },
  {
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
      local saga = require("lspsaga")
      saga.init_lsp_saga({
        -- ウィンドウのナビゲーション用キーバインド
        move_in_saga = { prev = "<C-k>", next = "<C-j>" },
        -- ファインダーでファイルを開くにはEnterキーを使用
        finder_action_keys = {
          open = "<CR>",
        },
        -- 定義プレビューでファイルを開くにはEnterキーを使用
        definition_action_keys = {
          edit = "<CR>",
        },
      })
    end,
  },
  { "mg979/vim-visual-multi" },
  { "christoomey/vim-tmux-navigator" },
  {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup({})
    end,
  },
  {
    "andrewferrier/debugprint.nvim",
    config = function()
      require("debugprint").setup()
    end,
  },
  { "thinca/vim-quickrun" },
  { "easymotion/vim-easymotion" },
  { "justinmk/vim-sneak" },
  { "windwp/nvim-spectre" },
}
